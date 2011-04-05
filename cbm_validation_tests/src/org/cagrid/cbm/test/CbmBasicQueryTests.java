package org.cagrid.cbm.test;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;
import gov.nih.nci.cagrid.cqlresultset.CQLQueryResults;
import gov.nih.nci.cagrid.data.utilities.CQLQueryResultsIterator;
import gov.nih.nci.cbm.domain.LogicalModel.Diagnosis;
import gov.nih.nci.cbm.domain.LogicalModel.Organization;
import gov.nih.nci.cbm.domain.LogicalModel.Race;

import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.cagrid.cbm.test.query.FirstBasicQueryBuilder;
import org.junit.Test;

/**
 * @author powersb
 */
public class CbmBasicQueryTests extends CbmTest {

   @Test
   public void testFirstBasicQuery() throws Exception {

      FirstBasicQueryBuilder builder = new FirstBasicQueryBuilder();
      CQLQuery query = builder.getQuery(null, "");
      serviceClient.query(query);
   }

   private List<String> processResults(CQLQueryResults results) throws Exception {

      InputStream resourceAsStream = CbmCodeListTests.class.getResourceAsStream("client-config.wsdd");
      Iterator<?> iter = new CQLQueryResultsIterator(results, resourceAsStream);

      List<String> remoteValues = new Vector<String>();

      // Check that all retrieved values are supported by the reference code list
      while (iter.hasNext()) {
         String typeValue;
         Object rawValue = iter.next();
         if (rawValue instanceof Diagnosis) {
            Diagnosis diagnosis = (Diagnosis)rawValue;
            typeValue = diagnosis.getDiagnosisType();
         }
         else if (rawValue instanceof Race) {
            Race race = (Race)rawValue;
            typeValue = race.getRace();
         }
         else if (rawValue instanceof Organization) {
            Organization org = (Organization)rawValue;
            typeValue = org.getName();
         }
         else {
            throw new Exception("Unsupported type");
         }
         remoteValues.add(typeValue);

      }
      return remoteValues;
   }

}
