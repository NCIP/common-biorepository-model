package org.cagrid.cbm.test;

import gov.nih.nci.cagrid.common.Utils;
import gov.nih.nci.cagrid.cqlquery.CQLQuery;
import gov.nih.nci.cagrid.cqlresultset.CQLQueryResults;
import gov.nih.nci.cagrid.cqlresultset.TargetAttribute;
import gov.nih.nci.cagrid.data.client.DataServiceClient;
import gov.nih.nci.cagrid.data.utilities.CQLQueryResultsIterator;
import gov.nih.nci.cbm.domain.LogicalModel.Diagnosis;
import gov.nih.nci.cbm.domain.LogicalModel.Preservation;
import gov.nih.nci.cbm.domain.LogicalModel.Race;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.StringReader;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

import org.junit.BeforeClass;

/**
 * CBM validation test base class used to define shared attributes, enums, and methods.
 * 
 * @author powersb
 */

public abstract class CbmTest extends junit.framework.TestCase {

   protected String serviceUrl;
   protected DataServiceClient serviceClient;
   protected static final String cqlDirectory = "./cql/";
   protected static final String referenceDirectory = "./cbm_reference/";
   protected static List<String> remoteDiagnosisList = new Vector<String>();
   protected static List<String> remoteRaceList = new Vector<String>();
   protected static List<String> remotePreservationList = new Vector<String>();
   protected static List<String> remoteSpecimenTypeList = new Vector<String>();

   protected enum CodeList {
      // TODO: add gender and ethnicity
      DIAGNOSIS("Diagnosis", "diagnosis_list.txt", "TODO", remoteDiagnosisList), PRESERVATION("Preservation", "preservation_list.txt", "TODO", remotePreservationList), RACE("Race", "race_list.txt",
               "TODO", remoteRaceList), SPECIMEN_TYPE("specimenType", "specimen_type_list.txt", "TODO", remoteSpecimenTypeList);

      String codeListName;
      String definitionFileName;
      String distinctValuesQueryFile;
      List<String> remoteCodeListValues;

      protected String getCodeListName() {
         return codeListName;
      }

      protected String getDefinitionFileName() {
         return definitionFileName;
      }

      protected String getDistinctValuesQueryFile() {
         return distinctValuesQueryFile;
      }

      protected List<String> getRemoteCodeListValues() {
         return remoteCodeListValues;
      }

      private CodeList(String theCodeListName, String theDefinitionLocation, String theDistinctValuesQueryFile, List<String> theRemoteCodeList) {
         codeListName = theCodeListName;
         definitionFileName = theDefinitionLocation;
         remoteCodeListValues = theRemoteCodeList;
         distinctValuesQueryFile = theDistinctValuesQueryFile;
      }

      @Override
      public String toString() {
         return codeListName;
      }

   };

   protected enum CbmObject {
      ADDRESS("Address"), ANNOTATION_AVAILABILITY_PROFILE("AnnotationAvailabilityProfile"), COLLECTION_PROTOCOL("CollectionProtocol"), DIAGNOSIS("Diagnosis"), INSTITUTION("Institution"), ORGANIZATION(
               "Organization"), PARTICIPANT_COLLECTION_SUMMARY("ParticipantCollectionSummary"), PERSON("Person"), PRESERVATION("Preservation"), RACE("Race"), SPECIMEN_AVAILABILITY_SUMMARY_PROFILE(
               "SpecimenAvailabilitySummaryProfile"), SPECIMEN_COLLECTION_CONTACT("SpecimenCollectionContact"), SPECIMEN_COLLECTION_SUMMARY("SpecimenCollectionSummary");

      String objectName;

      private CbmObject(String theObjectName) {
         objectName = theObjectName;
      }

      protected String getObjectName() {
         return objectName;
      }
   }

   @Override
   @BeforeClass
   public void setUp() throws Exception {
      /*
       * TODO: Pull URL from environment args set value in one of the following: - ant build script;
       * test execution script; as argument to test execution script
       */

      // IMS CBM URL
      // this.serviceUrl = "https://cabigapps01.cancer.gov:9295/wsrf/services/cagrid/CBM";

      // Hollings Cancer Center CBM URL
      this.serviceUrl = "http://128.23.35.126:8080/wsrf/services/cagrid/CBM";

      serviceClient = new DataServiceClient(serviceUrl);
   }

