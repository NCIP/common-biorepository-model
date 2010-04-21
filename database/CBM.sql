USE CBM
;


DROP TABLE IF EXISTS ParticipantCollectionSummary
;
DROP TABLE IF EXISTS JoinInstitutionToSpecimenCollectionContact
;
DROP TABLE IF EXISTS JoinCollectionProtocolToInstitution
;
DROP TABLE IF EXISTS JoinAddressToSpecimenCollectionContact
;
DROP TABLE IF EXISTS SpecimenCollectionSummary
;
DROP TABLE IF EXISTS SpecimenCollectionContact
;
DROP TABLE IF EXISTS JoinParticipantCollectionSummaryToRace
;
DROP TABLE IF EXISTS JoinParticipantCollectionSummaryToDiagnosis
;
DROP TABLE IF EXISTS Institution
;
DROP TABLE IF EXISTS CollectionProtocol
;
DROP TABLE IF EXISTS SpecimenAvailabilitySummaryProfile
;
DROP TABLE IF EXISTS Race
;
DROP TABLE IF EXISTS Preservation
;
DROP TABLE IF EXISTS Person
;
DROP TABLE IF EXISTS Organization
;
DROP TABLE IF EXISTS Diagnosis
;
DROP TABLE IF EXISTS AnnotationAvailabilityProfile
;
DROP TABLE IF EXISTS Address
;



CREATE TABLE ParticipantCollectionSummary
(
	count INTEGER,
	ethnicity VARCHAR(50),
	gender VARCHAR(50),
	participantCollectionSummaryID INTEGER NOT NULL,
	registered_to INTEGER,
	PRIMARY KEY (participantCollectionSummaryID),
	KEY (registered_to)
) 
;


CREATE TABLE JoinInstitutionToSpecimenCollectionContact
(
	specimenCollectionContactID INTEGER,
	institutionID INTEGER,
	KEY (specimenCollectionContactID),
	KEY (institutionID)
) 
;


CREATE TABLE JoinCollectionProtocolToInstitution
(
	institutionID INTEGER,
	collectionProtocolID INTEGER,
	KEY (institutionID),
	KEY (collectionProtocolID)
) 
;


CREATE TABLE JoinAddressToSpecimenCollectionContact
(
	specimenCollectionContactID INTEGER,
	addressID INTEGER,
	KEY (specimenCollectionContactID),
	KEY (addressID)
) 
;


CREATE TABLE SpecimenCollectionSummary
(
	anatomicSource VARCHAR(150),
	count INTEGER,
	patientAgeAtCollection VARCHAR(50),
	specimenType VARCHAR(50),
	specimenCollectionSummaryID INTEGER NOT NULL,
	is_collected_from INTEGER,
	undergoes Integer,
	PRIMARY KEY (specimenCollectionSummaryID),
	KEY (is_collected_from),
	KEY (undergoes)
) 
;


CREATE TABLE SpecimenCollectionContact
(
	phone VARCHAR(50),
	specimenCollectionContactID INTEGER NOT NULL,
	PRIMARY KEY (specimenCollectionContactID),
	KEY (specimenCollectionContactID)
) 
;


CREATE TABLE JoinParticipantCollectionSummaryToRace
(
	participantCollectionSummaryID INTEGER,
	raceID INTEGER
) 
;


CREATE TABLE JoinParticipantCollectionSummaryToDiagnosis
(
	diagnosisID Integer,
	participantCollectionSummaryID Integer,
	KEY (diagnosisID),
	KEY (participantCollectionSummaryID)
) 
;


CREATE TABLE Institution
(
	homepageURL VARCHAR(50),
	institutionID INTEGER NOT NULL,
	PRIMARY KEY (institutionID),
	KEY (institutionID)
) 
;


CREATE TABLE CollectionProtocol
(
	dateLastUpdated DATE,
	endDate DATE,
	name VARCHAR(255),
	startDate DATE,
	collectionProtocolID INTEGER NOT NULL,
	makes_available INTEGER,
	is_assigned_to INTEGER,
	is_constrained_by INTEGER,
	identifier VARCHAR(50),
	PRIMARY KEY (collectionProtocolID),
	KEY (makes_available),
	KEY (is_assigned_to),
	KEY (is_constrained_by)
) 
;


CREATE TABLE SpecimenAvailabilitySummaryProfile
(
	isAvailableToCommercialOrganizations BOOL,
	isAvailableToForeignInvestigators BOOL,
	isAvailableToOutsideInstitution BOOL,
	isCollaborationRequired BOOL,
	specimenAvailabilitySummaryProfileID INTEGER NOT NULL,
	PRIMARY KEY (specimenAvailabilitySummaryProfileID)
) 
;


CREATE TABLE Race
(
	race VARCHAR(50),
	raceID INTEGER NOT NULL,
	PRIMARY KEY (raceID)
) 
;


CREATE TABLE Preservation
(
	preservationType VARCHAR(100),
	storageTemperatureInCentegrades INTEGER,
	preservationID INTEGER NOT NULL,
	PRIMARY KEY (preservationID)
) 
;


CREATE TABLE Person
(
	fullName VARCHAR(50),
	firstName VARCHAR(50),
	lastName VARCHAR(50),
	middleNameOrInitial VARCHAR(50),
	emailAddress VARCHAR(50),
	personID INTEGER NOT NULL,
	PRIMARY KEY (personID)
) 
;


