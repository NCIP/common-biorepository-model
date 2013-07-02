/*L
 *  Copyright Washington University in St.Louis
 *  Copyright Information Management Services, Inc.
 *  Copyright Sapient
 *  Copyright Booz Allen Hamilton
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-biorepository-model/LICENSE.txt for details.
 */

/**
 * PermissibleCQLObjectResults.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2RC2 Apr 28, 2006 (12:42:00 EDT) WSDL2Java emitter.
 */

package org.cagrid.CBM.cqlresulttypes;

public class PermissibleCQLObjectResults  implements java.io.Serializable {
    private gov.nih.nci.cbm.domain.LogicalModel.Organization organization;
    private gov.nih.nci.cbm.domain.LogicalModel.AnnotationAvailabilityProfile annotationAvailabilityProfile;
    private gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionContact specimenCollectionContact;
    private gov.nih.nci.cbm.domain.LogicalModel.PatientAgeGroupAtCollection patientAgeGroupAtCollection;
    private gov.nih.nci.cbm.domain.LogicalModel.SpecimenAvailabilitySummaryProfile specimenAvailabilitySummaryProfile;
    private gov.nih.nci.cbm.domain.LogicalModel.CollectionProtocol collectionProtocol;
    private gov.nih.nci.cbm.domain.LogicalModel.Person person;
    private gov.nih.nci.cbm.domain.LogicalModel.ParticipantCollectionSummary participantCollectionSummary;
    private gov.nih.nci.cbm.domain.LogicalModel.Address address;
    private gov.nih.nci.cbm.domain.LogicalModel.Institution institution;
    private gov.nih.nci.cbm.domain.LogicalModel.Race race;
    private gov.nih.nci.cbm.domain.LogicalModel.Diagnosis diagnosis;
    private gov.nih.nci.cbm.domain.LogicalModel.Preservation preservation;
    private gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionSummary specimenCollectionSummary;

    public PermissibleCQLObjectResults() {
    }

    public PermissibleCQLObjectResults(
           gov.nih.nci.cbm.domain.LogicalModel.Address address,
           gov.nih.nci.cbm.domain.LogicalModel.AnnotationAvailabilityProfile annotationAvailabilityProfile,
           gov.nih.nci.cbm.domain.LogicalModel.CollectionProtocol collectionProtocol,
           gov.nih.nci.cbm.domain.LogicalModel.Diagnosis diagnosis,
           gov.nih.nci.cbm.domain.LogicalModel.Institution institution,
           gov.nih.nci.cbm.domain.LogicalModel.Organization organization,
           gov.nih.nci.cbm.domain.LogicalModel.ParticipantCollectionSummary participantCollectionSummary,
           gov.nih.nci.cbm.domain.LogicalModel.PatientAgeGroupAtCollection patientAgeGroupAtCollection,
           gov.nih.nci.cbm.domain.LogicalModel.Person person,
           gov.nih.nci.cbm.domain.LogicalModel.Preservation preservation,
           gov.nih.nci.cbm.domain.LogicalModel.Race race,
           gov.nih.nci.cbm.domain.LogicalModel.SpecimenAvailabilitySummaryProfile specimenAvailabilitySummaryProfile,
           gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionContact specimenCollectionContact,
           gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionSummary specimenCollectionSummary) {
           this.organization = organization;
           this.annotationAvailabilityProfile = annotationAvailabilityProfile;
           this.specimenCollectionContact = specimenCollectionContact;
           this.patientAgeGroupAtCollection = patientAgeGroupAtCollection;
           this.specimenAvailabilitySummaryProfile = specimenAvailabilitySummaryProfile;
           this.collectionProtocol = collectionProtocol;
           this.person = person;
           this.participantCollectionSummary = participantCollectionSummary;
           this.address = address;
           this.institution = institution;
           this.race = race;
           this.diagnosis = diagnosis;
           this.preservation = preservation;
           this.specimenCollectionSummary = specimenCollectionSummary;
    }


    /**
     * Gets the organization value for this PermissibleCQLObjectResults.
     * 
     * @return organization
     */
    public gov.nih.nci.cbm.domain.LogicalModel.Organization getOrganization() {
        return organization;
    }


    /**
     * Sets the organization value for this PermissibleCQLObjectResults.
     * 
     * @param organization
     */
    public void setOrganization(gov.nih.nci.cbm.domain.LogicalModel.Organization organization) {
        this.organization = organization;
    }


