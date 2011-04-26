DROP TABLE patient_age_group CASCADE CONSTRAINTS
;
DROP TABLE gender CASCADE CONSTRAINTS
;
DROP TABLE ethnicity CASCADE CONSTRAINTS
;
DROP TABLE preservation_type CASCADE CONSTRAINTS
;
DROP TABLE anatomic_source CASCADE CONSTRAINTS
;
DROP TABLE specimen_type CASCADE CONSTRAINTS
;
DROP TABLE Person CASCADE CONSTRAINTS
;
DROP TABLE Organization CASCADE CONSTRAINTS
;
DROP TABLE Address CASCADE CONSTRAINTS
;
DROP TABLE join_participant_collection_summary_to_race CASCADE CONSTRAINTS
;
DROP TABLE specimen_collection_summary CASCADE CONSTRAINTS
;
DROP TABLE join_address_to_specimen_collection_contact CASCADE CONSTRAINTS
;
DROP TABLE specimen_collection_contact CASCADE CONSTRAINTS
;
DROP TABLE specimen_availability_summary_profile CASCADE CONSTRAINTS
;
DROP TABLE Race CASCADE CONSTRAINTS
;
DROP TABLE Preservation CASCADE CONSTRAINTS
;
DROP TABLE participant_collection_summary CASCADE CONSTRAINTS
;
DROP TABLE Institution CASCADE CONSTRAINTS
;
DROP TABLE join_participant_collection_summary_todiagnosis CASCADE CONSTRAINTS
;
DROP TABLE Diagnosis CASCADE CONSTRAINTS
;
DROP TABLE join_collection_protocol_to_institution CASCADE CONSTRAINTS
;
DROP TABLE collection_protocol CASCADE CONSTRAINTS
;
DROP TABLE annotation_availability_profile CASCADE CONSTRAINTS
;



CREATE TABLE patient_age_group
(
	id              NUMBER(38) NOT NULL,
	age_group_low   NUMBER(38),
	age_group_high  NUMBER(38)
)
;


CREATE TABLE gender
(
	gender          VARCHAR2(50),
	ID              NUMBER(38) NOT NULL,
	NCI_code        VARCHAR2(50),
	NCI_Definition  CLOB
)
;


CREATE TABLE ethnicity
(
	ethnicity       VARCHAR2(50),
	id              NUMBER(38) NOT NULL,
	NCI_code        VARCHAR2(50),
	NCI_definition  CLOB
)
;


CREATE TABLE preservation_type
(
	id                 NUMBER(38) NOT NULL,
	preservation_type  VARCHAR2(100),
	NCI_code           VARCHAR2(50),
	NCI_Definition     CLOB
)
;


CREATE TABLE anatomic_source
(
	id               NUMBER(38) NOT NULL,
	anatomic_source  VARCHAR2(150),
	NCI_code         VARCHAR2(50),
	NCI_Definition   CLOB
)
;


CREATE TABLE specimen_type
(
	id              NUMBER(38) NOT NULL,
	specimen_type   VARCHAR2(50),
	NCI_code        VARCHAR2(50),
	NCI_Definition  CLOB
)
;


CREATE TABLE Person
(
	full_name               VARCHAR2(50),    --  A formatted means of uniquely identifying an individual derived from multiple naming elements; first middle and last names.   Rem
	first_name              VARCHAR2(50),    --  A word or group of words indicating a person's first (personal or given) name; the name that precedes the surname. Synonym = Given Name.  Rem
	last_name               VARCHAR2(50),    --  A means of identifying an individual by using a word or group of words indicating a person's last (family) name. Synonym = Last Name, Surname. Rem
	middle_name_or_initial  VARCHAR2(50),    --  A means of identifying an individual by using a word or group of words indicating a person's middle name. Rem
	email_address           VARCHAR2(50),    --  The string of characters that represents the electronic mail address of a person. Rem
	person_ID               NUMBER(38) NOT NULL
)
;

COMMENT ON COLUMN Person.full_name               IS 'A formatted means of uniquely identifying an individual derived from multiple naming elements; first middle and last names.  '
;
COMMENT ON COLUMN Person.first_name              IS 'A word or group of words indicating a person''s first (personal or given) name; the name that precedes the surname. Synonym = Given Name. '
;
COMMENT ON COLUMN Person.last_name               IS 'A means of identifying an individual by using a word or group of words indicating a person''s last (family) name. Synonym = Last Name, Surname.'
;
COMMENT ON COLUMN Person.middle_name_or_initial  IS 'A means of identifying an individual by using a word or group of words indicating a person''s middle name.'
;
COMMENT ON COLUMN Person.email_address           IS 'The string of characters that represents the electronic mail address of a person.'
;