   /**
    * Tears down the test fixture. Called after every test case method.
    */
   @Override
   protected void tearDown() {
      // release objects under test here, if necessary
   }

   /**
    * Retrieves a string array containing the complete list of code list values for the given code
    * list name. TODO: Consider pulling the list of valid code list values from a reference CBM
    * model rather than a text file.
    * 
    * @param codeListName
    * @return
    */
   protected List<String> getReferenceCodeListValues(CodeList codeList) throws Exception {
      String fileName = referenceDirectory + codeList.getDefinitionFileName();
      Scanner scanner = new Scanner(new FileInputStream(fileName));
      List<String> codeListValue = new Vector<String>();
      while (scanner.hasNextLine()) {
         String line = scanner.nextLine();
         String[] valuePair = line.split(";");
         String value = valuePair[0];
         value = value.replace("\"", "");
         codeListValue.add(value);
      }
      return codeListValue;
   }

   /**
    * TODO: This method only pulls 1000 values from the service currently. Need to account for more
    * values.
    * 
    * @param queryFilename
    * @return
    * @throws Exception
    */
   protected CQLQueryResults executeQueryFile(String queryFilename) {
      CQLQuery query;
      CQLQueryResults results;
      try {
         query = (CQLQuery)Utils.deserializeDocument(queryFilename, CQLQuery.class);
         results = serviceClient.query(query);
         return results;
      }
      catch (Exception e) {
         fail("Exception executing query: " + e.getMessage());
      }

      return null;

   }

   protected CQLQueryResults executeQueryString(String queryString) throws Exception {
      CQLQuery query = (CQLQuery)gov.nih.nci.cagrid.common.Utils.deserializeObject(new StringReader(queryString), CQLQuery.class);
      CQLQueryResults results = serviceClient.query(query);
      return results;
   }

   /**
    * Retrieves the full contents of a remote codelist.
    * 
    * @param codeList
    * @return
    * @throws CbmException
    */
   protected List<String> getRemoteCodeListContents(CodeList codeList, String fileName) throws CbmException {
      CQLQueryResults results = executeQueryFile(fileName);
      InputStream resourceAsStream = CbmCodeListTests.class.getResourceAsStream("client-config.wsdd");
      Iterator<?> iter = new CQLQueryResultsIterator(results, resourceAsStream);

      List<String> remoteValues = codeList.getRemoteCodeListValues();
      if (remoteValues == null || remoteValues.size() <= 0) {

         // Check that all retrieved values are supported by the reference code list
         while (iter.hasNext()) {
            String typeValue;
            Object rawValue = iter.next();
            if (rawValue instanceof Diagnosis) {
               Diagnosis diagnosis = (Diagnosis)rawValue;
               typeValue = diagnosis.getDiagnosisType();
            }
            else if (rawValue instanceof Preservation) {
               Preservation preservation = (Preservation)rawValue;
               typeValue = preservation.getPreservationType();
            }
            else if (rawValue instanceof Race) {
               Race race = (Race)rawValue;
               typeValue = race.getRace();
            }
            else {
               throw new CbmException("Code list " + codeList + " not supported.");
            }
            remoteValues.add(typeValue);

         }
      }
      return remoteValues;
   }

   protected List<String> getRemoteTableAttributeContents(CodeList codeList) throws CbmException {
      CQLQueryResults results = executeQueryFile(cqlDirectory + codeList.getDistinctValuesQueryFile());
      InputStream resourceAsStream = CbmCodeListTests.class.getResourceAsStream("client-config.wsdd");
      Iterator<?> iter = new CQLQueryResultsIterator(results, resourceAsStream);

      List<String> remoteValues = codeList.getRemoteCodeListValues();
      if (remoteValues == null || remoteValues.size() <= 0) {

         // Check that all retrieved values are supported by the reference code list
         while (iter.hasNext()) {
            String typeValue;
            Object rawValue = iter.next();
            if (rawValue instanceof TargetAttribute[]) {
               TargetAttribute[] attribute = (TargetAttribute[])rawValue;
               typeValue = attribute[0].getValue();
            }
            else {
               throw new CbmException("Unsupported object: " + codeList + " attribute not supported.");
            }
            remoteValues.add(typeValue);

         }
      }
      return remoteValues;
   }

   protected class CbmException extends Exception {
      private static final long serialVersionUID = 1L;

      CbmException(String message) {
         super(message);
      }
   }

}
