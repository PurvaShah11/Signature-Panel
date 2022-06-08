public with sharing class imageController {

@AuraEnabled
public static void saveImageFile(String imageUrl, String recordId)

{
    
    ContentVersion cv = new ContentVersion();
    cv.PathOnClient = 'UserImage-'+System.now().getTime()+'.png';
    cv.Title = 'UserImage-'+System.now().getTime()+'.png';
    cv.VersionData = EncodingUtil.base64Decode(imageUrl);
    insert cv;
    

ContentDocumentLink cdl = new ContentDocumentLink();
    cdl.ContentDocumentId = [select contentDocumentId from ContentVersion where id=:cv.id].contentDocumentId;
    cdl.LinkedEntityId = recordId;
    cdl.ShareType = 'V';

    insert cdl;
    
}
}