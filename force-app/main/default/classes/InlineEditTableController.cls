public with sharing class InlineEditTableController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Rating FROM Account LIMIT 30];
    }

    @AuraEnabled
    public static void saveDraftValues(Object data) {
        List<Account> listOfAccounts = (List<Account>) JSON.deserialize(
            JSON.serialize(data),
            List<Account>.class
        );
        update listOfAccounts;
    }
}