    /**
     * Gets the annotationAvailabilityProfile value for this PermissibleCQLObjectResults.
     * 
     * @return annotationAvailabilityProfile
     */
    public gov.nih.nci.cbm.domain.LogicalModel.AnnotationAvailabilityProfile getAnnotationAvailabilityProfile() {
        return annotationAvailabilityProfile;
    }


    /**
     * Sets the annotationAvailabilityProfile value for this PermissibleCQLObjectResults.
     * 
     * @param annotationAvailabilityProfile
     */
    public void setAnnotationAvailabilityProfile(gov.nih.nci.cbm.domain.LogicalModel.AnnotationAvailabilityProfile annotationAvailabilityProfile) {
        this.annotationAvailabilityProfile = annotationAvailabilityProfile;
    }


    /**
     * Gets the specimenCollectionContact value for this PermissibleCQLObjectResults.
     * 
     * @return specimenCollectionContact
     */
    public gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionContact getSpecimenCollectionContact() {
        return specimenCollectionContact;
    }


    /**
     * Sets the specimenCollectionContact value for this PermissibleCQLObjectResults.
     * 
     * @param specimenCollectionContact
     */
    public void setSpecimenCollectionContact(gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionContact specimenCollectionContact) {
        this.specimenCollectionContact = specimenCollectionContact;
    }


    /**
     * Gets the patientAgeGroupAtCollection value for this PermissibleCQLObjectResults.
     * 
     * @return patientAgeGroupAtCollection
     */
    public gov.nih.nci.cbm.domain.LogicalModel.PatientAgeGroupAtCollection getPatientAgeGroupAtCollection() {
        return patientAgeGroupAtCollection;
    }


    /**
     * Sets the patientAgeGroupAtCollection value for this PermissibleCQLObjectResults.
     * 
     * @param patientAgeGroupAtCollection
     */
    public void setPatientAgeGroupAtCollection(gov.nih.nci.cbm.domain.LogicalModel.PatientAgeGroupAtCollection patientAgeGroupAtCollection) {
        this.patientAgeGroupAtCollection = patientAgeGroupAtCollection;
    }


    /**
     * Gets the specimenAvailabilitySummaryProfile value for this PermissibleCQLObjectResults.
     * 
     * @return specimenAvailabilitySummaryProfile
     */
    public gov.nih.nci.cbm.domain.LogicalModel.SpecimenAvailabilitySummaryProfile getSpecimenAvailabilitySummaryProfile() {
        return specimenAvailabilitySummaryProfile;
    }


    /**
     * Sets the specimenAvailabilitySummaryProfile value for this PermissibleCQLObjectResults.
     * 
     * @param specimenAvailabilitySummaryProfile
     */
    public void setSpecimenAvailabilitySummaryProfile(gov.nih.nci.cbm.domain.LogicalModel.SpecimenAvailabilitySummaryProfile specimenAvailabilitySummaryProfile) {
        this.specimenAvailabilitySummaryProfile = specimenAvailabilitySummaryProfile;
    }


    /**
     * Gets the collectionProtocol value for this PermissibleCQLObjectResults.
     * 
     * @return collectionProtocol
     */
    public gov.nih.nci.cbm.domain.LogicalModel.CollectionProtocol getCollectionProtocol() {
        return collectionProtocol;
    }


    /**
     * Sets the collectionProtocol value for this PermissibleCQLObjectResults.
     * 
     * @param collectionProtocol
     */
    public void setCollectionProtocol(gov.nih.nci.cbm.domain.LogicalModel.CollectionProtocol collectionProtocol) {
        this.collectionProtocol = collectionProtocol;
    }


    /**
     * Gets the person value for this PermissibleCQLObjectResults.
     * 
     * @return person
     */
    public gov.nih.nci.cbm.domain.LogicalModel.Person getPerson() {
        return person;
    }


    /**
     * Sets the person value for this PermissibleCQLObjectResults.
     * 
     * @param person
     */
    public void setPerson(gov.nih.nci.cbm.domain.LogicalModel.Person person) {
        this.person = person;
    }


    /**
     * Gets the participantCollectionSummary value for this PermissibleCQLObjectResults.
     * 
     * @return participantCollectionSummary
     */
    public gov.nih.nci.cbm.domain.LogicalModel.ParticipantCollectionSummary getParticipantCollectionSummary() {
        return participantCollectionSummary;
    }