CREATE TABLE Organization
(
	name             VARCHAR2(150),    --  The name of the organization or an institution. Rem
	organization_ID  NUMBER(38) NOT NULL
)
;

COMMENT ON TABLE Organization IS 'A formal group of people that exists to further a particular profession.'
;
COMMENT ON COLUMN Organization.name             IS 'The name of the organization or an institution.'
;

CREATE TABLE Address
(
	city                                   VARCHAR2(50),    --  A component of an address that specifies a location by identification of a city, town, or village. Rem
	country                                VARCHAR2(50),    --  A component of an address that specifies a location by identification of a country. Rem
	department_or_division                 VARCHAR2(50),    --  A component of an address that specifies a location by identification of a specialized division of a large organization. Rem
	entity_name                            VARCHAR2(50),    --  A component of an address that specifies a location by identification of a specific person, corporation, organization, building or similar unit. Rem
	entity_number                          VARCHAR2(50),    --  A component of an address that specifies a location by identification of a specific person, corporation, organization, building or similar unit. Rem
	floor_or_premises                      VARCHAR2(50),    --  A component of an address that specifies a location by identification of the story or level of a building. Rem
	post_office_box                        VARCHAR2(50),    --  A component of an address that specifies a location by identification of a delivery box at a postal facility. Rem
	zip_code                               VARCHAR2(50),    --  The string of characters used to identify the five-digit Zone Improvement Plan (ZIP) code and the four-digit extension code (if available) that represents the geographic segment that is a subunit of the ZIPcode, assigned by the U.S. Postal Service to a geographic location to facilitate mail delivery; or the postal zone specific to the country, other than the U.S., where the mail is delivered. Rem
	state                                  VARCHAR2(50),    --  A component of an address that specifies a location by identification of a principal administrative unit of a country. Rem
	street_post_directional                VARCHAR2(50),    --  A component of an address that specifies a location by identification of directional text occurring after the street/thoroughfare name. Rem
	street_pre_directional                 VARCHAR2(50),    --  A component of an address that specifies a location by identification of directional text occurring before the street/thoroughfare name. Rem
	street_or_thoroughfare_name_and_type   VARCHAR2(150),    --  A component of an address that specifies a location by identification of a related road or public highway and a component of an address that specifies a location by identification of a street/thoroughfare by type. Rem
	street_or_thoroughfare_number          VARCHAR2(50),    --  A component of an address that specifies a location by identification of an assigned numeral or string of numerals on a street/thoroughfare. Rem
	street_or_thoroughfare_section_name    VARCHAR2(50),    --  A component of an address that specifies a location by identification of a distinct area of road or public highway. Rem
	street_or_thoroughfare_extension_name  VARCHAR2(50),    --  A component of an address that specifies a location by identification of an expanded part of road or public highway. Rem
	address_ID                             NUMBER(38) NOT NULL
)
;

