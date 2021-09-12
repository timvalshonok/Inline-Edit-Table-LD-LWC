@isTest
public with sharing class InlineEditTableControllerTest {
    @isTest public static void GetAccountsTest() {
        List<Account> account = new List<Account>();
        account.add(new account(Name = 'abc'));
        insert account;

        test.startTest();
        List<Account> actual = InlineEditTableController.getAccounts();
        test.stopTest();

        List<Account> expected = [SELECT Id, Name, Rating FROM Account];
        System.assertEquals(expected, actual, 'Should be list of accounts with columns Name, Rating');
    }

    // @isTest public static void SaveDraftValuesTest() {
    //     Account account = new Account(Name = 'Test', Rating = 'Cold');
    //     insert account;
    //     Account updatedAccount = new Account(Id = account.Id, Name = 'Tested', Rating = 'Warm');

    //     test.startTest();
    //     List<Account> actual = AccountsController.saveDraftValues(updatedAccount);
    //     test.stopTest();

    //     List<Account> expected = [SELECT Name, Rating FROM Account];
    //     System.assertEquals(expected, actual, 'Should be account with updated Name, Rating columns ("Tested", "Warm")');
    // }
}
