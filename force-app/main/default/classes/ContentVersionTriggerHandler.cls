public class ContentVersionTriggerHandler {
    public static String getSObjectApiNameFromId(Id recordId) {
        if (recordId == null) {
            return null; // Handle null Id gracefully
        }

        // 1. Get the Schema.SObjectType from the Id
        Schema.SObjectType sObjectType = recordId.getSObjectType();

        // 2. Get the DescribeSObjectResult from the SObjectType
        Schema.DescribeSObjectResult describeResult = sObjectType.getDescribe();

        // 3. Retrieve the object's API Name
        String objectApiName = describeResult.getName();

        return objectApiName;
    }
}