COMMENT ON TABLE Address IS 'A standardized representation of the location of a person, business, building, or organization.'
;
COMMENT ON COLUMN Address.city                                   IS 'A component of an address that specifies a location by identification of a city, town, or village.'
;
COMMENT ON COLUMN Address.country                                IS 'A component of an address that specifies a location by identification of a country.'
;
COMMENT ON COLUMN Address.department_or_division                 IS 'A component of an address that specifies a location by identification of a specialized division of a large organization.'
;
COMMENT ON COLUMN Address.entity_name                            IS 'A component of an address that specifies a location by identification of a specific person, corporation, organization, building or similar unit.'
;
COMMENT ON COLUMN Address.entity_number                          IS 'A component of an address that specifies a location by identification of a specific person, corporation, organization, building or similar unit.'
;
COMMENT ON COLUMN Address.floor_or_premises                      IS 'A component of an address that specifies a location by identification of the story or level of a building.'
;
COMMENT ON COLUMN Address.post_office_box                        IS 'A component of an address that specifies a location by identification of a delivery box at a postal facility.'
;
COMMENT ON COLUMN Address.zip_code                               IS 'The string of characters used to identify the five-digit Zone Improvement Plan (ZIP) code and the four-digit extension code (if available) that represents the geographic segment that is a subunit of the ZIPcode, assigned by the U.S. Postal Service to a geographic location to facilitate mail delivery; or the postal zone specific to the country, other than the U.S., where the mail is delivered.'
;
COMMENT ON COLUMN Address.state                                  IS 'A component of an address that specifies a location by identification of a principal administrative unit of a country.'
;
COMMENT ON COLUMN Address.street_post_directional                IS 'A component of an address that specifies a location by identification of directional text occurring after the street/thoroughfare name.'
;
COMMENT ON COLUMN Address.street_pre_directional                 IS 'A component of an address that specifies a location by identification of directional text occurring before the street/thoroughfare name.'
;
COMMENT ON COLUMN Address.street_or_thoroughfare_name_and_type   IS 'A component of an address that specifies a location by identification of a related road or public highway and a component of an address that specifies a location by identification of a street/thoroughfare by type.'
;
COMMENT ON COLUMN Address.street_or_thoroughfare_number          IS 'A component of an address that specifies a location by identification of an assigned numeral or string of numerals on a street/thoroughfare.'
;
COMMENT ON COLUMN Address.street_or_thoroughfare_section_name    IS 'A component of an address that specifies a location by identification of a distinct area of road or public highway.'
;
COMMENT ON COLUMN Address.street_or_thoroughfare_extension_name  IS 'A component of an address that specifies a location by identification of an expanded part of road or public highway.'
;

CREATE TABLE join_participant_collection_summary_to_race
(
	participant_collection_summary_ID  NUMBER(38),
	race_ID                            NUMBER(38)
)
;


CREATE TABLE specimen_collection_summary
(
	anatomic_source_ID               NUMBER(38),    --  Anatomic source from which the Specimen was collected Rem
	specimen_count                   NUMBER(38),    --  Number of specimens with the same collection summary information, originating from the same profile of patient Rem
	patient_age_group_at_collection  NUMBER(38),    --  Age of patient on tissue collection date Rem
	specimen_type_ID                 NUMBER(38),    --  A description of the type of specimen that is stored (blood, serum, tissue, DNA, ...) Rem
	is_collected_from                NUMBER(38),
	specimen_collection_summary_ID   NUMBER(38) NOT NULL,
	undergoes                        NUMBER(38)
)
;

COMMENT ON TABLE specimen_collection_summary IS 'Distinguishable portion of biomaterial'
;
COMMENT ON COLUMN specimen_collection_summary.anatomic_source_ID               IS 'Anatomic source from which the Specimen was collected'
;
COMMENT ON COLUMN specimen_collection_summary.specimen_count                   IS 'Number of specimens with the same collection summary information, originating from the same profile of patient'
;
COMMENT ON COLUMN specimen_collection_summary.patient_age_group_at_collection  IS 'Age of patient on tissue collection date'
;
COMMENT ON COLUMN specimen_collection_summary.specimen_type_ID                 IS 'A description of the type of specimen that is stored (blood, serum, tissue, DNA, ...)'
;

CREATE TABLE join_address_to_specimen_collection_contact
(
	specimen_collection_contact_ID  NUMBER(38),
	address_ID                      NUMBER(38)
)
;


CREATE TABLE specimen_collection_contact
(
	phone                           VARCHAR2(50),    --  Phone number of the Contact person Rem
	specimen_collection_contact_ID  NUMBER(38) NOT NULL
)
;

COMMENT ON TABLE specimen_collection_contact IS 'Contact information for the person who is responsible for the collection'
;
COMMENT ON COLUMN specimen_collection_contact.phone                           IS 'Phone number of the Contact person'
;

CREATE TABLE specimen_availability_summary_profile
(
	is_available_to_commercial_organizations  NUMBER(3),    --  Can specimen be provided to commercial organizations? Rem
	is_available_to_foreign_investigators     NUMBER(3),    --  Can specimen be provided to investigators at foreign institutions? Rem
	is_available_to_outside_institution       NUMBER(3),    --  Is specimen available to researchers outside this institution / group? Rem
	is_collaboration_required                 NUMBER(3),    --  Is collaboration required to obtain specimen? Rem
	specimen_availability_summary_profile_ID  NUMBER(38) NOT NULL
)
;

