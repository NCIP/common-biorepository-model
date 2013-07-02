/*L
   Copyright Washington University in St.Louis
   Copyright Information Management Services, Inc.
   Copyright Sapient
   Copyright Booz Allen Hamilton

   Distributed under the OSI-approved BSD 3-Clause License.
   See http://ncip.github.com/common-biorepository-model/LICENSE.txt for details.
L*/

create table mappings
(term_id integer,
CBM_Name varchar(255),
NCI_Code varchar(50),
NCI_Name varchar(255),
Source varchar(255),
Source_Code varchar(50),
Source_concept_name varchar(255)
);


create table Clinical_Diagnosis_SCG
(Permissible_Value varchar(255) ,
SNOMED_Code varchar(50)  PRIMARY KEY 
);

CREATE INDEX Diagnosis_value
    ON Clinical_Diagnosis_SCG (Permissible_Value);
    
create table anatomic_site_mapping (
    Code varchar(50) primary key,
    Site	 varchar(255) unique,
    Parent varchar(50),
    ICD_Code varchar(50),
    NCI_Meta_CUI varchar(50),
    NCI_Code varchar(50)
    );
    
CREATE INDEX anatomic_site_value
ON anatomic_site_mapping (Site);

CREATE INDEX anatomic_site_value
ON anatomic_site_mapping (Site);

CREATE INDEX anatomic_site_value
ON anatomic_site_mapping (Site);
