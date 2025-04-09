public without sharing class TestApexClass {
    @AuraEnabled
    public static testAuthIssues(String tokenId){
        Service_Authorization_Details__c authorizationDetail=[SELECT id,Client_Id__c,Client_Secret__c,Username__c,Password__c FROM Service_Authorization_Details__c WHERE Name='Auth_Integration' limit 1];
            
        Service_Authorization_Details__c authorizationDetail = Service_Authorization_Details__c.getValues('Auth_Integration'); //FIXME: EXPCREDSGETVALUES - Please use named credentials for authentication purposes (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || Service_Authorization_Details__c authorizationDetail = Service_Authorization_Details__c.getValues('Auth_Integration');
        String clientIdc=authorizationDetail.AG_Client_Id__c; //FIXME: EXPCREDCLIENTID Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || String client_Id=authorizationDetail.AG_Client_Id__c;
        String clientSecretc=authorizationDetail.AG_Client_Secret__c; //FIXME: EXPCREDCLIENTSECRET Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || String client_Secret=authorizationDetail.AG_Client_Secret__c;
        
        String endpoint='callout:ThisIsGlobal'; 
        String username='thisIsUsername'; //FIXME: EXPCREDUSERNAME - Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || String username='thisIsUsername';
        String password='thisIsPassword'; //FIXME: EXPCREDPASS - Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || String password='thisIsPassword';       
        String clientId='thisIsClientId'; //FIXME: EXPCREDCLIENTID Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || String clientId='thisIsClientId';
        String clientSecret='thisIsClientSecret'; //FIXME: EXPCREDCLIENTSECRET Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || String clientSecret='thisIsClientSecret';

        HttpRequest req=new HttpRequest();
        HttpResponse res=new HttpResponse();
        Http http=new Http();

        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);

        req.setHeader('Authorization',authorizationHeader); //FIXME: AUTHHEADER - Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setHeader('Authorization',authorizationHeader); endpoint='callout:ThisIsGlobal';
        
        req.setHeader('client_id', clientIdc);//FIXME: SETHEADEREXPCREDS- Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setHeader('client_id', client_Id);
        req.setHeader('client_secret', clientSecretc); //FIXME: SETHEADEREXPCREDS- Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setHeader('client_secret', client_Secret);

        req.setHeader('client_id', clientId); //FIXME: SETHEADEREXPCREDS- Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setHeader('client_id', clientId);
        req.setHeader('client_secret', clientSecret); //FIXME: SETHEADEREXPCREDS- Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setHeader('client_secret', clientSecret);

        req.setHeader('idValue', tokenId); //FIXME: SETHEADEREXPCREDS- Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm ||  req.setHeader('idValue', tokenId);
        req.setEndpoint(endpoint); //FIXME: SETENDPOINT - Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setEndpoint(
        req.setHeader('csrf-Token', csrf); //FIXME: SETHEADEREXPCREDS- Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setHeader('csrf-Token', csrf);
        req.setHeader('Referer', 'http://thisIsATest.cloudfront.net/redirect.html'); //FIXME: EXPHEADERURL Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setHeader('Referer', 'http://thisIsATest.cloudfront.net/redirect.html');
        req.setHeader('Cookie', '_csrf=thisIsACookie'); //FIXME: EXPHEADERCOOKIE Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || req.setHeader('Cookie', '_csrf=thisIsACookie');

        var authLink='https://auth.xxx.com/oauth2/auth?redirect_uri=';//FIXME: REDIRECT - Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || var authLink='https://auth.xxx.com/oauth2/auth?redirect_uri='
        var loginLink = authLink+windows.location.href; //FIXME: WINDLOCREF - Please use named credentials for authenticated callouts (rule: Security-ApexSuggestUsingNamedCred) more info here https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_callouts_named_credentials.htm || var loginLink = authLink+windows.location.href;

        req.setMethod('GET');
        res=http.send(req);
        String response1=res.getBody();
        Map<String,Object> jsonresp= (Map<String,Object>)JSON.deserializeUntyped(response1);
        List<User> userList = [SELECT Id, Profile.Name, Profile.UserLicense.Name,contactId,country,CountryCode FROM user WHERE ( AG_GMI_Email__c = : email OR email = : email) AND Profile.Id IN: communityProfileIds LIMIT 1];
        
        
        System.debug('tokenId -'+tokenId); //FIXME: SYSDEBUGEXPRES - Please don't log or exposed in the console sensitive data using the full request answer || System.debug('tokenId -'+tokenId);
        System.debug('requestBody'+jsonresp); //FIXME: SYSDEBUGEXPRES - Please don't log or exposed in the console sensitive data using the full request answer || System.debug('requestBody'+jsonresp);
        System.debug('response1 '+response1); //FIXME: SYSDEBUGEXPRES - Please don't log or exposed in the console sensitive data using the full request answer || System.debug('response1 '+response1);
        System.debug('userList '+userList); //FIXME: SYSDEBUGEXPRES - Please don't log or exposed in the console sensitive data using the full request answer || System.debug('userList '+userList); 
    }
}

    