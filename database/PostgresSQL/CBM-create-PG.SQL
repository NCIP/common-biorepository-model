drop table if exists "patient_age_group" cascade;
drop table if exists "gender" cascade;
drop table if exists "ethnicity" cascade;
drop table if exists "preservation_type" cascade;
drop table if exists "anatomic_source" cascade;
drop table if exists "specimen_type" cascade;
drop table if exists "person" cascade;
drop table if exists "organization" cascade;
drop table if exists "address" cascade;
drop table if exists "join_participant_collection_summary_to_race" cascade;
drop table if exists "specimen_collection_summary" cascade;
drop table if exists "join_address_to_specimen_collection_contact" cascade;
drop table if exists "specimen_collection_contact" cascade;
drop table if exists "specimen_availability_summary_profile" cascade;
drop table if exists "race" cascade;
drop table if exists "preservation" cascade;
drop table if exists "participant_collection_summary" cascade;
drop table if exists "institution" cascade;
drop table if exists "join_participant_collection_summary_todiagnosis" cascade;
drop table if exists "diagnosis" cascade;
drop table if exists "join_collection_protocol_to_institution" cascade;
drop table if exists "collection_protocol" cascade;
drop table if exists "annotation_availability_profile" cascade;

create table "patient_age_group" ( 
	"id" integer not null,
	"age_group_low" integer,
	"age_group_high" integer
);

create table "gender" ( 
	"gender" varchar(50),
	"id" integer not null,
	"nci_code" varchar(50),
	"nci_definition" text
);

create table "ethnicity" ( 
	"ethnicity" varchar(50),
	"id" integer not null,
	"nci_code" varchar(50),
	"nci_definition" text
);

create table "preservation_type" ( 
	"id" integer not null,
	"preservation_type" varchar(100),
	"nci_code" varchar(50),
	"nci_definition" text
);

create table "anatomic_source" ( 
	"id" integer not null,
	"anatomic_source" varchar(150),
	"nci_code" varchar(50),
	"nci_definition" text
);

create table "specimen_type" ( 
	"id" integer not null,
	"specimen_type" varchar(50),
	"nci_code" varchar(50),
	"nci_definition" text
);

create table "person" ( 
	"full_name" varchar(50),
	"first_name" varchar(50),
	"last_name" varchar(50),
	"middle_name_or_initial" varchar(50),
	"email_address" varchar(50),
	"person_id" integer not null
);

create table "organization" ( 
	"name" varchar(150),
	"organization_id" integer not null
);

create table "address" ( 
	"city" varchar(50),
	"country" varchar(50),
	"department_or_division" varchar(50),
	"entity_name" varchar(50),
	"entity_number" varchar(50),
	"floor_or_premises" varchar(50),
	"post_office_box" varchar(50),
	"zip_code" varchar(50),
	"state" varchar(50),
	"street_post_directional" varchar(50),
	"street_pre_directional" varchar(50),
	"street_or_thoroughfare_name_and_type" varchar(150),
	"street_or_thoroughfare_number" varchar(50),
	"street_or_thoroughfare_section_name" varchar(50),
	"street_or_thoroughfare_extension_name" varchar(50),
	"address_id" integer not null
);

create table "join_participant_collection_summary_to_race" ( 
	"participant_collection_summary_id" integer,
	"race_id" integer
);

create table "specimen_collection_summary" ( 
	"anatomic_source_id" integer,
	"specimen_count" integer,
	"patient_age_group_at_collection" integer,
	"specimen_type_id" integer,
	"is_collected_from" integer,
	"specimen_collection_summary_id" integer not null,
	"undergoes" integer
);

create table "join_address_to_specimen_collection_contact" ( 
	"specimen_collection_contact_id" integer,
	"address_id" integer
);

create table "specimen_collection_contact" ( 
	"phone" varchar(50),
	"specimen_collection_contact_id" integer not null
);

create table "specimen_availability_summary_profile" ( 
	"is_available_to_commercial_organizations" boolean,
	"is_available_to_foreign_investigators" boolean,
	"is_available_to_outside_institution" boolean,
	"is_collaboration_required" boolean,
	"specimen_availability_summary_profile_id" integer not null
);

