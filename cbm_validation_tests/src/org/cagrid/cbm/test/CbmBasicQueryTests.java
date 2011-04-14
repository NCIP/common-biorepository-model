package org.cagrid.cbm.test;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;
import gov.nih.nci.cagrid.cqlresultset.CQLQueryResults;
import gov.nih.nci.cagrid.cqlresultset.TargetAttribute;
import gov.nih.nci.cagrid.data.utilities.CQLQueryResultsIterator;
import gov.nih.nci.cbm.domain.LogicalModel.Diagnosis;
import gov.nih.nci.cbm.domain.LogicalModel.Organization;
import gov.nih.nci.cbm.domain.LogicalModel.Race;

import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.junit.Test;

/**
 * @author powersb
 */
public class CbmBasicQueryTests extends CbmTest {

   @Test
   public void testFirstBasicQuery() throws Exception {
      // Show me all the specimens and collections from a given organization?

      // FirstBasicQueryBuilder builder = new FirstBasicQueryBuilder();
      // CQLQuery query = builder.getQuery(null, "");
      // serviceClient.query(query);

   }

   public void testObjectRetrieval() throws Exception {

      // CQLQueryResults results = executeQueryFile(cqlDirectory + "basic_query_1a.xml");
      //
      // processResults(results);
   }

   private CQLQuery getAllObjectsQuery(CbmObject object) {
      gov.nih.nci.cagrid.cqlquery.Object target = new gov.nih.nci.cagrid.cqlquery.Object();

      target.setName(object.getCbmClass().getName());
      CQLQuery query = new gov.nih.nci.cagrid.cqlquery.CQLQuery();
      query.setTarget(target);

      return query;
   }

   private List<String> processResults(CQLQueryResults results) throws Exception {

      InputStream resourceAsStream = CbmCodeListTests.class.getResourceAsStream("client-config.wsdd");
      Iterator<?> iter = new CQLQueryResultsIterator(results, resourceAsStream);

      List<String> remoteValues = new Vector<String>();

      // Check that all retrieved values are supported by the reference code list while
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
         else if (rawValue instanceof TargetAttribute[]) {
            TargetAttribute[] attrs = (TargetAttribute[])rawValue;
            TargetAttribute attr = attrs[0];
            typeValue = attr.getName() + " = " + attr.getValue();
         }
         else {
            throw new Exception("Unsupported type");
         }
         remoteValues.add(typeValue);

      }
      return remoteValues;
   }
}

// public void testObjectRetrieval2() throws Exception {
// CQLQuery query = new CQLQuery();
// CQLTargetObject target = new CQLTargetObject();
// target.setClassName(SpecimenCollectionSummary.class.getName());
//
// AssociationPopulationSpecification population = new AssociationPopulationSpecification();
// NamedAssociation isCollectedFrom = new NamedAssociation();
//
// isCollectedFrom.setRoleName("isCollectedFrom");
// population.setNamedAssociationList(new NamedAssociationList(new NamedAssociation[]
// {isCollectedFrom}));
// query.setCQLTargetObject(target);
// query.setAssociationPopulationSpecification(population);
//
// try {
// QName resultsQname = new QName("http://CQL.caBIG/2/gov.nih.nci.cagrid.cql.Results",
// "CQLQueryResults");
//
// CQL2QueryProcessor queryProcessor = new CQL2QueryProcessor(getApplicationService(),
// getDomainTypesInfo(), getDomainModel(), getQNameResolver());
//
// QueryRunner runner = QueryRunner.createConfiguredQueryRunner();
// // CQLQuery query = (CQLQuery)Utils.deserializeDocument("queries/allPayments.xml",
// // CQLQuery.class);
// CQLQueryResults results = runner.executeQuery(query);
// StringWriter writer = new StringWriter();
// Utils.serializeObject(results, resultsQname, writer, runner.getWsddInputStream());
// System.out.println(writer.getBuffer().toString());
// }
// catch (Exception ex) {
// ex.printStackTrace();
//
// }
//
// CQLQueryResults results = serviceClient.query(query);
//
// }

