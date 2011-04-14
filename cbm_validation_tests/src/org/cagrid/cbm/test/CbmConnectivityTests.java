package org.cagrid.cbm.test;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;

import org.cagrid.cbm.test.query.ObjectCountQueryBuilder;
import org.junit.Test;

/**
 * @author powersb
 */
public class CbmConnectivityTests extends CbmTest {

   /*
    * TODO: Determine why Organization and Institution tests don't work. Verified that these objects
    * aren't working on either the IMS or Hollings CBM nodes
    */

   /*
    * TODO: Test that the service is in the caGrid index, and check metadata?. How do we know which
    * index to test?
    */

   @Test
   public void testConnection() {
      try {
    	  ObjectCountQueryBuilder builder = new ObjectCountQueryBuilder();
    	  CQLQuery query = builder.getQuery(CbmObject.DIAGNOSIS);
    	  serviceClient.query(query);
    	  
      }
      catch (Exception e) {
         fail("Unable to connect to grid service end point " + serviceUrl + ": " + e.getMessage());
      }

   }

}