create table "race" ( 
	"race" varchar(50),
	"race_id" integer not null,
	"nci_code" varchar(50),
	"nci_definition" text
);

create table "preservation" ( 
	"preservation_type" integer,
	"storage_temperature_in_centigrade" integer,
	"preservation_id" integer not null
);

create table "participant_collection_summary" ( 
	"participant_count" integer,
	"ethnicity_id" integer,
	"gender_id" integer,
	"registered_to" integer,
	"participant_collection_summary_id" integer not null
);

create table "institution" ( 
	"homepage_url" varchar(50),
	"institution_id" integer not null
);

create table "join_participant_collection_summary_todiagnosis" ( 
	"diagnosis_id" integer,
	"participant_collection_summary_id" integer
);

create table "diagnosis" ( 
	"diagnosistype" varchar(225),
	"diagnosis_id" integer not null,
	"nci_code" varchar(50),
	"nci_definition" text
);

create table "join_collection_protocol_to_institution" ( 
	"institution_id" integer,
	"collection_protocol_id" integer
);

create table "collection_protocol" ( 
	"date_last_updated" date,
	"end_date" date,
	"name" varchar(255),
	"start_date" date,
	"identifier" varchar(50),
	"makes_available" integer,
	"is_assigned_to" integer,
	"collectionprotocolid" integer not null,
	"is_constrained_by" integer
);

create table "annotation_availability_profile" ( 
	"has_additional_patient_demographics" boolean,
	"has_exposure_history" boolean,
	"has_family_history" boolean,
	"has_histopathologic_information" boolean,
	"has_lab_data" boolean,
	"has_longitudinal_specimens" boolean,
	"has_matched_specimens" boolean,
	"has_outcome_information" boolean,
	"has_participants_available_for_followup" boolean,
	"has_treatment_information" boolean,
	"annotation_availability_profile_id" integer not null
);


alter table "patient_age_group" add constraint "pk_patient_age_group" 
	primary key ("id");


alter table "gender" add constraint "pk_gender" 
	primary key ("id");


alter table "ethnicity" add constraint "pk_ethnicity" 
	primary key ("id");


alter table "preservation_type" add constraint "pk_preservation_type" 
	primary key ("id");


alter table "anatomic_source" add constraint "pk_anatomic_source" 
	primary key ("id");


alter table "specimen_type" add constraint "pk_specimen_type" 
	primary key ("id");


alter table "person" add constraint "pk_person" 
	primary key ("person_id");


alter table "organization" add constraint "pk_organization" 
	primary key ("organization_id");


alter table "address" add constraint "pk_address" 
	primary key ("address_id");


alter table "specimen_collection_summary" add constraint "pk_specimencollectionsummary" 
	primary key ("specimen_collection_summary_id");


alter table "specimen_collection_contact" add constraint "pk_specimencollectioncontact" 
	primary key ("specimen_collection_contact_id");


alter table "specimen_availability_summary_profile" add constraint "pk_specimenavailabilitysummaryprofile" 
	primary key ("specimen_availability_summary_profile_id");


alter table "race" add constraint "pk_race" 
	primary key ("race_id");


alter table "preservation" add constraint "pk_preservation" 
	primary key ("preservation_id");


alter table "participant_collection_summary" add constraint "pk_participantcollectionsummary" 
	primary key ("participant_collection_summary_id");


alter table "institution" add constraint "pk_institution" 
	primary key ("institution_id");


alter table "diagnosis" add constraint "pk_diagnosis" 
	primary key ("diagnosis_id");


alter table "collection_protocol" add constraint "pk_collectionprotocol" 
	primary key ("collectionprotocolid");


alter table "annotation_availability_profile" add constraint "pk_annotationavailabilityprofile" 
	primary key ("annotation_availability_profile_id");



alter table "gender"
	add constraint "uq_gender_gender" unique ("gender");
alter table "gender"
	add constraint "uq_gender_nci_code" unique ("nci_code");
alter table "ethnicity"
	add constraint "uq_ethnicity_nci_code" unique ("nci_code");
