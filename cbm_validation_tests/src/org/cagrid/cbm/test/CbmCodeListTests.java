package org.cagrid.cbm.test;

import java.util.List;

import org.junit.Test;

public class CbmCodeListTests extends CbmTest {

   /*
    * TODO: Write the rest of these tests using the code list value retrieval methods to be added to
    * the CBM service.
    */
   @Test
   public void testDiagnosisCodeListExtraValues() throws Exception {
      extraValueTest(CodeList.DIAGNOSIS);
   }

   @Test
   public void testDiagnosisCodeListMissingValues() throws Exception {
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
         String errorMsg = "Remote code list contains the following extra values: \n";
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

}
