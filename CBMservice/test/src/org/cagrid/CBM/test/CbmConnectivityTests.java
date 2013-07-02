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

import org.cagrid.CBM.test.query.ObjectCountQueryBuilder;
import org.junit.Test;

/**
 * @author powersb
 */
public class CbmConnectivityTests extends CbmTest {



	/*
	 * TODO: Test that the service is in the caGrid inde.
	 */

	@Test
	public void testConnection() throws Exception{
		ObjectCountQueryBuilder builder = new ObjectCountQueryBuilder();
		CQLQuery query = builder.getQuery(CbmObject.DIAGNOSIS);
		serviceClient.query(query);


	}

}