COMMENT ON TABLE specimen_availability_summary_profile IS 'Details of availability to specimens to types of requestors.'
;
COMMENT ON COLUMN specimen_availability_summary_profile.is_available_to_commercial_organizations  IS 'Can specimen be provided to commercial organizations?'
;
COMMENT ON COLUMN specimen_availability_summary_profile.is_available_to_foreign_investigators     IS 'Can specimen be provided to investigators at foreign institutions?'
;
COMMENT ON COLUMN specimen_availability_summary_profile.is_available_to_outside_institution       IS 'Is specimen available to researchers outside this institution / group?'
;
COMMENT ON COLUMN specimen_availability_summary_profile.is_collaboration_required                 IS 'Is collaboration required to obtain specimen?'
;

CREATE TABLE Race
(
	race            VARCHAR2(50),    --  Someone who takes part in an activity._An arbitrary classification of taxonomic group that is a division of a species; usually arise as a consequence of geographical isolation within a species and characterised by shared heredity, physical attributes and behavior, and in case of humans, by common history, nationality, or geographic distribution. Rem
	race_ID         NUMBER(38) NOT NULL,
	NCI_code        VARCHAR2(50),
	NCI_Definition  CLOB
)
;

COMMENT ON COLUMN Race.race            IS 'Someone who takes part in an activity._An arbitrary classification of taxonomic group that is a division of a species; usually arise as a consequence of geographical isolation within a species and characterised by shared heredity, physical attributes and behavior, and in case of humans, by common history, nationality, or geographic distribution.'
;

CREATE TABLE Preservation
(
	preservation_type                  NUMBER(38),    --  Method by which specimens are stored Rem
	storage_temperature_in_centigrade  NUMBER(38),    --  Temperature in degrees Centigrade at which the Specimen is stored Rem
	preservation_ID                    NUMBER(38) NOT NULL
)
;

COMMENT ON TABLE Preservation IS 'Information that describes the storage conditions for a collection of specimens'
;
COMMENT ON COLUMN Preservation.preservation_type                  IS 'Method by which specimens are stored'
;
COMMENT ON COLUMN Preservation.storage_temperature_in_centigrade  IS 'Temperature in degrees Centigrade at which the Specimen is stored'
;

CREATE TABLE participant_collection_summary
(
	participant_count                  NUMBER(38),    --  Number of participants with matching ethnicity, gender, and race profile Rem
	ethnicity_ID                       NUMBER(38),    --  Ethnicity of the Participant Rem
	gender_ID                          NUMBER(38),    --  Gender of Participant Rem
	registered_to                      NUMBER(38),
	participant_collection_summary_ID  NUMBER(38) NOT NULL
)
;

COMMENT ON TABLE participant_collection_summary IS 'Information about the Participant from whom the Specimen was collected'
;
COMMENT ON COLUMN participant_collection_summary.participant_count                  IS 'Number of participants with matching ethnicity, gender, and race profile'
;
COMMENT ON COLUMN participant_collection_summary.ethnicity_ID                       IS 'Ethnicity of the Participant'
;
COMMENT ON COLUMN participant_collection_summary.gender_ID                          IS 'Gender of Participant'
;

CREATE TABLE Institution
(
	homepage_URL    VARCHAR2(50),    --  URL for the institution or the institution's biobank Rem
	institution_ID  NUMBER(38) NOT NULL
)
;

COMMENT ON TABLE Institution IS 'Facility at which the Collection resides'
;
COMMENT ON COLUMN Institution.homepage_URL    IS 'URL for the institution or the institution''s biobank'
;

CREATE TABLE join_participant_collection_summary_todiagnosis
(
	diagnosis_ID                       NUMBER(38),
	participant_collection_summary_ID  NUMBER(38)
)
;


CREATE TABLE Diagnosis
(
	diagnosisType   VARCHAR2(225),    --  High-level groupings of diagnosis types Rem
	diagnosis_ID    NUMBER(38) NOT NULL,
	NCI_code        VARCHAR2(50),
	NCI_Definition  CLOB
)
;

COMMENT ON TABLE Diagnosis IS 'High level groupings of medical conditions with which participants have been diagnosed'
;
COMMENT ON COLUMN Diagnosis.diagnosisType   IS 'High-level groupings of diagnosis types'
;