alter table "ethnicity"
	add constraint "uq_ethnicity_ethnicity" unique ("ethnicity");
alter table "preservation_type"
	add constraint "uq_preservation_type_nci_code" unique ("nci_code");
alter table "preservation_type"
	add constraint "uq_preservation_type_preservation_type" unique ("preservation_type");
alter table "anatomic_source"
	add constraint "uq_anatomic_source_anatomic_source" unique ("anatomic_source");
alter table "anatomic_source"
	add constraint "uq_anatomic_source_nci_code" unique ("nci_code");
alter table "specimen_type"
	add constraint "uq_specimen_type_nci_code" unique ("nci_code");
alter table "specimen_type"
	add constraint "uq_specimen_type_specimen_type" unique ("specimen_type");
alter table "race"
	add constraint "uq_race_race" unique ("race");
alter table "race"
	add constraint "uq_race_nci_code" unique ("nci_code");
alter table "diagnosis"
	add constraint "uq_diagnosis_diagnosistype" unique ("diagnosistype");
alter table "diagnosis"
	add constraint "uq_diagnosis_nci_code" unique ("nci_code");

alter table "specimen_collection_summary" add constraint "fk_specimen_collection_summary_patient_age" 
	foreign key ("patient_age_group_at_collection") references "patient_age_group" ("id");

alter table "specimen_collection_summary" add constraint "fk_specimencollectionsummary_anatomic_source" 
	foreign key ("anatomic_source_id") references "anatomic_source" ("id");

alter table "specimen_collection_summary" add constraint "fk_specimencollectionsummary_specimen_type" 
	foreign key ("specimen_type_id") references "specimen_type" ("id");

alter table "specimen_collection_summary" add constraint "fk_is_collected_from" 
	foreign key ("is_collected_from") references "participant_collection_summary" ("participant_collection_summary_id");

alter table "specimen_collection_summary" add constraint "fk_undergoes" 
	foreign key ("undergoes") references "preservation" ("preservation_id");

alter table "join_address_to_specimen_collection_contact" add constraint "specimencollectioncontact" 
	foreign key ("specimen_collection_contact_id") references "specimen_collection_contact" ("specimen_collection_contact_id");

alter table "join_address_to_specimen_collection_contact" add constraint "address" 
	foreign key ("address_id") references "address" ("address_id");

alter table "specimen_collection_contact" add constraint "fk_specimencollectioncontact_person" 
	foreign key ("specimen_collection_contact_id") references "person" ("person_id");

alter table "preservation" add constraint "fk_preservation_preservation_type" 
	foreign key ("preservation_type") references "preservation_type" ("id");

alter table "participant_collection_summary" add constraint "fk_gender_id" 
	foreign key ("gender_id") references "gender" ("id");

alter table "institution" add constraint "fk_institution_organization" 
	foreign key ("institution_id") references "organization" ("organization_id");

alter table "join_participant_collection_summary_todiagnosis" add constraint "diagnosis" 
	foreign key ("diagnosis_id") references "diagnosis" ("diagnosis_id");

alter table "join_participant_collection_summary_todiagnosis" add constraint "participantcollectionsummary" 
	foreign key ("participant_collection_summary_id") references "participant_collection_summary" ("participant_collection_summary_id");

alter table "join_collection_protocol_to_institution" add constraint "institution" 
	foreign key ("institution_id") references "institution" ("institution_id");

alter table "join_collection_protocol_to_institution" add constraint "collectionprotocol" 
	foreign key ("collection_protocol_id") references "collection_protocol" ("collectionprotocolid");

alter table "collection_protocol" add constraint "fk_makes_available" 
	foreign key ("makes_available") references "annotation_availability_profile" ("annotation_availability_profile_id");

alter table "collection_protocol" add constraint "fk_is_assigned_to" 
	foreign key ("is_assigned_to") references "specimen_collection_contact" ("specimen_collection_contact_id");

alter table "collection_protocol" add constraint "fk_is_constrained_by" 
	foreign key ("is_constrained_by") references "specimen_availability_summary_profile" ("specimen_availability_summary_profile_id");
