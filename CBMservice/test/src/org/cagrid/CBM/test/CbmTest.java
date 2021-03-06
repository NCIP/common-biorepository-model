/*L
 *  Copyright Washington University in St.Louis
 *  Copyright Information Management Services, Inc.
 *  Copyright Sapient
 *  Copyright Booz Allen Hamilton
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-biorepository-model/LICENSE.txt for details.
 */

package org.cagrid.CBM.test;

import gov.nih.nci.cagrid.common.Utils;
import gov.nih.nci.cagrid.cqlquery.CQLQuery;
import gov.nih.nci.cagrid.cqlresultset.CQLQueryResults;
import gov.nih.nci.cagrid.data.client.DataServiceClient;
import gov.nih.nci.cagrid.metadata.MetadataUtils;
import gov.nih.nci.cagrid.metadata.dataservice.DomainModel;
import gov.nih.nci.cagrid.metadata.dataservice.DomainModelExposedUMLClassCollection;
import gov.nih.nci.cagrid.metadata.dataservice.UMLClass;
import gov.nih.nci.cagrid.metadata.exceptions.InvalidResourcePropertyException;
import gov.nih.nci.cagrid.metadata.exceptions.RemoteResourcePropertyRetrievalException;
import gov.nih.nci.cagrid.metadata.exceptions.ResourcePropertyRetrievalException;

import java.io.FileInputStream;
import java.io.StringReader;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

import org.apache.axis.message.addressing.AttributedURI;
import org.apache.axis.message.addressing.EndpointReferenceType;
import org.apache.axis.types.URI.MalformedURIException;
import org.cagrid.CBM.test.query.QueryBuilder.QueryType;
import org.junit.BeforeClass;

/**
 * CBM validation test base class used to define shared attributes, enums, and methods.
 * 
 * @author powersb
 */

public abstract class CbmTest extends junit.framework.TestCase {

   protected static String targetGrid;
   protected static String serviceUrl;
   protected static DataServiceClient serviceClient;
   protected static UMLClass[] umlClassList;
   protected static final String cqlDirectory = "./cql/";
   protected static final String referenceDirectory = "./resources/";

   public static final QueryType DEFAULT_QUERY_TYPE = QueryType.CQL;

   @Override
   @BeforeClass
   public void setUp() throws Exception {
      /*
       * TODO: Pull URL from environment args set value in one of the following: - ant build script;
       * test execution script; as argument to test execution script
       */

      serviceUrl = System.getProperty("cbm.url");
      serviceClient = new DataServiceClient(serviceUrl);
   }

   public static String getTargetGrid() {
      return targetGrid;
   }

   public static String getServiceUrl() {
      return serviceUrl;
   }

   public static DataServiceClient getServiceClient() {
      return serviceClient;
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
      String fileName = referenceDirectory + "codelists/" + codeList.getDefinitionFileName();
      Scanner scanner = new Scanner(new FileInputStream(fileName));
      List<String> codeListValues = new Vector<String>();
      while (scanner.hasNextLine()) {
         String line = scanner.nextLine();
         String[] valuePair = line.split(";");
         String value = valuePair[0];
         value = value.replace("\"", "");
         // Store as upper case so we can make case insensitive comparisons efficiently
         codeListValues.add(value.toUpperCase());
      }

      if (codeListValues.size() <= 0) {
         fail("No valid codelist values found for " + codeList.getCodeListName());
      }

      return codeListValues;
   }

   /**
    * TODO: This method only pulls 1000 values from the service currently. Need to account for more
    * values.
    * 
    * @param queryFilename
    * @return
    * @throws Exception
    */
   protected static CQLQueryResults executeQueryFile(String queryFilename) {
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

   protected static CQLQueryResults executeQuery(CQLQuery query) throws Exception {
      CQLQueryResults results = serviceClient.query(query);
      return results;
   }

   protected static CQLQueryResults executeQueryString(String queryString) throws Exception {
      CQLQuery query = (CQLQuery)gov.nih.nci.cagrid.common.Utils.deserializeObject(new StringReader(queryString), CQLQuery.class);
      CQLQueryResults results = serviceClient.query(query);
      return results;
   }

   /**
    * This method returns a list of values in the right-side list that can't be found in the
    * left-side list.
    * 
    * @param left
    * @param right
    * @param errorMsg
    * @throws CbmException
    */
   protected List<String> compareCodeLists(List<String> left, List<String> right) throws Exception {

      List<String> valuesMissingFromRight = new Vector<String>();

      for (String value: right) {
         if (!left.contains(value) && value != null && !value.equals("")) {
            valuesMissingFromRight.add(value);
         }
      }

      return valuesMissingFromRight;

   }

   protected String buildFailMessage(String errorMsg, List<String> errorValues) throws Exception {
      StringBuffer allErrorValues = new StringBuffer();
      for (String value: errorValues) {
         allErrorValues.append(value + "; \n");
      }
      errorMsg = errorMsg + allErrorValues.toString();
      return errorMsg;
   }

   protected UMLClass[] getUmlClassesFromService() throws MalformedURIException, InvalidResourcePropertyException, RemoteResourcePropertyRetrievalException, ResourcePropertyRetrievalException {

      if (umlClassList == null) {
         EndpointReferenceType epr = new EndpointReferenceType();
         AttributedURI uri = new AttributedURI(getServiceUrl());
         epr.setAddress(uri);

         DomainModel domainModel = MetadataUtils.getDomainModel(epr);
         DomainModelExposedUMLClassCollection classCollection = domainModel.getExposedUMLClassCollection();
         umlClassList = classCollection.getUMLClass();

      }
      return umlClassList;
   }

   protected static class CbmException extends Exception {
      private static final long serialVersionUID = 1L;

      CbmException(String message) {
         super(message);
      }
   }

}
