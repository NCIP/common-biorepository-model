package org.cagrid.cbm.test;

import gov.nih.nci.cbm.domain.LogicalModel.Address;
import gov.nih.nci.cbm.domain.LogicalModel.AnnotationAvailabilityProfile;
import gov.nih.nci.cbm.domain.LogicalModel.CollectionProtocol;
import gov.nih.nci.cbm.domain.LogicalModel.Diagnosis;
import gov.nih.nci.cbm.domain.LogicalModel.Institution;
import gov.nih.nci.cbm.domain.LogicalModel.Organization;
import gov.nih.nci.cbm.domain.LogicalModel.ParticipantCollectionSummary;
import gov.nih.nci.cbm.domain.LogicalModel.Person;
import gov.nih.nci.cbm.domain.LogicalModel.Preservation;
import gov.nih.nci.cbm.domain.LogicalModel.Race;
import gov.nih.nci.cbm.domain.LogicalModel.SpecimenAvailabilitySummaryProfile;
import gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionContact;
import gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionSummary;

enum CbmObject {
   ADDRESS(Address.class),
   ANNOTATION_AVAILABILITY_PROFILE(AnnotationAvailabilityProfile.class),
   COLLECTION_PROTOCOL(CollectionProtocol.class),
   DIAGNOSIS(Diagnosis.class),
   INSTITUTION(Institution.class),
   ORGANIZATION(Organization.class),
   PARTICIPANT_COLLECTION_SUMMARY(ParticipantCollectionSummary.class),
   PERSON(Person.class),
   PRESERVATION(Preservation.class),
   RACE(Race.class),
   SPECIMEN_AVAILABILITY_SUMMARY_PROFILE(SpecimenAvailabilitySummaryProfile.class),
   SPECIMEN_COLLECTION_CONTACT(SpecimenCollectionContact.class),
   SPECIMEN_COLLECTION_SUMMARY(SpecimenCollectionSummary.class);

   Class<?> cbmClass;

   private CbmObject(Class<?> theCbmClass) {
      cbmClass = theCbmClass;
   }

   protected Class<?> getCbmClass() {
      return cbmClass;
   }

   protected String getSimpleName() {
      return cbmClass.getSimpleName();
   }
}