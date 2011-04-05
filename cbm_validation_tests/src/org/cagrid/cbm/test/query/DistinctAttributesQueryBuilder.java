package org.cagrid.cbm.test.query;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;

import java.io.StringReader;

import org.cagrid.cbm.test.CbmObject;

public class DistinctAttributesQueryBuilder extends QueryBuilder {

   public DistinctAttributesQueryBuilder(QueryType queryType) {
      super(queryType);
   }

   public DistinctAttributesQueryBuilder() {
      super();
   }

   @Override
   protected void checkArgs(String... args) throws IllegalArgumentException {
      if (args.length != 1) {
         throw new IllegalArgumentException("Illegal arguments passed into query builder: " + this.getClass().getSimpleName());
      }
   }

   @Override
   protected CQLQuery getQueryFromCql(CbmObject object, String... args) throws Exception {

      String attributeName = args[0];

      StringBuffer cql = new StringBuffer();
      cql.append("<CQLQuery xmlns=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getSimpleName() + "\"/>");
      cql.append("<QueryModifier countOnly=\"false\">");
      cql.append("<DistinctAttribute>" + attributeName + "</DistinctAttribute>");
      cql.append("</QueryModifier>");
      cql.append("</CQLQuery>");

      String queryString = cql.toString();
      CQLQuery query = (CQLQuery)gov.nih.nci.cagrid.common.Utils.deserializeObject(new StringReader(queryString), CQLQuery.class);

      return query;
   }

   @Override
   protected CQLQuery getQueryFromApi(CbmObject object, String... strings) throws Exception {
      throw new UnsupportedOperationException();
   }

}