    /**
     * Sets the participantCollectionSummary value for this PermissibleCQLObjectResults.
     * 
     * @param participantCollectionSummary
     */
    public void setParticipantCollectionSummary(gov.nih.nci.cbm.domain.LogicalModel.ParticipantCollectionSummary participantCollectionSummary) {
        this.participantCollectionSummary = participantCollectionSummary;
    }


    /**
     * Gets the address value for this PermissibleCQLObjectResults.
     * 
     * @return address
     */
    public gov.nih.nci.cbm.domain.LogicalModel.Address getAddress() {
        return address;
    }


    /**
     * Sets the address value for this PermissibleCQLObjectResults.
     * 
     * @param address
     */
    public void setAddress(gov.nih.nci.cbm.domain.LogicalModel.Address address) {
        this.address = address;
    }


    /**
     * Gets the institution value for this PermissibleCQLObjectResults.
     * 
     * @return institution
     */
    public gov.nih.nci.cbm.domain.LogicalModel.Institution getInstitution() {
        return institution;
    }


    /**
     * Sets the institution value for this PermissibleCQLObjectResults.
     * 
     * @param institution
     */
    public void setInstitution(gov.nih.nci.cbm.domain.LogicalModel.Institution institution) {
        this.institution = institution;
    }


    /**
     * Gets the race value for this PermissibleCQLObjectResults.
     * 
     * @return race
     */
    public gov.nih.nci.cbm.domain.LogicalModel.Race getRace() {
        return race;
    }


    /**
     * Sets the race value for this PermissibleCQLObjectResults.
     * 
     * @param race
     */
    public void setRace(gov.nih.nci.cbm.domain.LogicalModel.Race race) {
        this.race = race;
    }


    /**
     * Gets the diagnosis value for this PermissibleCQLObjectResults.
     * 
     * @return diagnosis
     */
    public gov.nih.nci.cbm.domain.LogicalModel.Diagnosis getDiagnosis() {
        return diagnosis;
    }


    /**
     * Sets the diagnosis value for this PermissibleCQLObjectResults.
     * 
     * @param diagnosis
     */
    public void setDiagnosis(gov.nih.nci.cbm.domain.LogicalModel.Diagnosis diagnosis) {
        this.diagnosis = diagnosis;
    }


    /**
     * Gets the preservation value for this PermissibleCQLObjectResults.
     * 
     * @return preservation
     */
    public gov.nih.nci.cbm.domain.LogicalModel.Preservation getPreservation() {
        return preservation;
    }


    /**
     * Sets the preservation value for this PermissibleCQLObjectResults.
     * 
     * @param preservation
     */
    public void setPreservation(gov.nih.nci.cbm.domain.LogicalModel.Preservation preservation) {
        this.preservation = preservation;
    }


    /**
     * Gets the specimenCollectionSummary value for this PermissibleCQLObjectResults.
     * 
     * @return specimenCollectionSummary
     */
    public gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionSummary getSpecimenCollectionSummary() {
        return specimenCollectionSummary;
    }


