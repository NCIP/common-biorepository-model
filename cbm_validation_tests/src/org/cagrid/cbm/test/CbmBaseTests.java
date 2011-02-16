package org.cagrid.cbm.test;

import org.junit.Test;

/**
 * @author powersb
 */
public class CbmBaseTests extends CbmTest {

   /*
    * TODO: Determine why Organization and Institution tests don't work. Verified that these objects
    * aren't working on either the IMS or Hollings CBM nodes
    */

   @Test
   public void testConnection() {
      try {
         executeQueryFile(cqlDirectory + "diagnosisCount.xml");
      }
      catch (Exception e) {
         fail("Unable to connect to grid service end point " + this.serviceUrl + ": " + e.getMessage());
      }

   }

   @Test
   public void testAddressObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.ADDRESS);
   }

   @Test
   public void testAnnotationAvailibilityProfileObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.ANNOTATION_AVAILABILITY_PROFILE);
   }

   @Test
   public void testCollectionProtocolObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.COLLECTION_PROTOCOL);
   }

   @Test
   public void testDiagnosisObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.DIAGNOSIS);
   }

   @Test
   public void testInstitutionObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.INSTITUTION);
   }

   @Test
   public void testOrganizationObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.ORGANIZATION);
   }

   @Test
   public void testParticipantCollectionSummaryObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.PARTICIPANT_COLLECTION_SUMMARY);
   }

   @Test
   public void testPersonObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.PERSON);
   }

   @Test
   public void testPreservationObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.PRESERVATION);
   }

   @Test
   public void testRaceObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.RACE);
   }

   @Test
   public void testSpecimenAvailabilitySummaryProfileObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.SPECIMEN_AVAILABILITY_SUMMARY_PROFILE);
   }

   @Test
   public void testSpecimenCollectionContactObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.SPECIMEN_COLLECTION_CONTACT);
   }

   @Test
   public void testSpecimenCollectionSummaryObjectExistence() throws Exception {
      checkObjectExistence(CbmObject.SPECIMEN_COLLECTION_SUMMARY);
   }

   protected void checkObjectExistence(CbmObject object) throws Exception {

      StringBuffer cql = new StringBuffer();
      cql.append("<CQLQuery xmlns=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getObjectName() + "\"/>");
      cql.append("<QueryModifier countOnly=\"true\"/>");
      cql.append("</CQLQuery>");

      executeQueryString(cql.toString());

   }
}
