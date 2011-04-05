package org.cagrid.cbm.test.query;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;

import java.io.StringReader;

import org.cagrid.cbm.test.CbmObject;

public class RetrieveAllAttributesQueryBuilder extends QueryBuilder {

   public RetrieveAllAttributesQueryBuilder(QueryType queryType) {
      super(queryType);
   }

   public RetrieveAllAttributesQueryBuilder() {
      super();
   }

   @Override
   protected void checkArgs(String... args) throws IllegalArgumentException {
      if (args.length != 0) {
         throw new IllegalArgumentException("Illegal arguments passed into query builder: " + this.getClass().getSimpleName());
      }
   }

   @Override
   protected CQLQuery getQueryFromCql(CbmObject object, String... args) throws Exception {

      StringBuffer cql = new StringBuffer();
      cql.append("<ns1:CQLQuery xmlns:ns1=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<ns1:Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getSimpleName() + "\"/>");
      cql.append("</ns1:CQLQuery>");

      String queryString = cql.toString();
      CQLQuery query = (CQLQuery)gov.nih.nci.cagrid.common.Utils.deserializeObject(new StringReader(queryString), CQLQuery.class);

      return query;
   }

   @Override
   protected CQLQuery getQueryFromApi(CbmObject object, String... strings) throws Exception {
      throw new UnsupportedOperationException();
   }

}