    /**
     * Sets the specimenCollectionSummary value for this PermissibleCQLObjectResults.
     * 
     * @param specimenCollectionSummary
     */
    public void setSpecimenCollectionSummary(gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionSummary specimenCollectionSummary) {
        this.specimenCollectionSummary = specimenCollectionSummary;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof PermissibleCQLObjectResults)) return false;
        PermissibleCQLObjectResults other = (PermissibleCQLObjectResults) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.organization==null && other.getOrganization()==null) || 
             (this.organization!=null &&
              this.organization.equals(other.getOrganization()))) &&
            ((this.annotationAvailabilityProfile==null && other.getAnnotationAvailabilityProfile()==null) || 
             (this.annotationAvailabilityProfile!=null &&
              this.annotationAvailabilityProfile.equals(other.getAnnotationAvailabilityProfile()))) &&
            ((this.specimenCollectionContact==null && other.getSpecimenCollectionContact()==null) || 
             (this.specimenCollectionContact!=null &&
              this.specimenCollectionContact.equals(other.getSpecimenCollectionContact()))) &&
            ((this.patientAgeGroupAtCollection==null && other.getPatientAgeGroupAtCollection()==null) || 
             (this.patientAgeGroupAtCollection!=null &&
              this.patientAgeGroupAtCollection.equals(other.getPatientAgeGroupAtCollection()))) &&
            ((this.specimenAvailabilitySummaryProfile==null && other.getSpecimenAvailabilitySummaryProfile()==null) || 
             (this.specimenAvailabilitySummaryProfile!=null &&
              this.specimenAvailabilitySummaryProfile.equals(other.getSpecimenAvailabilitySummaryProfile()))) &&
            ((this.collectionProtocol==null && other.getCollectionProtocol()==null) || 
             (this.collectionProtocol!=null &&
              this.collectionProtocol.equals(other.getCollectionProtocol()))) &&
            ((this.person==null && other.getPerson()==null) || 
             (this.person!=null &&
              this.person.equals(other.getPerson()))) &&
            ((this.participantCollectionSummary==null && other.getParticipantCollectionSummary()==null) || 
             (this.participantCollectionSummary!=null &&
              this.participantCollectionSummary.equals(other.getParticipantCollectionSummary()))) &&
            ((this.address==null && other.getAddress()==null) || 
             (this.address!=null &&
              this.address.equals(other.getAddress()))) &&
            ((this.institution==null && other.getInstitution()==null) || 
             (this.institution!=null &&
              this.institution.equals(other.getInstitution()))) &&
            ((this.race==null && other.getRace()==null) || 
             (this.race!=null &&
              this.race.equals(other.getRace()))) &&
            ((this.diagnosis==null && other.getDiagnosis()==null) || 
             (this.diagnosis!=null &&
              this.diagnosis.equals(other.getDiagnosis()))) &&
            ((this.preservation==null && other.getPreservation()==null) || 
             (this.preservation!=null &&
              this.preservation.equals(other.getPreservation()))) &&
            ((this.specimenCollectionSummary==null && other.getSpecimenCollectionSummary()==null) || 
             (this.specimenCollectionSummary!=null &&
              this.specimenCollectionSummary.equals(other.getSpecimenCollectionSummary())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getOrganization() != null) {
            _hashCode += getOrganization().hashCode();
        }
        if (getAnnotationAvailabilityProfile() != null) {
            _hashCode += getAnnotationAvailabilityProfile().hashCode();
        }
        if (getSpecimenCollectionContact() != null) {
            _hashCode += getSpecimenCollectionContact().hashCode();
        }
        if (getPatientAgeGroupAtCollection() != null) {
            _hashCode += getPatientAgeGroupAtCollection().hashCode();
        }
        if (getSpecimenAvailabilitySummaryProfile() != null) {
            _hashCode += getSpecimenAvailabilitySummaryProfile().hashCode();
        }
        if (getCollectionProtocol() != null) {
            _hashCode += getCollectionProtocol().hashCode();
        }
        if (getPerson() != null) {
            _hashCode += getPerson().hashCode();
        }
        if (getParticipantCollectionSummary() != null) {
            _hashCode += getParticipantCollectionSummary().hashCode();
        }
        if (getAddress() != null) {
            _hashCode += getAddress().hashCode();
        }
        if (getInstitution() != null) {
            _hashCode += getInstitution().hashCode();
        }
        if (getRace() != null) {
            _hashCode += getRace().hashCode();
        }
        if (getDiagnosis() != null) {
            _hashCode += getDiagnosis().hashCode();
        }
        if (getPreservation() != null) {
            _hashCode += getPreservation().hashCode();
        }
        if (getSpecimenCollectionSummary() != null) {
            _hashCode += getSpecimenCollectionSummary().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(PermissibleCQLObjectResults.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://CBM.cagrid.org/CBM/CQLResultTypes", "PermissibleCQLObjectResults"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("organization");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Organization"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Organization"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("annotationAvailabilityProfile");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "AnnotationAvailabilityProfile"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "AnnotationAvailabilityProfile"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("specimenCollectionContact");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "SpecimenCollectionContact"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "SpecimenCollectionContact"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("patientAgeGroupAtCollection");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "PatientAgeGroupAtCollection"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "PatientAgeGroupAtCollection"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("specimenAvailabilitySummaryProfile");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "SpecimenAvailabilitySummaryProfile"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "SpecimenAvailabilitySummaryProfile"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("collectionProtocol");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "CollectionProtocol"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "CollectionProtocol"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("person");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Person"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Person"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("participantCollectionSummary");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "ParticipantCollectionSummary"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "ParticipantCollectionSummary"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("address");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Address"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Address"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("institution");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Institution"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Institution"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("race");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Race"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Race"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("diagnosis");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Diagnosis"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Diagnosis"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("preservation");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Preservation"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "Preservation"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("specimenCollectionSummary");
        elemField.setXmlName(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "SpecimenCollectionSummary"));
        elemField.setXmlType(new javax.xml.namespace.QName("gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel", "SpecimenCollectionSummary"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
