/*L
 *  Copyright Washington University in St.Louis
 *  Copyright Information Management Services, Inc.
 *  Copyright Sapient
 *  Copyright Booz Allen Hamilton
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-biorepository-model/LICENSE.txt for details.
 */

package org.cagrid.CBM.test.query;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;

import java.io.StringReader;

import org.cagrid.CBM.test.CbmObject;

public class RetrieveFilteredObjectsQueryBuilder extends QueryBuilder {

   public RetrieveFilteredObjectsQueryBuilder(QueryType queryType) {
      super(queryType);
   }

   public RetrieveFilteredObjectsQueryBuilder() {
      super();
   }

   @Override
   protected void checkArgs(String... args) throws IllegalArgumentException {
      if (args.length != 2) {
         throw new IllegalArgumentException("Illegal arguments passed into query builder: " + this.getClass().getSimpleName());
      }
   }

   /**
    * This method takes in a target object, associated object name, associated object attribute name, and 
    * associated object attribute value.  This method creates a CQL query that finds all records
    * of the target objects restricted by the input associated object arguments.
    * 
    * @param object The target object of the query
    * @param args[0] The name of the attribute in the associated object to match on
    * @param args[1] The value of the attribute in the associated object to match on
    */
   @Override
   public CQLQuery getQueryFromCql(CbmObject object, String... args) throws Exception {

	   String attributeName = args[0];
	   String attributeValue = args[1];
	   

      StringBuffer cql = new StringBuffer();
      cql.append("<CQLQuery xmlns=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getSimpleName() + "\">");
      cql.append("<Attribute name=\"" + attributeName + "\" value=\"" + attributeValue + "\" predicate=\"EQUAL_TO\"/>");
      cql.append("</Target>");
      cql.append("</CQLQuery>");
      String queryString = cql.toString();
      CQLQuery query = (CQLQuery)gov.nih.nci.cagrid.common.Utils.deserializeObject(new StringReader(queryString), CQLQuery.class);

      return query;
   }

   @Override
   public CQLQuery getQueryFromApi(CbmObject object, String... strings) throws Exception {

      return null;
   }

}
