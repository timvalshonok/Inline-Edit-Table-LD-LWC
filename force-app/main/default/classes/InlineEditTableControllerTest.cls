@isTest
public with sharing class InlineEditTableControllerTest {

    @TestSetup
    static void setup(){
        
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name = 'Test', Rating = 'Cold'));
        insert accounts;
    }

    @isTest public static void GetAccountsTest() {

        test.startTest();
        List<Account> actual = InlineEditTableController.getAccounts();
        test.stopTest();

        List<Account> expected = [SELECT Id, Name, Rating FROM Account];
        System.assertEquals(expected, actual, 'Should be list of accounts with columns Name, Rating');
    }

    @isTest public static void SaveDraftValuesTest() {

        List<Account> accounts = [SELECT Id, Name, Rating FROM Account WHERE Name='Test' AND Rating='Cold' LIMIT 1];
        accounts[0].Name = 'Tested';
        accounts[0].Rating = 'Warm';

        test.startTest();
        InlineEditTableController.saveDraftValues(accounts);
        test.stopTest();

        List<Account> expected = [SELECT Name, Rating FROM Account WHERE Name='Tested' AND Rating='Warm'];
        System.assertEquals(expected, accounts, 'Should be account with updated Name, Rating columns ("Tested", "Warm")');
    }
}
