DROP TABLE IF EXISTS patient_age_group_at_collection
;
DROP TABLE IF EXISTS gender
;
DROP TABLE IF EXISTS ethnicity
;
DROP TABLE IF EXISTS preservation_type
;
DROP TABLE IF EXISTS anatomic_source
;
DROP TABLE IF EXISTS specimen_type
;
DROP TABLE IF EXISTS Person
;
DROP TABLE IF EXISTS Organization
;
DROP TABLE IF EXISTS Address
;
DROP TABLE IF EXISTS join_participant_collection_summary_to_race
;
DROP TABLE IF EXISTS specimen_collection_summary
;
DROP TABLE IF EXISTS join_address_to_specimen_collection_contact
;
DROP TABLE IF EXISTS specimen_collection_contact
;
DROP TABLE IF EXISTS specimen_availability_summary_profile
;
DROP TABLE IF EXISTS Race
;
DROP TABLE IF EXISTS Preservation
;
DROP TABLE IF EXISTS participant_collection_summary
;
DROP TABLE IF EXISTS Institution
;
DROP TABLE IF EXISTS join_participant_collection_summary_todiagnosis
;
DROP TABLE IF EXISTS Diagnosis
;
DROP TABLE IF EXISTS join_collection_protocol_to_institution
;
DROP TABLE IF EXISTS collection_protocol
;
DROP TABLE IF EXISTS annotation_availability_profile
;



CREATE TABLE patient_age_group_at_collection
(
	id INTEGER NOT NULL,
	age_group_low INTEGER,
	age_group_high INTEGER,
	PRIMARY KEY (id)
) 
;


CREATE TABLE gender
(
	gender VARCHAR(50) NOT NULL,
	id INTEGER NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (gender),
	UNIQUE (NCI_code)
) 
;


CREATE TABLE ethnicity
(
	ethnicity VARCHAR(50) NOT NULL,
	id INTEGER NOT NULL,
	NCI_code VARCHAR(50),
	NCI_definition TEXT,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (NCI_code),
	UNIQUE (ethnicity)
) 
;


CREATE TABLE preservation_type
(
	id INTEGER NOT NULL,
	preservation_type VARCHAR(100) NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (NCI_code),
	UNIQUE (preservation_type)
) 
;


CREATE TABLE anatomic_source
(
	id INTEGER NOT NULL,
	anatomic_source VARCHAR(150) NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (id),
	UNIQUE (anatomic_source),
	UNIQUE (id),
	UNIQUE (NCI_code)
) 
;


CREATE TABLE specimen_type
(
	id INTEGER NOT NULL,
	specimen_type VARCHAR(50) NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (NCI_code),
	UNIQUE (specimen_type)
) 
;


CREATE TABLE Person
(
	full_name VARCHAR(50) COMMENT 'A formatted means of uniquely identifying an individual derived from multiple naming elements; first middle and last names.  ',
	first_name VARCHAR(50) COMMENT 'A word or group of words indicating a person''s first (personal or given) name; the name that precedes the surname. Synonym = Given Name. ',
	last_name VARCHAR(50) COMMENT 'A means of identifying an individual by using a word or group of words indicating a person''s last (family) name. Synonym = Last Name, Surname.',
	middle_name_or_initial VARCHAR(50) COMMENT 'A means of identifying an individual by using a word or group of words indicating a person''s middle name.',
	email_address VARCHAR(50) COMMENT 'The string of characters that represents the electronic mail address of a person.',
	person_ID INTEGER NOT NULL,
	PRIMARY KEY (person_ID)
) 
;


CREATE TABLE Organization
(
	name VARCHAR(150) COMMENT 'The name of the organization or an institution.',
	organization_ID INTEGER NOT NULL,
	PRIMARY KEY (organization_ID)
)  COMMENT='A formal group of people that exists to further a...'
;


CREATE TABLE Address
(
	city VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of a city, town, or village.',
	country VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of a country.',
	department_or_division VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of a specialized division of a large organization.',
	entity_name VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of a specific person, corporation, organization, building or similar unit.',
	entity_number VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of a specific person, corporation, organization, building or similar unit.',
	floor_or_premises VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of the story or level of a building.',
	post_office_box VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of a delivery box at a postal facility.',
	zip_code VARCHAR(50) COMMENT 'The string of characters used to identify the five-digit Zone Improvement Plan (ZIP) code and the four-digit extension code (if available) that represents the geographic ...',
	state VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of a principal administrative unit of a country.',
	street_post_directional VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of directional text occurring after the street/thoroughfare name.',
	street_pre_directional VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of directional text occurring before the street/thoroughfare name.',
	street_or_thoroughfare_name_and_type VARCHAR(150) COMMENT 'A component of an address that specifies a location by identification of a related road or public highway and a component of an address that specifies a location by identification of a street/thoroughfare by type.',
	street_or_thoroughfare_number VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of an assigned numeral or string of numerals on a street/thoroughfare.',
	street_or_thoroughfare_section_name VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of a distinct area of road or public highway.',
	street_or_thoroughfare_extension_name VARCHAR(50) COMMENT 'A component of an address that specifies a location by identification of an expanded part of road or public highway.',
	address_ID INTEGER NOT NULL,
	PRIMARY KEY (address_ID)
)  COMMENT='A standardized representation of the location of...'
;


