package org.cagrid.cbm.test.query;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;
import gov.nih.nci.cagrid.cqlquery.QueryModifier;

import java.io.StringReader;

import org.cagrid.cbm.test.CbmObject;

public class ObjectCountQueryBuilder extends QueryBuilder {

   public ObjectCountQueryBuilder(QueryType queryType) {
      super(queryType);
   }

   public ObjectCountQueryBuilder() {
      super();
   }

   @Override
   protected void checkArgs(String... args) throws IllegalArgumentException {
      if (args.length != 0) {
         throw new IllegalArgumentException("Illegal arguments passed into query builder: " + this.getClass().getSimpleName());
      }
   }

   @Override
   public CQLQuery getQueryFromCql(CbmObject object, String... strings) throws Exception {

      StringBuffer cql = new StringBuffer();
      cql.append("<CQLQuery xmlns=\"http://CQL.caBIG/1/gov.nih.nci.cagrid.CQLQuery\">");
      cql.append("<Target name=\"gov.nih.nci.cbm.domain.LogicalModel." + object.getSimpleName() + "\"/>");
      cql.append("<QueryModifier countOnly=\"true\"/>");
      cql.append("</CQLQuery>");
      String queryString = cql.toString();
      CQLQuery query = (CQLQuery)gov.nih.nci.cagrid.common.Utils.deserializeObject(new StringReader(queryString), CQLQuery.class);

      return query;
   }

   @Override
   public CQLQuery getQueryFromApi(CbmObject object, String... strings) throws Exception {

      CQLQuery query = new gov.nih.nci.cagrid.cqlquery.CQLQuery();

      gov.nih.nci.cagrid.cqlquery.Object target = new gov.nih.nci.cagrid.cqlquery.Object();
      target.setName(object.getCbmClass().getName());
      query.setTarget(target);

      QueryModifier mod = new QueryModifier();
      mod.setCountOnly(true);
      query.setQueryModifier(mod);

      return query;
   }

}
