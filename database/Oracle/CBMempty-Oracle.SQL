SET FOREIGN_KEY_CHECKS=0;



DROP TABLE IF EXISTS Address CASCADE
;
DROP TABLE IF EXISTS anatomic_source CASCADE
;
DROP TABLE IF EXISTS annotation_availability_profile CASCADE
;
DROP TABLE IF EXISTS collection_protocol CASCADE
;
DROP TABLE IF EXISTS Diagnosis CASCADE
;
DROP TABLE IF EXISTS ethnicity CASCADE
;
DROP TABLE IF EXISTS gender CASCADE
;
DROP TABLE IF EXISTS Institution CASCADE
;
DROP TABLE IF EXISTS join_collection_protocol_to_institution CASCADE
;
DROP TABLE IF EXISTS join_participant_collection_summary_to_race CASCADE
;
DROP TABLE IF EXISTS join_participant_collection_summary_todiagnosis CASCADE
;
DROP TABLE IF EXISTS Organization CASCADE
;
DROP TABLE IF EXISTS participant_collection_summary CASCADE
;
DROP TABLE IF EXISTS patient_age_group_at_collection CASCADE
;
DROP TABLE IF EXISTS Person CASCADE
;
DROP TABLE IF EXISTS Preservation CASCADE
;
DROP TABLE IF EXISTS preservation_type CASCADE
;
DROP TABLE IF EXISTS Race CASCADE
;
DROP TABLE IF EXISTS specimen_availability_summary_profile CASCADE
;
DROP TABLE IF EXISTS specimen_collection_contact CASCADE
;
DROP TABLE IF EXISTS specimen_collection_summary CASCADE
;
DROP TABLE IF EXISTS specimen_type CASCADE
;

CREATE TABLE Address
(
	city VARCHAR(50),
	country VARCHAR(50),
	department_or_division VARCHAR(50),
	entity_name VARCHAR(50),
	entity_number VARCHAR(50),
	floor_or_premises VARCHAR(50),
	post_office_box VARCHAR(50),
	zip_code VARCHAR(50),
	state VARCHAR(50),
	street_post_directional VARCHAR(50),
	street_pre_directional VARCHAR(50),
	street_or_thoroughfare_name_and_type VARCHAR(150),
	street_or_thoroughfare_number VARCHAR(50),
	street_or_thoroughfare_section_name VARCHAR(50),
	street_or_thoroughfare_extension_name VARCHAR(50),
	address_ID INTEGER NOT NULL,
	PRIMARY KEY (address_ID)

) 
;


CREATE TABLE anatomic_source
(
	id INTEGER NOT NULL,
	anatomic_source VARCHAR(150) NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (id),
	UNIQUE UQ_anatomic_source_anatomic_source(anatomic_source),
	UNIQUE UQ_anatomic_source_id(id),
	UNIQUE UQ_anatomic_source_NCI_code(NCI_code)

) 
;


CREATE TABLE annotation_availability_profile
(
	has_additional_patient_demographics BOOL,
	has_exposure_history BOOL,
	has_family_history BOOL,
	has_histopathologic_information BOOL,
	has_lab_data BOOL,
	has_longitudinal_specimens BOOL,
	has_matched_specimens BOOL,
	has_outcome_information BOOL,
	has_participants_available_for_followup BOOL,
	has_treatment_information BOOL,
	annotation_availability_profile_ID INTEGER NOT NULL,
	PRIMARY KEY (annotation_availability_profile_ID)

) 
;


CREATE TABLE collection_protocol
(
	date_last_updated DATE,
	end_date DATE,
	name VARCHAR(255),
	start_date DATE,
	identifier VARCHAR(50),
	makes_available INTEGER,
	is_assigned_to INTEGER,
	collectionProtocolID INTEGER NOT NULL,
	is_constrained_by INTEGER,
	PRIMARY KEY (collectionProtocolID),
	KEY (makes_available),
	KEY (is_assigned_to),
	KEY (is_constrained_by)

) 
;


