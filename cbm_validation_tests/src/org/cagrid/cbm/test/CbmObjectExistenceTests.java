package org.cagrid.cbm.test;

import gov.nih.nci.cagrid.metadata.common.UMLAttribute;
import gov.nih.nci.cagrid.metadata.common.UMLClassUmlAttributeCollection;
import gov.nih.nci.cagrid.metadata.dataservice.UMLClass;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Vector;

import org.junit.Test;

/**
 * @author powersb
 */
public class CbmObjectExistenceTests extends CbmTest {

   /*
    * TODO: Determine why Organization and Institution tests don't work. Verified that these objects
    * aren't working on either the IMS or Hollings CBM nodes
    */

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

   @Test
   public void testAddressAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.ADDRESS);
   }

   @Test
   public void testAnnotationAvailabilityProfileAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.ANNOTATION_AVAILABILITY_PROFILE);
   }

   @Test
   public void testCollectionProtocolAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.COLLECTION_PROTOCOL);
   }

   @Test
   public void testDiagnosisAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.DIAGNOSIS);
   }

   @Test
   public void testInstitutionAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.INSTITUTION);
   }

   @Test
   public void testOrganizationAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.ORGANIZATION);
   }

   @Test
   public void testParticipantCollectionSummaryAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.PARTICIPANT_COLLECTION_SUMMARY);
   }

   @Test
   public void testPreservationAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.PRESERVATION);
   }

   @Test
   public void testRaceAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.RACE);
   }

   @Test
   public void testSpecimenAvailabilitySummaryProfileAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.SPECIMEN_AVAILABILITY_SUMMARY_PROFILE);
   }

   @Test
   public void testSpecimenCollectionContactAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.SPECIMEN_COLLECTION_CONTACT);
   }

   @Test
   public void testSpecimenCollectionSummaryAttributes() throws Exception {
      checkAttributeExistenceForObject(CbmObject.SPECIMEN_COLLECTION_SUMMARY);
   }

   /**
    * This method introspectively retrieves the CBM attribute names by examining the getter method
    * of the CBM Java objects. TODO: Consider if this is a feasible long term solution for
    * generating the attribute list. Retrieving the attributes in this way makes the test more
    * flexible, however we can have more control over the attribute list if we just include them in
    * a file.
    * 
    * @param theCbmObject
    * @return
    * @throws SecurityException
    */
   private List<String> getAttributeList(CbmObject theCbmObject) throws SecurityException {
      Method[] methodList = theCbmObject.getCbmClass().getMethods();
      List<String> methodExcludeList = new Vector<String>();

      // Don't check these methods.
      methodExcludeList.add("getClass");

      List<String> attributeList = new Vector<String>();
      for (Method method: methodList) {
         String methodName = method.getName();

         boolean isExcluded = methodExcludeList.contains(methodName);
         boolean isGetter = methodName.startsWith("get") ? true : false;
         int numParameters = method.getGenericParameterTypes().length;

         if (!isExcluded && isGetter && numParameters == 0) {
            // Convert the method name to an attribute name
            String attributeName = methodName.replace("get", "");
            attributeName = Character.toLowerCase(attributeName.charAt(0)) + attributeName.substring(1);
            attributeList.add(attributeName);
         }
      }
      return attributeList;
   }

   protected void checkObjectExistence(CbmObject object) throws Exception {
      UMLClass[] umlClass = getUmlClassesFromService();

      for (UMLClass theClass: umlClass) {
         if (theClass.getClassName().equals(object.getSimpleName()))
            return;
      }

      fail("Unable to find class: " + object.getSimpleName());
   }

   protected void checkAttributeExistenceForObject(CbmObject object) throws Exception {
      UMLClass[] umlClass = getUmlClassesFromService();

      List<String> attributeList = getAttributeList(object);
      List<String> remoteAttributes = new Vector<String>();
      for (UMLClass theClass: umlClass) {
         System.out.println(theClass.getClassName());
         if (theClass.getClassName().equals(object.getSimpleName())) {
            UMLClassUmlAttributeCollection attrCollection = theClass.getUmlAttributeCollection();
            UMLAttribute[] umlAttributeList = attrCollection.getUMLAttribute();
            for (UMLAttribute attribute: umlAttributeList) {
               System.out.println(attribute.getName());
               remoteAttributes.add(attribute.getName());
            }
         }
         System.out.println("-----------------------------------");
      }

      List<String> missingItems = new Vector<String>();

      for (String remoteAttribute: remoteAttributes) {
         int index = attributeList.indexOf(remoteAttribute);
         if (index < 0) {
            missingItems.add(remoteAttribute);
         }
      }

      List<String> extraItems = new Vector<String>();

      for (String attribute: attributeList) {
         int index = remoteAttributes.indexOf(attribute);
         if (index < 0) {
            extraItems.add(attribute);
         }
      }

      if (missingItems.size() > 0) {
         StringBuffer errorMessage = new StringBuffer("Missing attributes in " + object.getSimpleName() + ":\n");
         for (String missingAttribute: missingItems) {
            errorMessage.append(missingAttribute + "\n");
         }
         fail(errorMessage.toString());
      }

      if (extraItems.size() > 0) {
         StringBuffer errorMessage = new StringBuffer("Extra attributes in " + object.getSimpleName() + ":\n");
         for (String extraItem: extraItems) {
            errorMessage.append(extraItem + "\n");
         }
         fail(errorMessage.toString());
      }

   }

   // /**
   // * Spin through the list of reference attributes for the given object and fail if the CBM node
   // * doesn't support the full list.
   // *
   // * @param theCbmObject
   // * @throws SecurityException
   // * @throws Exception
   // */
   // private void checkAttributeExistenceForObjectOld(CbmObject theCbmObject) throws
   // SecurityException, Exception {
   // List<String> attributeList = getAttributeList(theCbmObject);
   //
   // List<String> missingAttributeList = new Vector<String>();
   // for (String attributeName: attributeList) {
   // System.out.print("Checking object attribute: " + theCbmObject.getSimpleName() + "." +
   // attributeName);
   // try {
   // checkAttributeExistence(theCbmObject, attributeName);
   // }
   // catch (Exception e) {
   // System.out.println(".....not found");
   // missingAttributeList.add(attributeName);
   // }
   // System.out.println(".....found");
   // }
   //
   // if (missingAttributeList.size() > 0) {
   // StringBuffer errorMessage = new StringBuffer("Missing attributes in " +
   // theCbmObject.getSimpleName() + ":\n");
   // for (String missingAttribute: missingAttributeList) {
   // errorMessage.append(missingAttribute + "\n");
   // }
   // fail(errorMessage.toString());
   //
   // }
   //
   // }

   // /**
   // * This method retrieves a count of values for the given object. If an error is not thrown,
   // then
   // * it is assumed that the object has been found and exists for the CBM node.
   // *
   // * @param object
   // * @throws Exception
   // */
   // protected void checkObjectExistenceOld(CbmObject object) throws Exception {
   //
   // ObjectCountQueryBuilder builder = new ObjectCountQueryBuilder();
   // CQLQuery query = builder.getQuery(object);
   // serviceClient.query(query);
   //
   // }

   // /**
   // * This method retrieves all distinct values of the given attribute for the given class. If an
   // * error is not thrown, then it is assumed that the attribute has been found and exists for the
   // * given object in the CBM node. TODO: Update the CQL to limit the count of objects to only
   // one.
   // * There's no need to return the full list just for this test.
   // *
   // * @param object
   // * @param attributeName
   // * @throws Exception
   // */
   // protected void checkAttributeExistence(CbmObject object, String attributeName) throws
   // Exception {
   //
   // DistinctAttributesQueryBuilder builder = new DistinctAttributesQueryBuilder();
   // CQLQuery query = builder.getQuery(object, attributeName);
   // serviceClient.query(query);
   // }
}
