package org.cagrid.cbm.test;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;
import gov.nih.nci.cagrid.cqlresultset.CQLQueryResults;
import gov.nih.nci.cagrid.data.faults.MalformedQueryExceptionType;
import gov.nih.nci.cagrid.data.faults.QueryProcessingExceptionType;
import gov.nih.nci.cagrid.data.utilities.CQLQueryResultsIterator;

import java.io.InputStream;
import java.rmi.RemoteException;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.cagrid.cbm.test.query.RetrieveAllAttributesQueryBuilder;
import org.junit.Test;

/**
 * @author powersb
 */
public class CbmBasicQueryTests extends CbmTest {

	@Test
	public void testRetrieveAddressQuery() throws Exception {
		CbmObject theObject = CbmObject.ADDRESS;
		retrieveAllAttributes(theObject);
	}

	@Test
	public void testRetrieveAnnotationAvailabilityProfileQuery() throws Exception {
		CbmObject theObject = CbmObject.ANNOTATION_AVAILABILITY_PROFILE;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveCollectionProtocolQuery() throws Exception {
		CbmObject theObject = CbmObject.COLLECTION_PROTOCOL;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveDiagnosisQuery() throws Exception {
		CbmObject theObject = CbmObject.DIAGNOSIS;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveInstitutionQuery() throws Exception {
		CbmObject theObject = CbmObject.INSTITUTION;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveOrganizationQuery() throws Exception {
		CbmObject theObject = CbmObject.ORGANIZATION;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveParticipantCollectionSummaryQuery() throws Exception {
		CbmObject theObject = CbmObject.PARTICIPANT_COLLECTION_SUMMARY;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrievePreservationQuery() throws Exception {
		CbmObject theObject = CbmObject.PRESERVATION;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveRaceQuery() throws Exception {
		CbmObject theObject = CbmObject.RACE;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveSpecimenAvailabilitySummaryProfileQuery() throws Exception {
		CbmObject theObject = CbmObject.SPECIMEN_AVAILABILITY_SUMMARY_PROFILE;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveSpecimenCollectionContactQuery() throws Exception {
		CbmObject theObject = CbmObject.SPECIMEN_COLLECTION_CONTACT;
		retrieveAllAttributes(theObject);
	}
	
	@Test
	public void testRetrieveSpecimenCollectionSummaryQuery() throws Exception {
		CbmObject theObject = CbmObject.SPECIMEN_COLLECTION_SUMMARY;
		retrieveAllAttributes(theObject);
	}



	/**
	 * Retrieve all attributes for the given object.  This tests that records from each object can be retrieved.
	 * In reality, this method really just retrieves the first 1000 records for each object due to the build in page
	 * size of caCORE
	 * 
	 * @param theObject
	 * @throws Exception
	 * @throws RemoteException
	 * @throws MalformedQueryExceptionType
	 * @throws QueryProcessingExceptionType
	 */
	private void retrieveAllAttributes(CbmObject theObject) throws Exception{
		RetrieveAllAttributesQueryBuilder builder = new RetrieveAllAttributesQueryBuilder();
		CQLQuery query = builder.getQuery(theObject);
		CQLQueryResults results = serviceClient.query(query);
		List<Object> values = processResults(results);
		if(values.size() < 1){
			throw new Exception("No records found for object " + theObject.getSimpleName());
		}
	}





	private List<Object> processResults(CQLQueryResults results) throws Exception {

		InputStream resourceAsStream = CbmCodeListTests.class.getResourceAsStream("client-config.wsdd");
		Iterator<?> iter = new CQLQueryResultsIterator(results, resourceAsStream);

		List<Object> remoteValues = new Vector<Object>();

		// Check that all retrieved values are supported by the reference code list while
		while (iter.hasNext()) {
			String typeValue;
			Object rawValue = iter.next();

			remoteValues.add(rawValue);

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
// }
// catch (Exception ex) {
// ex.printStackTrace();
//
// }
//
// CQLQueryResults results = serviceClient.query(query);
//
// }

