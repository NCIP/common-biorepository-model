package org.cagrid.cbm.test;

import java.util.List;
import java.util.Vector;

import org.junit.Test;

public class CbmCodeListTests extends CbmTest {

   private static final String DIAGNOSIS_CODE_LIST_QUERY_FILE = cqlDirectory + "diagnosisCodeListQuery.xml";
   private static final String RACE_CODE_LIST_QUERY_FILE = cqlDirectory + "raceCodeListQuery.xml";

   @Test
   public void testDiagnosisCodeListExtraValues() throws Exception {
      extraValueTest(CodeList.DIAGNOSIS, DIAGNOSIS_CODE_LIST_QUERY_FILE);
   }

   @Test
   public void testDiagnosisCodeListMissingValues() throws Exception {
      missingValueTest(CodeList.DIAGNOSIS, DIAGNOSIS_CODE_LIST_QUERY_FILE);
   }

   @Test
   public void testRaceCodeListExtraValues() throws Exception {
      extraValueTest(CodeList.RACE, RACE_CODE_LIST_QUERY_FILE);
   }

   @Test
   public void testRaceCodeListMissingValues() throws Exception {
      missingValueTest(CodeList.RACE, RACE_CODE_LIST_QUERY_FILE);
   }

   /*
    * TODO: Write the rest of these tests using the code list value retrieval methods to be added to
    * the CBM service.
    */

   protected void extraValueTest(CodeList codeList, String queryFileName) throws Exception {
      String errorMsg = "Remote code list contains the following extra values: \n";
      try {
         List<String> remoteValues = getRemoteCodeListContents(codeList, queryFileName);
         List<String> referenceValues = getReferenceCodeListValues(codeList);

         findMissingValues(codeList, remoteValues, referenceValues, errorMsg);
      }
      catch (Exception e) {
         fail(e.getMessage());
      }
   }

   protected void missingValueTest(CodeList codeList, String queryFileName) throws Exception {
      String errorMsg = "Remote code list is missing the following values: \n";

      try {
         List<String> remoteValues = getRemoteCodeListContents(codeList, queryFileName);
         List<String> referenceValues = getReferenceCodeListValues(codeList);

         findMissingValues(codeList, referenceValues, remoteValues, errorMsg);
      }
      catch (Exception e) {
         fail(e.getMessage());
      }
   }

   protected void findMissingValues(CodeList codeList, List<String> left, List<String> right, String errorMsg) throws CbmException {

      List<String> missingValues = new Vector<String>();

      for (String value: left) {
         if (!right.contains(value)) {
            missingValues.add(value);
         }
      }

      if (missingValues.size() > 0) {
         StringBuffer allErrorValues = new StringBuffer();
         for (String value: missingValues) {
            allErrorValues.append(value + "; \n");
         }

         throw new CbmException(errorMsg + allErrorValues.toString());
      }

   }

}