CREATE TABLE join_collection_protocol_to_institution
(
	institution_ID          NUMBER(38),
	collection_protocol_ID  NUMBER(38)
)
;


CREATE TABLE collection_protocol
(
	date_last_updated     DATE,    --  Date collection information was most recently updated. Rem
	end_date              DATE,    --  Date when the study officially closes Rem
	name                  VARCHAR2(255),    --  The name of the study for which the specimens are identified. Rem
	start_date            DATE,    --  The date on which the collection begins collecting specimens Rem
	identifier            VARCHAR2(50),
	makes_available       NUMBER(38),
	is_assigned_to        NUMBER(38),
	collectionProtocolID  NUMBER(38) NOT NULL,
	is_constrained_by     NUMBER(38)
)
;

COMMENT ON TABLE collection_protocol IS 'The Protocol or Study for which the Specimens are collected'
;
COMMENT ON COLUMN collection_protocol.date_last_updated     IS 'Date collection information was most recently updated.'
;
COMMENT ON COLUMN collection_protocol.end_date              IS 'Date when the study officially closes'
;
COMMENT ON COLUMN collection_protocol.name                  IS 'The name of the study for which the specimens are identified.'
;
COMMENT ON COLUMN collection_protocol.start_date            IS 'The date on which the collection begins collecting specimens'
;

CREATE TABLE annotation_availability_profile
(
	has_additional_patient_demographics      NUMBER(3),    --  Are demographic information (e.g. age, sex, race, ethnicity) available? Rem
	has_exposure_history                     NUMBER(3),    --  Are the exposure data (e.g. smoking, alcohol, drugs, chemicals) available? Rem
	has_family_history                       NUMBER(3),    --  Are family history data available? Rem
	has_histopathologic_information          NUMBER(3),    --  Are histopathologic data (e.g. stage, grade, histologic type, subtype) available? Rem
	has_lab_data                             NUMBER(3),    --  Are lab data available? Rem
	has_longitudinal_specimens               NUMBER(3),    --  Are longitudinal specimens (specimens collected from the same patient over time) available? Rem
	has_matched_specimens                    NUMBER(3),    --  Are matched specimens (tumor and non-tumor from the same patient, tissue and blood from the same patient, for example) available? Rem
	has_outcome_information                  NUMBER(3),    --  Is outcome information (effectiveness of treatment, side effects, etc) available? Rem
	has_participants_available_for_followup  NUMBER(3),    --  For the collection (for example, clinical trial group), are patients available for follow-up? Rem
	has_treatment_information                NUMBER(3),    --  Are treatment data (e.g. drug, schedule) available? Rem
	annotation_availability_profile_ID       NUMBER(38) NOT NULL
)
;

COMMENT ON TABLE annotation_availability_profile IS 'Metadata describing the availability of information pertaining to specimens in a collection.'
;
COMMENT ON COLUMN annotation_availability_profile.has_additional_patient_demographics      IS 'Are demographic information (e.g. age, sex, race, ethnicity) available?'
;
COMMENT ON COLUMN annotation_availability_profile.has_exposure_history                     IS 'Are the exposure data (e.g. smoking, alcohol, drugs, chemicals) available?'
;
COMMENT ON COLUMN annotation_availability_profile.has_family_history                       IS 'Are family history data available?'
;
COMMENT ON COLUMN annotation_availability_profile.has_histopathologic_information          IS 'Are histopathologic data (e.g. stage, grade, histologic type, subtype) available?'
;
COMMENT ON COLUMN annotation_availability_profile.has_lab_data                             IS 'Are lab data available?'
;
COMMENT ON COLUMN annotation_availability_profile.has_longitudinal_specimens               IS 'Are longitudinal specimens (specimens collected from the same patient over time) available?'
;
COMMENT ON COLUMN annotation_availability_profile.has_matched_specimens                    IS 'Are matched specimens (tumor and non-tumor from the same patient, tissue and blood from the same patient, for example) available?'
;
COMMENT ON COLUMN annotation_availability_profile.has_outcome_information                  IS 'Is outcome information (effectiveness of treatment, side effects, etc) available?'
;
COMMENT ON COLUMN annotation_availability_profile.has_participants_available_for_followup  IS 'For the collection (for example, clinical trial group), are patients available for follow-up?'
;
COMMENT ON COLUMN annotation_availability_profile.has_treatment_information                IS 'Are treatment data (e.g. drug, schedule) available?'
;


