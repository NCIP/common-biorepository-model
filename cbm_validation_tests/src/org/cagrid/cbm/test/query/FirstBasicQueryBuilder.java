package org.cagrid.cbm.test.query;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;

import java.io.StringReader;

import org.cagrid.cbm.test.CbmObject;

public class FirstBasicQueryBuilder extends QueryBuilder {

   public FirstBasicQueryBuilder(QueryType queryType) {
      super(queryType);
   }

   public FirstBasicQueryBuilder() {
      super();
   }

   @Override
   protected void checkArgs(String... args) throws IllegalArgumentException {
      if (args.length != 1) {
         throw new IllegalArgumentException("Illegal arguments passed into query builder: " + this.getClass().getSimpleName());
      }
   }

   @Override
   public CQLQuery getQueryFromCql(CbmObject object, String... args) throws Exception {

      String organizationName = args[0];

      StringBuffer cql = new StringBuffer();
      cql.append("<CQLQuery xmlns=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<Target name=\"gov.nih.nci.cbm.domain.LogicalModel.CollectionProtocol\">");
      cql.append("<Association roleName=\"residesAt\" name=\"gov.nih.nci.cbm.domain.LogicalModel.Organization\">");

      cql.append("<Attribute name=\"name\" value=\"" + organizationName + "\" predicate=\"EQUAL_TO\"/>");
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