CREATE TABLE Diagnosis
(
	diagnosisType VARCHAR(225) NOT NULL,
	diagnosis_ID INTEGER NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (diagnosis_ID),
	UNIQUE UQ_Diagnosis_diagnosis_ID(diagnosis_ID),
	UNIQUE UQ_Diagnosis_diagnosisType(diagnosisType),
	UNIQUE UQ_Diagnosis_NCI_code(NCI_code)

) 
;


CREATE TABLE ethnicity
(
	ethnicity VARCHAR(50) NOT NULL,
	id INTEGER NOT NULL,
	NCI_code VARCHAR(50),
	NCI_definition TEXT,
	PRIMARY KEY (id),
	UNIQUE UQ_ethnicity_id(id),
	UNIQUE UQ_ethnicity_NCI_code(NCI_code),
	UNIQUE UQ_ethnicity_ethnicity(ethnicity)

) 
;


CREATE TABLE gender
(
	gender VARCHAR(50) NOT NULL,
	id INTEGER NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (id),
	UNIQUE UQ_gender_id(id),
	UNIQUE UQ_gender_gender(gender),
	UNIQUE UQ_gender_NCI_code(NCI_code)

) 
;


CREATE TABLE Institution
(
	homepage_URL VARCHAR(50),
	institution_ID INTEGER NOT NULL,
	PRIMARY KEY (institution_ID)

) 
;


CREATE TABLE join_collection_protocol_to_institution
(
	institution_ID INTEGER,
	collection_protocol_ID INTEGER,
	KEY (institution_ID),
	KEY (collection_protocol_ID)

) 
;


CREATE TABLE join_participant_collection_summary_to_race
(
	participant_collection_summary_ID INTEGER,
	race_id INTEGER,
	KEY (participant_collection_summary_ID),
	KEY (race_id)

) 
;


CREATE TABLE join_participant_collection_summary_todiagnosis
(
	diagnosis_id INTEGER,
	participant_collection_summary_ID INTEGER,
	KEY (participant_collection_summary_ID),
	KEY (diagnosis_id)

) 
;


CREATE TABLE Organization
(
	name VARCHAR(150),
	organization_ID INTEGER NOT NULL,
	PRIMARY KEY (organization_ID)

) 
;


CREATE TABLE participant_collection_summary
(
	participant_count INTEGER,
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

) 
;


CREATE TABLE patient_age_group_at_collection
(
	id INTEGER NOT NULL,
	age_group_low INTEGER,
	age_group_high INTEGER,
	PRIMARY KEY (id)

) 
;


CREATE TABLE Person
(
	full_name VARCHAR(50),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	middle_name_or_initial VARCHAR(50),
	email_address VARCHAR(50),
	person_ID INTEGER NOT NULL,
	PRIMARY KEY (person_ID)

) 
;


CREATE TABLE Preservation
(
	preservation_type VARCHAR(100),
	storage_temperature_in_centigrade INTEGER,
	preservation_ID INTEGER NOT NULL,
	PRIMARY KEY (preservation_ID)

) 
;


CREATE TABLE preservation_type
(
	id INTEGER NOT NULL,
	preservation_type VARCHAR(100) NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (id),
	UNIQUE UQ_preservation_type_id(id),
	UNIQUE UQ_preservation_type_NCI_code(NCI_code),
	UNIQUE UQ_preservation_type_preservation_type(preservation_type)

) 
;


CREATE TABLE Race
(
	race VARCHAR(50) NOT NULL,
	race_ID INTEGER NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (race_ID),
	UNIQUE UQ_Race_race_ID(race_ID),
	UNIQUE UQ_race_race(race),
	UNIQUE UQ_race_NCI_code(NCI_code)

) 
;


CREATE TABLE specimen_availability_summary_profile
(
	is_available_to_commercial_organizations BOOL,
	is_available_to_foreign_investigators BOOL,
	is_available_to_outside_institution BOOL,
	is_collaboration_required BOOL,
	specimen_availability_summary_profile_ID INTEGER NOT NULL,
	PRIMARY KEY (specimen_availability_summary_profile_ID)

) 
;


CREATE TABLE specimen_collection_contact
(
	phone VARCHAR(50),
	specimen_collection_contact_ID INTEGER NOT NULL,
	address_id INTEGER,
	PRIMARY KEY (specimen_collection_contact_ID),
	KEY (address_id)

) 
;


