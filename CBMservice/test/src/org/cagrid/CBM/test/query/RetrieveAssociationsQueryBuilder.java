package org.cagrid.CBM.test.query;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;

import java.io.StringReader;

import org.cagrid.CBM.test.CbmObject;

public class RetrieveAssociationsQueryBuilder extends QueryBuilder {

   public RetrieveAssociationsQueryBuilder(QueryType queryType) {
      super(queryType);
   }

   public RetrieveAssociationsQueryBuilder() {
      super();
   }

   @Override
   protected void checkArgs(String... args) throws IllegalArgumentException {
      if (args.length != 4) {
         throw new IllegalArgumentException("Illegal arguments passed into query builder: " + this.getClass().getSimpleName());
      }
   }

   /**
    * This method takes in a target object, associated object name, associated object attribute name, and 
    * associated object attribute value.  This method creates a CQL query that finds all records
    * of the target objects restricted by the input associated object arguments.
    * 
    * @param object The target object of the query
    * @param args[0] The simple name of the associated object for the query
    * @param args[1] The role name of the association
    * @param args[2] The name of the attribute in the associated object to match on
    * @param args[3] The value of the attribute in the associated object to match on
    */
   @Override
   public CQLQuery getQueryFromCql(CbmObject object, String... args) throws Exception {

	   String associatedObjectName = args[0];
	   String roleName = args[1];
	   String attributeName = args[2];
	   String attributeValue = args[3];
	   

      StringBuffer cql = new StringBuffer();
      cql.append("<CQLQuery xmlns=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getSimpleName() + "\">");
      cql.append("<Association roleName=\"" + roleName + "\" name=\"gov.nih.nci.cbm.domain.LogicalModel." + associatedObjectName + "\">");

      cql.append("<Attribute name=\"" + attributeName + "\" value=\"" + attributeValue + "\" predicate=\"EQUAL_TO\"/>");
      cql.append("</Association>");
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
