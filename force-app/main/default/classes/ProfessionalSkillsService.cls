public without sharing class ProfessionalSkillsService {
    @AuraEnabled(cacheable=true)
    public static List<ProfessionalSkills__c> getProfessionalSkills() {
        return [SELECT Id, Name FROM ProfessionalSkills__c];
    }

    @AuraEnabled
    public static void saveProfessionalSkill(ProfessionalSkills__c skill) {
        upsert skill;
    }

    @AuraEnabled
    public static void deleteProfessionalSkill(Id skillId) {
        delete [SELECT Id FROM ProfessionalSkills__c WHERE Id = :skillId];
    }
}