CREATE TABLE specimen_collection_summary
(
	specimen_collection_summary_ID INTEGER NOT NULL,
	anatomic_source_id INTEGER,
	anatomic_source VARCHAR(150),
	specimen_count INTEGER,
	patient_age_group_at_collection INTEGER,
	specimen_type_id INTEGER,
	specimen_type VARCHAR(50),
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

) 
;


CREATE TABLE specimen_type
(
	id INTEGER NOT NULL,
	specimen_type VARCHAR(50) NOT NULL,
	NCI_code VARCHAR(50),
	NCI_Definition TEXT,
	PRIMARY KEY (id),
	UNIQUE UQ_specimen_type_id(id),
	UNIQUE UQ_specimen_type_NCI_code(NCI_code),
	UNIQUE UQ_specimen_type_specimen_type(specimen_type)

) 
;



SET FOREIGN_KEY_CHECKS=1;


ALTER TABLE collection_protocol ADD CONSTRAINT FK_makes_available 
	FOREIGN KEY (makes_available) REFERENCES annotation_availability_profile (annotation_availability_profile_ID)
;

ALTER TABLE collection_protocol ADD CONSTRAINT FK_is_assigned_to 
	FOREIGN KEY (is_assigned_to) REFERENCES specimen_collection_contact (specimen_collection_contact_ID)
;

ALTER TABLE collection_protocol ADD CONSTRAINT FK_is_constrained_by 
	FOREIGN KEY (is_constrained_by) REFERENCES specimen_availability_summary_profile (specimen_availability_summary_profile_ID)
;

ALTER TABLE Institution ADD CONSTRAINT FK_Institution_Organization 
	FOREIGN KEY (institution_ID) REFERENCES Organization (organization_ID)
;

ALTER TABLE join_collection_protocol_to_institution ADD CONSTRAINT Institution 
	FOREIGN KEY (institution_ID) REFERENCES Institution (institution_ID)
;

ALTER TABLE join_collection_protocol_to_institution ADD CONSTRAINT CollectionProtocol 
	FOREIGN KEY (collection_protocol_ID) REFERENCES collection_protocol (collectionProtocolID)
;

ALTER TABLE join_participant_collection_summary_to_race ADD CONSTRAINT FK_join_participant_collection_summary_to_race_participant_collection_summary 
	FOREIGN KEY (participant_collection_summary_ID) REFERENCES participant_collection_summary (participant_collection_summary_ID)
;

ALTER TABLE join_participant_collection_summary_to_race ADD CONSTRAINT FK_join_participant_collection_summary_to_race_Race 
	FOREIGN KEY (race_id) REFERENCES Race (race_ID)
;

ALTER TABLE join_participant_collection_summary_todiagnosis ADD CONSTRAINT FK_join_participant_collection_summary_todiagnosis 
	FOREIGN KEY (participant_collection_summary_ID) REFERENCES participant_collection_summary (participant_collection_summary_ID)
;

ALTER TABLE join_participant_collection_summary_todiagnosis ADD CONSTRAINT FK_join_participant_collection_summary_todiagnosis_id_Diagnosis 
	FOREIGN KEY (diagnosis_id) REFERENCES Diagnosis (diagnosis_ID)
;

ALTER TABLE participant_collection_summary ADD CONSTRAINT FK_participant_collection_summary_ethnicity 
	FOREIGN KEY (ethnicity_id) REFERENCES ethnicity (id)
;

ALTER TABLE participant_collection_summary ADD CONSTRAINT FK_participant_collection_summary_gender 
	FOREIGN KEY (gender_id) REFERENCES gender (id)
;

ALTER TABLE Preservation ADD CONSTRAINT FK_Preservation_preservation_type 
	FOREIGN KEY (preservation_ID) REFERENCES preservation_type (id)
;

ALTER TABLE specimen_collection_contact ADD CONSTRAINT FK_specimen_collection_contact_Address 
	FOREIGN KEY (address_id) REFERENCES Address (address_ID)
;

ALTER TABLE specimen_collection_contact ADD CONSTRAINT FK_SpecimenCollectionContact_Person 
	FOREIGN KEY (specimen_collection_contact_ID) REFERENCES Person (person_ID)
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
