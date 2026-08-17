/**
 * @description Handler class for JobApplicationTrigger enforcing stage updates and recursion safety.
 */
public with sharing class JobApplicationTriggerHandler {
    
    private static Boolean isExecuting = false;

    public static void handleBeforeUpdate(List<Job_Application__c> newList, Map<Id, Job_Application__c> oldMap) {
        if (isExecuting) {
            return;
        }
        isExecuting = true;

        List<Job_Application__c> applicationsToProcess = new List<Job_Application__c>();

        for (Job_Application__c app : newList) {
            Job_Application__c oldApp = oldMap.get(app.Id);

            if (app.Stage__c != oldApp.Stage__c && app.Stage__c == 'Interviewing') {
                applicationsToProcess.add(app);
            }
        }

        if (!applicationsToProcess.isEmpty()) {
            autoUpdateLastInteractionDate(applicationsToProcess);
        }

        isExecuting = false;
    }

    private static void autoUpdateLastInteractionDate(List<Job_Application__c> appList) {
        for (Job_Application__c app : appList) {
            app.Last_Interaction_Date__c = Date.today();
        }
    }
}
