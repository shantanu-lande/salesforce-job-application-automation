/**
 * @description Unit test suite validating Governor Limits and stage transition logic.
 */
@isTest
private class JobApplicationTriggerTest {

    @isTest
    static void testStageTransitionBulk() {
        List<Job_Application__c> testApps = new List<Job_Application__c>();
        for (Integer i = 0; i < 200; i++) {
            testApps.add(new Job_Application__c(
                Company_Name__c = 'Tech Corp ' + i,
                Stage__c = 'Applied'
            ));
        }
        insert testApps;

        Test.startTest();
        for (Job_Application__c app : testApps) {
            app.Stage__c = 'Interviewing';
        }
        update testApps;
        Test.stopTest();

        List<Job_Application__c> updatedApps = [
            SELECT Id, Stage__c, Last_Interaction_Date__c 
            FROM Job_Application__c 
            WHERE Id IN :testApps
        ];

        for (Job_Application__c app : updatedApps) {
            System.assertEquals('Interviewing', app.Stage__c, 'Stage should be updated to Interviewing.');
            System.assertEquals(Date.today(), app.Last_Interaction_Date__c, 'Last interaction date should be set to today.');
        }
    }
}
