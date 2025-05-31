trigger ContentVersionTrigger on ContentVersion (after insert) {
    List<ProfessionalSkills__c> professionalSkillsToUpdate = new List<ProfessionalSkills__c>();
    Map<Id, String> contentDocumentIds = new Map<Id, String>();
    for (ContentVersion cv : Trigger.new) {
        if (cv.ContentDocumentId != null) {
            contentDocumentIds.put(cv.ContentDocumentId, cv.FirstPublishLocationId);
        }
    }

    if (!contentDocumentIds.isEmpty()) {
        List<ContentDocument> contentDocuments = [
            SELECT Id, LatestPublishedVersionId
            FROM ContentDocument
            WHERE Id IN :contentDocumentIds.keySet()
        ];

        for (ContentDocument cd : contentDocuments) {
            String firstPublishLocationId = contentDocumentIds.get(cd.Id);
            if (firstPublishLocationId != null) {
                String sObjectApiName = ContentVersionTriggerHandler.getSObjectApiNameFromId(firstPublishLocationId);
                if('ProfessionalSkills__c'.equalsIgnoreCase(sObjectApiName)){
                    ProfessionalSkills__c professionalSkill = new ProfessionalSkills__c(
                        Id = firstPublishLocationId,
                        IconURL__c = 'sfc/servlet.shepherd/version/download/' + cd.LatestPublishedVersionId
                    );
                    professionalSkillsToUpdate.add(professionalSkill);
                }
            }
        }
    }

    if(!professionalSkillsToUpdate.isEmpty()){
        update professionalSkillsToUpdate;
    }


    
}