CREATE TABLE Organization
(
	name VARCHAR(50),
	organizationID INTEGER NOT NULL,
	PRIMARY KEY (organizationID)
) 
;


CREATE TABLE Diagnosis
(
	diagnosisType VARCHAR(225),
	diagnosisID INTEGER NOT NULL,
	PRIMARY KEY (diagnosisID)
) 
;


CREATE TABLE AnnotationAvailabilityProfile
(
	hasAdditionalPatientDemographics BOOL,
	hasExposureHistory BOOL,
	hasFamilyHistory BOOL,
	hasHistopathologicInformation BOOL,
	hasLabData BOOL,
	hasLongitudinalSpecimens BOOL,
	hasMatchedSpecimens BOOL,
	hasOutcomeInformation BOOL,
	hasParticipantsAvailableForFollowup BOOL,
	hasTreatmentInformation BOOL,
	annotationAvailabilityProfileID INTEGER NOT NULL,
	PRIMARY KEY (annotationAvailabilityProfileID)
) 
;


CREATE TABLE Address
(
	city VARCHAR(50),
	country VARCHAR(50),
	departmentOrDivision VARCHAR(50),
	entityName VARCHAR(50),
	entityNumber VARCHAR(50),
	floorOrPremises VARCHAR(50),
	postOfficeBox VARCHAR(50),
	zipCode VARCHAR(50),
	state VARCHAR(50),
	streetPostDirectional VARCHAR(50),
	streetPreDirectional VARCHAR(50),
	streetOrThoroughfareName VARCHAR(50),
	streetOrThoroughfareNumber VARCHAR(50),
	streetOrThoroughfareSectionName VARCHAR(50),
	streetOrThoroughfareExtensionName VARCHAR(50),
	streetOrThoroughfareType VARCHAR(50),
	addressID INTEGER NOT NULL,
	PRIMARY KEY (addressID)
) 
;





ALTER TABLE JoinInstitutionToSpecimenCollectionContact ADD CONSTRAINT SpecimenCollectionContact 
	FOREIGN KEY (specimenCollectionContactID) REFERENCES SpecimenCollectionContact (specimenCollectionContactID)
;

ALTER TABLE JoinInstitutionToSpecimenCollectionContact ADD CONSTRAINT Institution 
	FOREIGN KEY (institutionID) REFERENCES Institution (institutionID)
;

ALTER TABLE JoinCollectionProtocolToInstitution ADD CONSTRAINT Institution 
	FOREIGN KEY (institutionID) REFERENCES Institution (institutionID)
;

ALTER TABLE JoinCollectionProtocolToInstitution ADD CONSTRAINT CollectionProtocol 
	FOREIGN KEY (collectionProtocolID) REFERENCES CollectionProtocol (collectionProtocolID)
;

ALTER TABLE JoinAddressToSpecimenCollectionContact ADD CONSTRAINT SpecimenCollectionContact 
	FOREIGN KEY (specimenCollectionContactID) REFERENCES SpecimenCollectionContact (specimenCollectionContactID)
;

ALTER TABLE JoinAddressToSpecimenCollectionContact ADD CONSTRAINT Address 
	FOREIGN KEY (addressID) REFERENCES Address (addressID)
;

ALTER TABLE SpecimenCollectionSummary ADD CONSTRAINT FK_is_collected_from 
	FOREIGN KEY (is_collected_from) REFERENCES ParticipantCollectionSummary (participantCollectionSummaryID)
;

ALTER TABLE SpecimenCollectionSummary ADD CONSTRAINT FK_undergoes 
	FOREIGN KEY (undergoes) REFERENCES Preservation (preservationID)
;

ALTER TABLE SpecimenCollectionContact ADD CONSTRAINT FK_SpecimenCollectionContact_Person 
	FOREIGN KEY (specimenCollectionContactID) REFERENCES Person (personID)
;

ALTER TABLE JoinParticipantCollectionSummaryToDiagnosis ADD CONSTRAINT Diagnosis 
	FOREIGN KEY (diagnosisID) REFERENCES Diagnosis (diagnosisID)
;

ALTER TABLE JoinParticipantCollectionSummaryToDiagnosis ADD CONSTRAINT ParticipantCollectionSummary 
	FOREIGN KEY (participantCollectionSummaryID) REFERENCES ParticipantCollectionSummary (participantCollectionSummaryID)
;

ALTER TABLE Institution ADD CONSTRAINT FK_Institution_Organization 
	FOREIGN KEY (institutionID) REFERENCES Organization (organizationID)
;

ALTER TABLE CollectionProtocol ADD CONSTRAINT FK_makes_available 
	FOREIGN KEY (makes_available) REFERENCES AnnotationAvailabilityProfile (annotationAvailabilityProfileID)
;

ALTER TABLE CollectionProtocol ADD CONSTRAINT FK_is_assigned_to 
	FOREIGN KEY (is_assigned_to) REFERENCES SpecimenCollectionContact (specimenCollectionContactID)
;

ALTER TABLE CollectionProtocol ADD CONSTRAINT FK_is_constrained_by 
	FOREIGN KEY (is_constrained_by) REFERENCES SpecimenAvailabilitySummaryProfile (specimenAvailabilitySummaryProfileID)
;
