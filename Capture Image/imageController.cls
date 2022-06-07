public with sharing class imageController {
    @AuraEnabled

 public static void saveImageFile(String imageUrl, String recordId)

    {
       system.debug('imageUrl'+imageUrl);
        ContentVersion cv = new ContentVersion();
        cv.PathOnClient = 'Singed-'+System.now().getTime()+'.png';
        cv.Title = 'Singed-'+System.now().getTime()+'.png';
        cv.VersionData = blob.valueOf(imageUrl);
         insert cv;
      system.debug('cv'+cv);

   ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [select contentDocumentId from ContentVersion where id=:cv.id].contentDocumentId;
        cdl.LinkedEntityId = '0035g00000Eqrk1AAB';
        cdl.ShareType = 'V';
 
        insert cdl;
        system.debug('cdl'+cdl);
    }
}