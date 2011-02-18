package org.cagrid.cbm.test;

import java.util.List;

import org.junit.Test;

/**
 * These tests compare the data in CBM attribute values against code lists
 * 
 * @author powersb
 */
public class CbmAttributeValuesTests extends CbmTest {
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