ALTER TABLE patient_age_group ADD CONSTRAINT PK_patient_age_group 
	PRIMARY KEY (id)
;

ALTER TABLE gender ADD CONSTRAINT PK_gender 
	PRIMARY KEY (ID)
;

ALTER TABLE ethnicity ADD CONSTRAINT PK_ethnicity 
	PRIMARY KEY (id)
;

ALTER TABLE preservation_type ADD CONSTRAINT PK_preservation_type 
	PRIMARY KEY (id)
;

ALTER TABLE anatomic_source ADD CONSTRAINT PK_anatomic_source 
	PRIMARY KEY (id)
;

ALTER TABLE specimen_type ADD CONSTRAINT PK_specimen_type 
	PRIMARY KEY (id)
;

ALTER TABLE Person ADD CONSTRAINT PK_Person 
	PRIMARY KEY (person_ID)
;

ALTER TABLE Organization ADD CONSTRAINT PK_Organization 
	PRIMARY KEY (organization_ID)
;

ALTER TABLE Address ADD CONSTRAINT PK_Address 
	PRIMARY KEY (address_ID)
;

ALTER TABLE specimen_collection_summary ADD CONSTRAINT PK_SpecimenCollectionSummary 
	PRIMARY KEY (specimen_collection_summary_ID)
;

ALTER TABLE specimen_collection_contact ADD CONSTRAINT PK_SpecimenCollectionContact 
	PRIMARY KEY (specimen_collection_contact_ID)
;

ALTER TABLE specimen_availability_summary_profile ADD CONSTRAINT PK_SpecimenAvailabilitySummaryProfile 
	PRIMARY KEY (specimen_availability_summary_profile_ID)
;

ALTER TABLE Race ADD CONSTRAINT PK_Race 
	PRIMARY KEY (race_ID)
;

ALTER TABLE Preservation ADD CONSTRAINT PK_Preservation 
	PRIMARY KEY (preservation_ID)
;

ALTER TABLE participant_collection_summary ADD CONSTRAINT PK_ParticipantCollectionSummary 
	PRIMARY KEY (participant_collection_summary_ID)
;

ALTER TABLE Institution ADD CONSTRAINT PK_Institution 
	PRIMARY KEY (institution_ID)
;

ALTER TABLE Diagnosis ADD CONSTRAINT PK_Diagnosis 
	PRIMARY KEY (diagnosis_ID)
;

ALTER TABLE collection_protocol ADD CONSTRAINT PK_CollectionProtocol 
	PRIMARY KEY (collectionProtocolID)
;

ALTER TABLE annotation_availability_profile ADD CONSTRAINT PK_AnnotationAvailabilityProfile 
	PRIMARY KEY (annotation_availability_profile_ID)
;


ALTER TABLE gender
	ADD CONSTRAINT UQ_gender_gender UNIQUE (gender)
;

ALTER TABLE gender
	ADD CONSTRAINT UQ_gender_NCI_code UNIQUE (NCI_code)
;

ALTER TABLE ethnicity
	ADD CONSTRAINT UQ_ethnicity_NCI_code UNIQUE (NCI_code)
;

ALTER TABLE ethnicity
	ADD CONSTRAINT UQ_ethnicity_ethnicity UNIQUE (ethnicity)
;

ALTER TABLE preservation_type
	ADD CONSTRAINT UQ_preservation_type_NCI_code UNIQUE (NCI_code)
;

ALTER TABLE preservation_type
	ADD CONSTRAINT UQ_preservation_type_preservation_type UNIQUE (preservation_type)
;

ALTER TABLE anatomic_source
	ADD CONSTRAINT UQ_anatomic_source_anatomic_source UNIQUE (anatomic_source)
;

ALTER TABLE anatomic_source
	ADD CONSTRAINT UQ_anatomic_source_NCI_code UNIQUE (NCI_code)
;

ALTER TABLE specimen_type
	ADD CONSTRAINT UQ_specimen_type_NCI_code UNIQUE (NCI_code)
;

ALTER TABLE specimen_type
	ADD CONSTRAINT UQ_specimen_type_specimen_type UNIQUE (specimen_type)
;

ALTER TABLE Race
	ADD CONSTRAINT UQ_race_race UNIQUE (race)
