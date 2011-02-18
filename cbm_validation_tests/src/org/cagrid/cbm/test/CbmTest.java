package org.cagrid.cbm.test;

import gov.nih.nci.cagrid.common.Utils;
import gov.nih.nci.cagrid.cqlquery.CQLQuery;
import gov.nih.nci.cagrid.cqlresultset.CQLQueryResults;
import gov.nih.nci.cagrid.data.client.DataServiceClient;

import java.io.FileInputStream;
import java.io.StringReader;
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

   protected static String serviceUrl;
   protected static DataServiceClient serviceClient;
   protected static final String cqlDirectory = "./cql/";
   protected static final String referenceDirectory = "./cbm_reference/";

   @Override
   @BeforeClass
   public void setUp() throws Exception {
      /*
       * TODO: Pull URL from environment args set value in one of the following: - ant build script;
       * test execution script; as argument to test execution script
       */

      // IMS CBM URL
      // serviceUrl = "https://cabigapps01.cancer.gov:9295/wsrf/services/cagrid/CBM";

      // Hollings Cancer Center CBM URL
      serviceUrl = "http://128.23.35.126:8080/wsrf/services/cagrid/CBM";

      serviceClient = new DataServiceClient(serviceUrl);
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
         if (!left.contains(value)) {
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

   protected String buildObjectCountSql(CbmObject object) {
      StringBuffer cql = new StringBuffer();
      cql.append("<CQLQuery xmlns=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getSimpleName() + "\"/>");
      cql.append("<QueryModifier countOnly=\"true\"/>");
      cql.append("</CQLQuery>");
      return cql.toString();
   }

   protected static String createDistinctAttributeQueryCql(CbmObject object, String attributeName) {
      StringBuffer cql = new StringBuffer();
      cql.append("<CQLQuery xmlns=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getSimpleName() + "\"/>");
      cql.append("<QueryModifier countOnly=\"false\">");
      cql.append("<DistinctAttribute>" + attributeName + "</DistinctAttribute>");
      cql.append("</QueryModifier>");
      cql.append("</CQLQuery>");
      return cql.toString();
   }

   protected static String createRetrieveAllObjectsQueryCql(CbmObject object) {
      StringBuffer cql = new StringBuffer();
      cql.append("<ns1:CQLQuery xmlns:ns1=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<ns1:Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getSimpleName() + "\"/>");
      cql.append("</ns1:CQLQuery>");

      return cql.toString();
   }

   protected static class CbmException extends Exception {
      private static final long serialVersionUID = 1L;

      CbmException(String message) {
         super(message);
      }
   }

}
