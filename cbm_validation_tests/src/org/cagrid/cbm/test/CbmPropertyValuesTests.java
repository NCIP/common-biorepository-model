package org.cagrid.cbm.test;

import org.junit.Test;

public class CbmPropertyValuesTests extends CbmTest {
   @Test
   public void testSpecimenTypeDataValuesAreValid() throws Exception {
      // TODO: change this method to retrieve the values from the actual data tables
      // for comparison with the reference code list
      // extraValueTest(CodeList.SPECIMEN_TYPE);
      executeQueryFile(cqlDirectory + "distinctSpecimenType.xml");
   }
}