CREATE TABLE join_participant_collection_summary_to_race
(
	participant_collection_summary_ID INTEGER,
	race VARCHAR(50),
	race_id INTEGER,
	KEY (race_id),
	KEY (race)
) 
;


CREATE TABLE specimen_collection_summary
(
	specimen_collection_summary_ID INTEGER NOT NULL,
	anatomic_source_id INTEGER COMMENT 'Anatomic source from which the Specimen was collected',
	anatomic_source VARCHAR(150),
	specimen_count INTEGER COMMENT 'Number of specimens with the same collection summary information, originating from the same profile of patient',
	patient_age_group_at_collection INTEGER COMMENT 'Age of patient on tissue collection date',
	specimen_type_id INTEGER,
	specimen_type VARCHAR(50) COMMENT 'A description of the type of specimen that is stored (blood, serum, tissue, DNA, ...)',
	is_collected_from INTEGER,
	undergoes INTEGER,
	qualifiesPatientAgeAtSpecimenCollection INTEGER,
	PRIMARY KEY (specimen_collection_summary_ID),
	KEY (anatomic_source_id),
	KEY (patient_age_group_at_collection),
	KEY (specimen_type_id),
	KEY (is_collected_from),
	KEY (undergoes),
	KEY (qualifiesPatientAgeAtSpecimenCollection)
)  COMMENT='Distinguishable portion of biomaterial'
;


CREATE TABLE join_address_to_specimen_collection_contact
(
	specimen_collection_contact_ID INTEGER,
	address_ID INTEGER,
	KEY (specimen_collection_contact_ID),
	KEY (address_ID)
) 
;


CREATE TABLE specimen_collection_contact
(
	phone VARCHAR(50) COMMENT 'Phone number of the Contact person',
	specimen_collection_contact_ID INTEGER NOT NULL,
	PRIMARY KEY (specimen_collection_contact_ID),
	KEY (specimen_collection_contact_ID)
)  COMMENT='Contact information for the person who is responsible...'
;


CREATE TABLE specimen_availability_summary_profile
(
	is_available_to_commercial_organizations BOOL COMMENT 'Can specimen be provided to commercial organizations?',
	is_available_to_foreign_investigators BOOL COMMENT 'Can specimen be provided to investigators at foreign institutions?',
	is_available_to_outside_institution BOOL COMMENT 'Is specimen available to researchers outside this institution / group?',
	is_collaboration_required BOOL COMMENT 'Is collaboration required to obtain specimen?',
	specimen_availability_summary_profile_ID INTEGER NOT NULL,
	PRIMARY KEY (specimen_availability_summary_profile_ID)
)  COMMENT='Details of availability to specimens to types of requestors.'
;


CREATE TABLE Race
(
	race VARCHAR(50) NOT NULL COMMENT 'Someone who takes part in an activity._An arbitrary classification of t...',
	race_ID INTEGER NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (race_ID),
	UNIQUE (race_ID),
	UNIQUE (race),
	UNIQUE (NCI_code)
) 
;


CREATE TABLE Preservation
(
	preservation_type VARCHAR(100) COMMENT 'Method by which specimens are stored',
	storage_temperature_in_centigrade INTEGER COMMENT 'Temperature in degrees Centigrade at which the Specimen is stored',
	preservation_ID INTEGER NOT NULL,
	PRIMARY KEY (preservation_ID),
	KEY (preservation_ID)
)  COMMENT='Information that describes the storage conditions...'
;


CREATE TABLE participant_collection_summary
(
	participant_count INTEGER COMMENT 'Number of participants with matching ethnicity, gender, and race profile',
	registered_to INTEGER,
	participant_collection_summary_ID INTEGER NOT NULL,
	ethnicity VARCHAR(50),
	ethnicity_id INTEGER,
	gender VARCHAR(50),
	gender_id INTEGER,
	PRIMARY KEY (participant_collection_summary_ID),
	KEY (ethnicity_id),
	KEY (gender_id),
	KEY (registered_to)
)  COMMENT='Information about the Participant from whom the Specimen...'
;


CREATE TABLE Institution
(
	homepage_URL VARCHAR(50) COMMENT 'URL for the institution or the institution''s biobank',
	institution_ID INTEGER NOT NULL,
	PRIMARY KEY (institution_ID),
	KEY (institution_ID)
)  COMMENT='Facility at which the Collection resides'
;


CREATE TABLE join_participant_collection_summary_todiagnosis
(
	diagnosis VARCHAR(225),
	diagnosis_id INTEGER,
	participant_collection_summary_ID INTEGER,
	KEY (participant_collection_summary_ID),
	KEY (diagnosis_id),
	KEY (diagnosis)
) 
;


