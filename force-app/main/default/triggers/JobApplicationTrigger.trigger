/**
 * @description Trigger on Job_Application__c custom object to delegate execution to handler framework.
 */
trigger JobApplicationTrigger on Job_Application__c (before update) {
    if (Trigger.isBefore && Trigger.isUpdate) {
        JobApplicationTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
    }
}
