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
import gov.nih.nci.cagrid.cqlresultset.TargetAttribute;
import gov.nih.nci.cagrid.data.utilities.CQLQueryResultsIterator;
import gov.nih.nci.cbm.domain.LogicalModel.Diagnosis;
import gov.nih.nci.cbm.domain.LogicalModel.Race;

import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.cagrid.CBM.test.CbmTest.CbmException;
import org.cagrid.CBM.test.query.DistinctAttributesQueryBuilder;
import org.cagrid.CBM.test.query.RetrieveAllAttributesQueryBuilder;

enum CodeList {
   DIAGNOSIS(CbmObject.DIAGNOSIS,
            "diagnosisType",
            "diagnosis_list.txt"),
   PRESERVATION(CbmObject.PRESERVATION,
            "preservationType",
            "preservation_list.txt"),
   RACE(CbmObject.RACE,
            "race",
            "race_list.txt"),
   SPECIMEN_TYPE(CbmObject.SPECIMEN_COLLECTION_SUMMARY,
            "specimenType",
            "specimen_type_list.txt"),
   ANATOMIC_SOURCE(CbmObject.SPECIMEN_COLLECTION_SUMMARY,
            "anatomicSource",
            "anatomic_source_list.txt"),
   GENDER(CbmObject.PARTICIPANT_COLLECTION_SUMMARY,
            "gender",
            "gender_list.txt"),
   ETHNICITY(CbmObject.PARTICIPANT_COLLECTION_SUMMARY,
            "ethnicity",
            "ethnicity_list.txt");

   String codeListName;
   String definitionFileName;
   List<String> remoteCodeListValues;
   List<String> remoteDistinctValues;
   CbmObject parentObject;

   protected String getCodeListName() {
      return codeListName;
   }

   protected String getDefinitionFileName() {
      return definitionFileName;
   }

   protected CbmObject getParentObject() {
      return parentObject;
   }

   protected List<String> getRemoteCodeListValues() throws Exception {
      if (remoteCodeListValues == null) {
         remoteCodeListValues = getRemoteCodeListContents(this);
      }
      return remoteCodeListValues;
   }

   protected List<String> getRemoteDistinctValues() throws Exception {
      if (remoteDistinctValues == null) {
         remoteDistinctValues = getRemoteDistinctAttributeValues(this);
      }
      return remoteDistinctValues;
   }

   private CodeList(CbmObject theParentObject, String theCodeListName, String theDefinitionLocation) {
      parentObject = theParentObject;
      codeListName = theCodeListName;
      definitionFileName = theDefinitionLocation;
   }

   @Override
   public String toString() {
      return codeListName;
   }

   /**
    * Retrieves the full contents of a remote codelist.
    * 
    * @param codeList
    * @return
    * @throws CbmException
    */
   private List<String> getRemoteCodeListContents(CodeList codeList) throws Exception {
      RetrieveAllAttributesQueryBuilder builder = new RetrieveAllAttributesQueryBuilder();
      CQLQuery query = builder.getQuery(codeList.getParentObject());
      CQLQueryResults results = CbmTest.executeQuery(query);

      InputStream resourceAsStream = CbmCodeListTests.class.getResourceAsStream("client-config.wsdd");
      Iterator<?> iter = new CQLQueryResultsIterator(results, resourceAsStream);

      List<String> remoteValues = new Vector<String>();

      // Check that all retrieved values are supported by the reference code list
      while (iter.hasNext()) {
         String typeValue;
         Object rawValue = iter.next();
         if (rawValue instanceof Diagnosis) {
            Diagnosis diagnosis = (Diagnosis)rawValue;
            typeValue = diagnosis.getDiagnosisType();
         }
         else if (rawValue instanceof Race) {
            Race race = (Race)rawValue;
            typeValue = race.getRace();
         }
         else {
            throw new CbmException("Code list " + codeList + " not supported.");
         }
         // Store as upper case so we can make case insensitive comparisons efficiently
         remoteValues.add(typeValue.toUpperCase());

      }
      return remoteValues;
   }

   /**
    * @param codeList
    * @return
    * @throws Exception
    */
   private List<String> getRemoteDistinctAttributeValues(CodeList codeList) throws Exception {
      DistinctAttributesQueryBuilder builder = new DistinctAttributesQueryBuilder();
      CQLQuery query = builder.getQuery(codeList.getParentObject(), codeList.getCodeListName());

      CQLQueryResults results = CbmTest.executeQuery(query);
      InputStream resourceAsStream = CbmCodeListTests.class.getResourceAsStream("client-config.wsdd");
      Iterator<?> iter = new CQLQueryResultsIterator(results, resourceAsStream);

      List<String> remoteValues = new Vector<String>();

      // Check that all retrieved values are supported by the reference code list
      while (iter.hasNext()) {
         String typeValue;
         Object rawValue = iter.next();
         if (rawValue instanceof TargetAttribute[]) {
            TargetAttribute[] attribute = (TargetAttribute[])rawValue;
            typeValue = attribute[0].getValue();
         }
         else {
            throw new CbmException("Unsupported object: " + codeList + " attribute not supported.");
         }
         // Store as upper case so we can make case insensitive comparisons efficiently
         remoteValues.add(typeValue.toUpperCase());

      }
      return remoteValues;
   }
}