CREATE TABLE Diagnosis
(
	diagnosisType VARCHAR(225) NOT NULL COMMENT 'High-level groupings of diagnosis types',
	diagnosis_ID INTEGER NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (diagnosis_ID),
	UNIQUE (diagnosis_ID),
	UNIQUE (diagnosisType),
	UNIQUE (NCI_code)
)  COMMENT='High level groupings of medical conditions with which ...'
;


CREATE TABLE join_collection_protocol_to_institution
(
	institution_ID INTEGER,
	collection_protocol_ID INTEGER,
	KEY (institution_ID),
	KEY (collection_protocol_ID)
) 
;


CREATE TABLE collection_protocol
(
	date_last_updated DATE COMMENT 'Date collection information was most recently updated.',
	end_date DATE COMMENT 'Date when the study officially closes',
	name VARCHAR(255) COMMENT 'The name of the study for which the specimens are identified.',
	start_date DATE COMMENT 'The date on which the collection begins collecting specimens',
	identifier VARCHAR(50),
	makes_available INTEGER,
	is_assigned_to INTEGER,
	collectionProtocolID INTEGER NOT NULL,
	is_constrained_by INTEGER,
	PRIMARY KEY (collectionProtocolID),
	KEY (makes_available),
	KEY (is_assigned_to),
	KEY (is_constrained_by)
)  COMMENT='The Protocol or Study for which the Specimens are collected'
;


CREATE TABLE annotation_availability_profile
(
	has_additional_patient_demographics BOOL COMMENT 'Are demographic information (e.g. age, sex, race, ethnicity) available?',
	has_exposure_history BOOL COMMENT 'Are the exposure data (e.g. smoking, alcohol, drugs, chemicals) available?',
	has_family_history BOOL COMMENT 'Are family history data available?',
	has_histopathologic_information BOOL COMMENT 'Are histopathologic data (e.g. stage, grade, histologic type, subtype) available?',
	has_lab_data BOOL COMMENT 'Are lab data available?',
	has_longitudinal_specimens BOOL COMMENT 'Are longitudinal specimens (specimens collected from the same patient over time) available?',
	has_matched_specimens BOOL COMMENT 'Are matched specimens (tumor and non-tumor from the same patient, tissue and blood from the same patient, for example) available?',
	has_outcome_information BOOL COMMENT 'Is outcome information (effectiveness of treatment, side effects, etc) available?',
	has_participants_available_for_followup BOOL COMMENT 'For the collection (for example, clinical trial group), are patients available for follow-up?',
	has_treatment_information BOOL COMMENT 'Are treatment data (e.g. drug, schedule) available?',
	annotation_availability_profile_ID INTEGER NOT NULL,
	PRIMARY KEY (annotation_availability_profile_ID)
)  COMMENT='Metadata describing the availability of information ...'
;





ALTER TABLE join_participant_collection_summary_to_race ADD CONSTRAINT FK_join_participant_collection_summary_to_race_id_Race 
	FOREIGN KEY (race_id) REFERENCES Race (race_ID)
;

ALTER TABLE specimen_collection_summary ADD CONSTRAINT FK_specimen_collection_summary_anatomic_source 
	FOREIGN KEY (anatomic_source_id) REFERENCES anatomic_source (id)
;

ALTER TABLE specimen_collection_summary ADD CONSTRAINT FK_specimen_collection_summary_patient_age_group_at_collection 
	FOREIGN KEY (patient_age_group_at_collection) REFERENCES patient_age_group_at_collection (id)
;

ALTER TABLE specimen_collection_summary ADD CONSTRAINT FK_specimen_collection_summary_specimen_type 
	FOREIGN KEY (specimen_type_id) REFERENCES specimen_type (id)
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
	FOREIGN KEY (preservation_ID) REFERENCES preservation_type (id)
;

ALTER TABLE participant_collection_summary ADD CONSTRAINT FK_participant_collection_summary_ethnicity 
	FOREIGN KEY (ethnicity_id) REFERENCES ethnicity (id)
;

ALTER TABLE participant_collection_summary ADD CONSTRAINT FK_participant_collection_summary_gender 
	FOREIGN KEY (gender_id) REFERENCES gender (id)
;

ALTER TABLE Institution ADD CONSTRAINT FK_Institution_Organization 
	FOREIGN KEY (institution_ID) REFERENCES Organization (organization_ID)
;

ALTER TABLE join_participant_collection_summary_todiagnosis ADD CONSTRAINT FK_join_participant_collection_summary_todiagnosis 
	FOREIGN KEY (participant_collection_summary_ID) REFERENCES participant_collection_summary (participant_collection_summary_ID)
;

ALTER TABLE join_participant_collection_summary_todiagnosis ADD CONSTRAINT FK_join_participant_collection_summary_todiagnosis_id_Diagnosis 
	FOREIGN KEY (diagnosis_id) REFERENCES Diagnosis (diagnosis_ID)
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
