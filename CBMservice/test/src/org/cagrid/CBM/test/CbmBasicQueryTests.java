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

import org.cagrid.CBM.test.query.RetrieveAllAttributesQueryBuilder;
import org.junit.Test;

/**
 * @author powersb
 */
public class CbmBasicQueryTests extends CbmTest {




	@Test
	public void testRetrieveAddressQuery() throws Exception {
		CbmObject theObject = CbmObject.ADDRESS;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveAnnotationAvailabilityProfileQuery() throws Exception {
		CbmObject theObject = CbmObject.ANNOTATION_AVAILABILITY_PROFILE;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveCollectionProtocolQuery() throws Exception {
		CbmObject theObject = CbmObject.COLLECTION_PROTOCOL;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveDiagnosisQuery() throws Exception {
		CbmObject theObject = CbmObject.DIAGNOSIS;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveInstitutionQuery() throws Exception {
		CbmObject theObject = CbmObject.INSTITUTION;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveOrganizationQuery() throws Exception {
		CbmObject theObject = CbmObject.ORGANIZATION;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrievePatientAgeGroupAtCollectionQuery() throws Exception {
		CbmObject theObject = CbmObject.PATIENT_AGE_GROUP_AT_COLLECTION;
		retrieveAllRecords(theObject);
	}
	
	@Test
	public void testRetrieveParticipantCollectionSummaryQuery() throws Exception {
		CbmObject theObject = CbmObject.PARTICIPANT_COLLECTION_SUMMARY;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrievePreservationQuery() throws Exception {
		CbmObject theObject = CbmObject.PRESERVATION;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveRaceQuery() throws Exception {
		CbmObject theObject = CbmObject.RACE;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveSpecimenAvailabilitySummaryProfileQuery() throws Exception {
		CbmObject theObject = CbmObject.SPECIMEN_AVAILABILITY_SUMMARY_PROFILE;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveSpecimenCollectionContactQuery() throws Exception {
		CbmObject theObject = CbmObject.SPECIMEN_COLLECTION_CONTACT;
		retrieveAllRecords(theObject);
	}

	@Test
	public void testRetrieveSpecimenCollectionSummaryQuery() throws Exception {
		CbmObject theObject = CbmObject.SPECIMEN_COLLECTION_SUMMARY;
		retrieveAllRecords(theObject);
	}



	/**
	 * Retrieve all records for the given object.  This tests that records from each object can be retrieved.
	 * In reality, this method really just retrieves the first 1000 records for each object due to the build in page
	 * size of caCORE
	 * 
	 * @param theObject
	 * @throws Exception
	 * @throws RemoteException
	 * @throws MalformedQueryExceptionType
	 * @throws QueryProcessingExceptionType
	 */
	private List<Object> retrieveAllRecords(CbmObject theObject) throws Exception{
		RetrieveAllAttributesQueryBuilder builder = new RetrieveAllAttributesQueryBuilder();
		CQLQuery query = builder.getQuery(theObject);
		CQLQueryResults results = serviceClient.query(query);
		List<Object> values = processResults(results);

		return values;
	}



	private List<Object> processResults(CQLQueryResults results) throws Exception {

		InputStream resourceAsStream = CbmCodeListTests.class.getResourceAsStream("client-config.wsdd");
		Iterator<?> iter = new CQLQueryResultsIterator(results, resourceAsStream);

		List<Object> remoteValues = new Vector<Object>();

		while (iter.hasNext()) {
			Object rawValue = iter.next();
			remoteValues.add(rawValue);

		}
		return remoteValues;
	}
}



