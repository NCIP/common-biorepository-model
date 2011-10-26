package org.cagrid.CBM.test.query;

import gov.nih.nci.cagrid.cqlquery.CQLQuery;

import org.cagrid.CBM.test.CbmObject;
import org.cagrid.CBM.test.CbmTest;

public abstract class QueryBuilder {

   private final QueryType type;

   public enum QueryType {
      CQL,
      API;
   }

   public QueryBuilder(QueryType queryType) {
      type = queryType;
   }

   public QueryBuilder() {
      type = CbmTest.DEFAULT_QUERY_TYPE;
   }

   public QueryType getType() {
      return type;
   }

   protected abstract void checkArgs(String... args) throws IllegalArgumentException;

   public CQLQuery getQuery(CbmObject object, String... args) throws Exception {
      QueryType queryType = getType();
      CQLQuery query = getQuery(queryType, object, args);
      return query;
   }

   public CQLQuery getQuery(QueryType theType, CbmObject object, String... args) throws Exception {
      checkArgs(args);
      CQLQuery query = null;

      switch (theType) {
         case CQL:
            query = getQueryFromCql(object, args);
            break;

         case API:
            query = getQueryFromApi(object, args);
            break;

         default:
            throw new RuntimeException("Unsupported query type: " + type);

      }

      return query;

   }

   protected abstract CQLQuery getQueryFromCql(CbmObject object, String... strings) throws Exception;

   protected abstract CQLQuery getQueryFromApi(CbmObject object, String... strings) throws Exception;

}