;

ALTER TABLE Race
	ADD CONSTRAINT UQ_race_NCI_code UNIQUE (NCI_code)
;

ALTER TABLE Diagnosis
	ADD CONSTRAINT UQ_Diagnosis_diagnosisType UNIQUE (diagnosisType)
;

ALTER TABLE Diagnosis
	ADD CONSTRAINT UQ_Diagnosis_NCI_code UNIQUE (NCI_code)
;


ALTER TABLE specimen_collection_summary ADD CONSTRAINT FK_specimen_collection_summary_patient_age 
	FOREIGN KEY (patient_age_group_at_collection) REFERENCES patient_age_group (id)
;

ALTER TABLE specimen_collection_summary ADD CONSTRAINT FK_SpecimenCollectionSummary_anatomic_source 
	FOREIGN KEY (anatomic_source_ID) REFERENCES anatomic_source (anatomic_source)
;

ALTER TABLE specimen_collection_summary ADD CONSTRAINT FK_SpecimenCollectionSummary_specimen_type 
	FOREIGN KEY (specimen_type_ID) REFERENCES specimen_type (specimen_type)
;

ALTER TABLE specimen_collection_summary ADD CONSTRAINT FK_is_collected_from 
	FOREIGN KEY (is_collected_from) REFERENCES participant_collection_summary (participant_collection_summary_ID)
;

ALTER TABLE specimen_collection_summary ADD CONSTRAINT FK_undergoes 
	FOREIGN KEY (undergoes) REFERENCES Preservation (preservation_ID)
;

ALTER TABLE join_address_to_specimen_collection_contact ADD CONSTRAINT SpecimenCollectionContact 
	FOREIGN KEY (specimen_collection_contact_ID) REFERENCES specimen_collection_contact (specimen_collection_contact_ID)
;

ALTER TABLE join_address_to_specimen_collection_contact ADD CONSTRAINT Address 
	FOREIGN KEY (address_ID) REFERENCES Address (address_ID)
;

ALTER TABLE specimen_collection_contact ADD CONSTRAINT FK_SpecimenCollectionContact_Person 
	FOREIGN KEY (specimen_collection_contact_ID) REFERENCES Person (person_ID)
;

ALTER TABLE Preservation ADD CONSTRAINT FK_Preservation_preservation_type 
	FOREIGN KEY (preservation_type) REFERENCES preservation_type (preservation_type)
;

ALTER TABLE participant_collection_summary ADD CONSTRAINT FK_gender_ID 
	FOREIGN KEY (gender_ID) REFERENCES gender (ID)
;

ALTER TABLE Institution ADD CONSTRAINT FK_Institution_Organization 
	FOREIGN KEY (institution_ID) REFERENCES Organization (organization_ID)
;

ALTER TABLE join_participant_collection_summary_todiagnosis ADD CONSTRAINT Diagnosis 
	FOREIGN KEY (diagnosis_ID) REFERENCES Diagnosis (diagnosis_ID)
;

ALTER TABLE join_participant_collection_summary_todiagnosis ADD CONSTRAINT ParticipantCollectionSummary 
	FOREIGN KEY (participant_collection_summary_ID) REFERENCES participant_collection_summary (participant_collection_summary_ID)
;

ALTER TABLE join_collection_protocol_to_institution ADD CONSTRAINT Institution 
	FOREIGN KEY (institution_ID) REFERENCES Institution (institution_ID)
;

ALTER TABLE join_collection_protocol_to_institution ADD CONSTRAINT CollectionProtocol 
	FOREIGN KEY (collection_protocol_ID) REFERENCES collection_protocol (collectionProtocolID)
;

ALTER TABLE collection_protocol ADD CONSTRAINT FK_makes_available 
	FOREIGN KEY (makes_available) REFERENCES annotation_availability_profile (annotation_availability_profile_ID)
;

ALTER TABLE collection_protocol ADD CONSTRAINT FK_is_assigned_to 
	FOREIGN KEY (is_assigned_to) REFERENCES specimen_collection_contact (specimen_collection_contact_ID)
;

ALTER TABLE collection_protocol ADD CONSTRAINT FK_is_constrained_by 
	FOREIGN KEY (is_constrained_by) REFERENCES specimen_availability_summary_profile (specimen_availability_summary_profile_ID)
;
