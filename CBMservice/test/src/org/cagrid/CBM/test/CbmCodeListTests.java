package org.cagrid.CBM.test;

import java.util.List;

import org.junit.Test;

public class CbmCodeListTests extends CbmTest {

   @Test
   public void testSpecimenTypeDataValuesAreValid() throws Exception {
      checkRemoteAttributeValues(CodeList.SPECIMEN_TYPE);
   }

   @Test
   public void testRaceDataValuesAreValid() throws Exception {
      checkRemoteAttributeValues(CodeList.RACE);
   }

   @Test
   public void testDiagnosisDataValuesAreValid() throws Exception {
      checkRemoteAttributeValues(CodeList.DIAGNOSIS);
   }

   @Test
   public void testPreservationDataValuesAreValid() throws Exception {
      checkRemoteAttributeValues(CodeList.PRESERVATION);
   }

   @Test
   public void testAnatomicSourceDataValuesAreValid() throws Exception {
      checkRemoteAttributeValues(CodeList.ANATOMIC_SOURCE);
   }

   @Test
   public void testGenderDataValuesAreValid() throws Exception {
      checkRemoteAttributeValues(CodeList.GENDER);
   }

   @Test
   public void testEthnicityDataValuesAreValid() throws Exception {
      checkRemoteAttributeValues(CodeList.ETHNICITY);
   }


   @Test
   public void testDiagnosisCodeListExtraValues() throws Exception {
      extraValueTest(CodeList.DIAGNOSIS);
   }

   @Test
   public void testDiagnosisCodeListMissingValues() throws Exception {
      //TODO:  This will need to use the Enumeration API to retrieve values
	   missingValueTest(CodeList.DIAGNOSIS);
   }

   @Test
   public void testRaceCodeListExtraValues() throws Exception {
      extraValueTest(CodeList.RACE);
   }

   @Test
   public void testRaceCodeListMissingValues() throws Exception {
      missingValueTest(CodeList.RACE);
   }

   protected void extraValueTest(CodeList codeList) throws Exception {
      List<String> referenceValues = getReferenceCodeListValues(codeList);
      List<String> remoteValues = codeList.getRemoteCodeListValues();
      List<String> extraValues = compareCodeLists(referenceValues, remoteValues);

      if (extraValues.size() > 0) {
         String errorMsg = "Some data values do not conform to the CBM value domains.  For a list of the valid values, please visit: ";
         errorMsg += "/nTo resolve this issue, remove the following values from the CBM data: \n";
         String failMessage = buildFailMessage(errorMsg, extraValues);
         fail(failMessage);
      }
   }

   protected void missingValueTest(CodeList codeList) throws Exception {
      List<String> referenceValues = getReferenceCodeListValues(codeList);
      List<String> remoteValues = codeList.getRemoteCodeListValues();
      List<String> missingValues = compareCodeLists(remoteValues, referenceValues);

      if (missingValues.size() > 0) {
         String errorMsg = "Remote code list is missing the following values: \n";
         String failMessage = buildFailMessage(errorMsg, missingValues);
         fail(failMessage);
      }
   }

   private void checkRemoteAttributeValues(CodeList codeList) throws Exception {
      List<String> referenceValues = getReferenceCodeListValues(codeList);
      List<String> valuesFromNode = codeList.getRemoteDistinctValues();
      List<String> extraValues = compareCodeLists(referenceValues, valuesFromNode);

      if (extraValues.size() > 0) {
         String errorMsg = "The remote " + codeList.getCodeListName() + "data contains the following extra values: \n";
         String failMessage = buildFailMessage(errorMsg, extraValues);
         fail(failMessage);
      }
   }

}
