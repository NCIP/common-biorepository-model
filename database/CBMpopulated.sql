-- MySQL dump 10.11
--
-- Host: localhost    Database: cbm
-- ------------------------------------------------------
-- Server version	5.0.85

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `city` varchar(50) default NULL,
  `country` varchar(50) default NULL,
  `departmentOrDivision` varchar(50) default NULL,
  `entityName` varchar(50) default NULL,
  `entityNumber` varchar(50) default NULL,
  `floorOrPremises` varchar(50) default NULL,
  `postOfficeBox` varchar(50) default NULL,
  `zipCode` varchar(50) default NULL,
  `state` varchar(50) default NULL,
  `streetPostDirectional` varchar(50) default NULL,
  `streetPreDirectional` varchar(50) default NULL,
  `streetOrThoroughfareName` varchar(50) default NULL,
  `streetOrThoroughfareNumber` varchar(50) default NULL,
  `streetOrThoroughfareSectionName` varchar(50) default NULL,
  `streetOrThoroughfareExtensionName` varchar(50) default NULL,
  `streetOrThoroughfareType` varchar(50) default NULL,
  `addressID` int(11) NOT NULL,
  PRIMARY KEY  (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnnotationAvailabilityProfile`
--

DROP TABLE IF EXISTS `AnnotationAvailabilityProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnnotationAvailabilityProfile` (
  `hasAdditionalPatientDemographics` tinyint(1) default NULL,
  `hasExposureHistory` tinyint(1) default NULL,
  `hasFamilyHistory` tinyint(1) default NULL,
  `hasHistopathologicInformation` tinyint(1) default NULL,
  `hasLabData` tinyint(1) default NULL,
  `hasLongitudinalSpecimens` tinyint(1) default NULL,
  `hasMatchedSpecimens` tinyint(1) default NULL,
  `hasOutcomeInformation` tinyint(1) default NULL,
  `hasParticipantsAvailableForFollowup` tinyint(1) default NULL,
  `hasTreatmentInformation` tinyint(1) default NULL,
  `annotationAvailabilityProfileID` int(11) NOT NULL,
  PRIMARY KEY  (`annotationAvailabilityProfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnnotationAvailabilityProfile`
--

LOCK TABLES `AnnotationAvailabilityProfile` WRITE;
/*!40000 ALTER TABLE `AnnotationAvailabilityProfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `AnnotationAvailabilityProfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionProtocol`
--

DROP TABLE IF EXISTS `CollectionProtocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CollectionProtocol` (
  `dateLastUpdated` date default NULL,
  `endDate` date default NULL,
  `name` varchar(255) default NULL,
  `startDate` date default NULL,
  `collectionProtocolID` int(11) NOT NULL,
  `makes_available` int(11) default NULL,
  `is_assigned_to` int(11) default NULL,
  `is_constrained_by` int(11) default NULL,
  `identifier` varchar(50) default NULL,
  PRIMARY KEY  (`collectionProtocolID`),
  KEY `makes_available` (`makes_available`),
  KEY `is_assigned_to` (`is_assigned_to`),
  KEY `is_constrained_by` (`is_constrained_by`),
  CONSTRAINT `FK_is_constrained_by` FOREIGN KEY (`is_constrained_by`) REFERENCES `specimenavailabilitysummaryprofile` (`specimenAvailabilitySummaryProfileID`),
  CONSTRAINT `FK_is_assigned_to` FOREIGN KEY (`is_assigned_to`) REFERENCES `specimencollectioncontact` (`specimenCollectionContactID`),
  CONSTRAINT `FK_makes_available` FOREIGN KEY (`makes_available`) REFERENCES `annotationavailabilityprofile` (`annotationAvailabilityProfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionProtocol`
--

LOCK TABLES `CollectionProtocol` WRITE;
/*!40000 ALTER TABLE `CollectionProtocol` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollectionProtocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnosis`
--

DROP TABLE IF EXISTS `Diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diagnosis` (
  `diagnosisType` varchar(225) default NULL,
  `diagnosisID` int(11) NOT NULL,
  PRIMARY KEY  (`diagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnosis`
--

LOCK TABLES `Diagnosis` WRITE;
/*!40000 ALTER TABLE `Diagnosis` DISABLE KEYS */;
INSERT INTO `Diagnosis` VALUES ('Diagnosis Name',0),('5\' 10\' Methylenetetrahydrofolate Reductase Deficiency',1),('Abdominal Aortic Aneurysm',2),('Abducens Nerve Disorder',3),('Abetalipoproteinemia',4),('Acanthoma',5),('Acanthosis Nigricans',6),('Acatalasemia',7),('Achondrogenesis',8),('Achondroplasia',9),('Achromatopsia',10),('Acinar Cell Carcinoma',11),('Acoustic Schwannoma',12),('Acquired Hyperostosis Syndrome',13),('Acrocallosal Syndrome',14),('Acrocephalosyndactyly',15),('Acrodermatitis',16),('Acromegaly',17),('Actinomycetales Infection',18),('Actinomycosis',19),('Acute Disseminated Encephalomyelitis',20),('Acute Hemorrhagic Leukoencephalitis',21),('Acute Infective Polyneuritis',22),('Acute Intermittent Porphyria',23),('Acute Liver Failure',24),('Acute Lymphoblastic Leukemia',25),('Acute Megakaryoblastic Leukemia',26),('Acute Myeloid Leukemia',27),('Acute Renal Failure',28),('Acute Respiratory Distress Syndrome',29),('\"Acyl-CoA Dehydrogenase, Long-Chain Deficiency\"',30),('\"Acyl-CoA Dehydrogenase, Medium-Chain Deficiency\"',31),('\"Acyl-CoA Dehydrogenase, Short-Chain Deficiency\"',32),('Addison\'s Disease',33),('Adenocarcinoma',34),('Adenoid Cystic Carcinoma',35),('Adenomatous Polyposis Coli',36),('Adiposis Dolorosa',37),('Adrenal Gland Hyperplasia',38),('Adrenal Gland Neoplasm',39),('Adrenal Gland Pheochromocytoma',40),('Adrenoleukodystrophy',41),('African Trypanosomiasis',42),('Aganglionic Megacolon',43),('Agnosia',44),('AIDS-Related Disorder',45),('AIDS-Related Lymphoma',46),('Ainhum',47),('Alagille Syndrome',48),('Alagille Syndrome',49),('Albinism',50),('Alcoholic Liver Disease',51),('Alexander Disease',52),('Alkaptonuria',53),('Allergic Bronchopulmonary Aspergillosis',54),('Alopecia',55),('Alpha Thalassemia',56),('Alpha-1 Antitrypsin Deficiency',57),('Alpha-Mannosidosis',58),('Alport Syndrome',59),('Alstrom Syndrome',60),('Alveolar Rhabdomyosarcoma',61),('Alveolar Soft Part Sarcoma',62),('Alzheimer\'s Disease',63),('Amaurosis Fugax',64),('Amebiasis',65),('Ameloblastoma',66),('Amniotic Band Syndrome',67),('Amyloid Neuropathy',68),('Amyloidosis',69),('Amyotrophic Lateral Sclerosis',70),('Anal Neoplasm',71),('Anaplastic Large Cell Lymphoma',72),('Andersen Syndrome',73),('Androgen Insensitivity Syndrome',74),('Anemia',75),('Anencephaly',76),('Aneurysm',77),('Angelman Syndrome',78),('Angiofollicular Lymphoid Hyperplasia',79),('Anhidrotic Ectodermal Dysplasia 1',80),('Aniridia',81),('Ankylosing Spondylitis',82),('Anthracosis',83),('Anthrax',84),('Anti-Glomerular Basement Membrane Disease',85),('Antiphospholipid Syndrome',86),('Aortic Arch Syndrome',87),('Aortic Coarctation',88),('Aplastic Anemia',89),('Appendix Carcinoma',90),('Arachnoid Cyst',91),('Arachnoiditis',92),('Argininemia',93),('Argininosuccinic Aciduria',94),('Arnold-Chiari Malformation',95),('Arrhythmia',96),('Arrhythmogenic Right Ventricular Dysplasia',97),('Arteriosclerosis',98),('Arthritis',99),('Arthrogryposis',100),('Asbestosis',101),('Asbestos-Related Lung Disorder',102),('Aspartylglycosaminuria',103),('Asthma',104),('Astrocytoma',105),('Ataxia Telangiectasia Syndrome',106),('Atherosclerosis',107),('Atrial Fibrillation',108),('Atrial Septal Defect',109),('Atrophic Muscular Disorder',110),('Auditory Perceptual Disorder',111),('Autoimmune Hemolytic Anemia',112),('Autoimmune Hepatitis',113),('Autoimmune Lymphoproliferative Syndrome',114),('Autoimmune Polyendocrinopathy Syndrome',115),('Autosomal Dominant Optic Atrophy',116),('Autosomal Dominant Polycystic Kidney Disease',117),('Autosomal Recessive Hypohidrotic Ectodermal Dysplasia',118),('Autosomal Recessive Polycystic Kidney Disease',119),('Babesiosis',120),('Bacterial Toxemia',121),('Balantidiasis',122),('Balkan Endemic Nephropathy',123),('Bariatric Surgery',124),('Barrett Esophagus',125),('Barth Syndrome',126),('Bartonella Infection',127),('Bartter Syndrome',128),('Becker\'s Muscular Dystrophy',129),('Beckwith-Wiedemann Syndrome',130),('Behcet Syndrome',131),('Benign Fibrous Histiocytoma',132),('Benign Migratory Glossitis',133),('Benign Mucous Membrane Pemphigoid',134),('Benign Neonatal Epilepsy',135),('Benign Neoplasm',136),('Benign Prostatic Hyperplasia',137),('Benign Recurrent Intrahepatic Cholestasis',138),('Berardinelli-Seip Congenital Lipodystrophy',139),('Bernard-Soulier Syndrome',140),('Beta-Mannosidosis',141),('Beta-Methylcrotonylglycinuria',142),('Bile Acid Synthesis Defect',143),('Biliary Atresia',144),('Biliary Cirrhosis',145),('Biliary Tract Disorder',146),('Biotinidase Deficiency',147),('Bladder Carcinoma',148),('Bladder Disorder',149),('Bladder Neoplasm',150),('Blastomycosis',151),('Bloom Syndrome',152),('Bone Necrosis',153),('Bone Paget Disease',154),('Botulism',155),('Brachial Plexopathy',156),('Brachial Plexus Neuritis',157),('Brain Iron Accumulation Type I Syndrome',158),('Breast Carcinoma',159),('Bronchial Intraepithelial Neoplasia',160),('Bronchiectasis',161),('Bronchitis',162),('Bronchogenic Carcinoma',163),('Brown-Sequard Syndrome',164),('Brucellosis',165),('Brugada Syndrome',166),('Bullous Pemphigoid',167),('Bundle Branch Block',168),('Burkitt Lymphoma',169),('Burning Mouth Syndrome',170),('Buruli Ulcer',171),('Byssinosis',172),('CADASIL Syndrome',173),('Calciphylaxis',174),('Campomelic Dysplasia',175),('Camurati-Engelmann Syndrome',176),('Canavan Disease',177),('Capillary Hemangioblastoma',178),('Capillary Leak Syndrome',179),('Carbamoyl-Phosphate Synthetase I Deficiency',180),('Carbohydrate-Deficient Glycoprotein Syndrome',181),('Carcinoma',182),('Carcinoma In Situ',183),('Cardiac Arrest',184),('Cardiofaciocutaneous Syndrome',185),('Cardiogenic Shock',186),('Cardiomyopathy',187),('Cardiovascular Disorder',188),('Carney Syndrome',189),('Caroli Disease',190),('Carotid Artery Disorder',191),('Cataplexy',192),('Cataract',193),('Cat-Scratch Disease',194),('Cavernous Hemangioma',195),('Central Core Disease',196),('Central Nervous System Cavernous Hemangioma',197),('Central Nervous System Vasculitis',198),('Central Pontine Myelinolysis',199),('Cerebellar Degeneration',200),('Cerebral Amyloid Angiopathy',201),('Cerebral Cavernous Malformation',202),('Cerebral Palsy',203),('Cerebrospinal Fluid Otorrhea',204),('Cerebrospinal Fluid Rhinorrhea',205),('Cerebrotendinous Xanthomatosis',206),('Cerebrovascular Accident',207),('Cervical Carcinoma',208),('Cervical Symmetrical Lipomatosis',209),('Cervicocranial Syndrome',210),('Chagas Disease',211),('Charcot-Marie-Tooth Disease',212),('Chediak-Higashi Syndrome',213),('Cherubism',214),('Chilblains',215),('Childhood Acute Lymphoblastic Leukemia',216),('Childhood Brain Germinoma',217),('Childhood Brain Neoplasm',218),('Childhood Diabetes Mellitus',219),('Childhood Renal Disorder',220),('Childhood Rhabdomyosarcoma',221),('Childhood Schizophrenia',222),('Chlamydia Psittaci Infection',223),('Cholangiocarcinoma',224),('Cholecystitis',225),('Choledochal Cyst',226),('Chondrodysplasia Punctata',227),('Chondrosarcoma',228),('Chorea',229),('Choroid Plexus Papilloma',230),('Choroideremia',231),('Chromosome Disorder',232),('Chromosome Fragile Site',233),('Chronic Inflammatory Demyelinating Polyneuropathy',234),('Chronic Kidney Disease',235),('Chronic Lymphocytic Leukemia',236),('\"Chronic Myelogenous Leukemia, BCR-ABL1 Positive\"',237),('Chronic Obstructive Pulmonary Disease',238),('Chronic Pancreatitis',239),('Chronic Renal Failure',240),('Churg-Strauss Syndrome',241),('Chylous Ascites',242),('Ciliary Motility Defect',243),('Cirrhosis',244),('Citrullinemia',245),('Classical Lissencephaly',246),('Clear Cell Sarcoma of the Kidney',247),('Cleidocranial Dysplasia',248),('Clubfoot',249),('Coccidioidomycosis',250),('Coccidiosis',251),('Cockayne Syndrome',252),('Coffin-Lowry Syndrome',253),('Cogan-Reese Syndrome',254),('Colorectal Carcinoma',255),('Coma',256),('Common Variable Immunodeficiency',257),('Condyloma Acuminatum',258),('Congenital Adrenal Gland Hyperplasia',259),('Congenital Coronary Artery Abnormality',260),('Congenital Cortical Hyperostosis',261),('Congenital Dyserythropoietic Anemia',262),('Congenital Myasthenic Syndrome',263),('Congenital Pure Red Cell Aplasia',264),('Congenital Septal Defect',265),('Congenital Structural Myopathy',266),('Congenital Syphilis',267),('Congestive Heart Failure',268),('Connexin 26 Gene Anomaly',269),('Cor Triatriatum',270),('Cornelia De Lange Syndrome',271),('Coronary Artery Disease',272),('Coronary Microvascular Disease',273),('Costello Syndrome',274),('Cough',275),('Cowden Syndrome',276),('Craniofacial Dysostosis',277),('Craniomandibular Disorder',278),('Craniosynostosis',279),('CREST Syndrome',280),('Creutzfeldt-Jacob Disease',281),('Cri du Chat Syndrome',282),('Crigler-Najjar Syndrome',283),('Crohn Disease',284),('Cryopyrin-Associated Periodic Syndrome',285),('Cryptogenic Cirrhosis',286),('Cushing Syndrome',287),('Cutaneous Leishmaniasis',288),('Cutaneous T-Cell Non-Hodgkin Lymphoma',289),('Cutis Laxa',290),('Cystic Fibrosis',291),('Cysticercosis',292),('Cystinosis',293),('Cystinuria',294),('Cytogenetic Abnormality',295),('Cytomegaloviral Infection',296),('Dandy-Walker Malformation',297),('Darier Disease',298),('De Sanctis-Cacchione Syndrome',299),('Deafness',300),('Deep Vein Thrombosis',301),('Deletion 18p Syndrome',302),('Deletion 18q Syndrome',303),('Dementia',304),('Dengue Fever',305),('Dengue Hemorrhagic Fever',306),('Dentinogenesis Imperfecta',307),('Denys-Drash Syndrome',308),('Depression',309),('Dermatitis',310),('Dermatitis Herpetiformis',311),('Dextrocardia',312),('Diabetes Complication',313),('Diabetes Insipidus',314),('Diabetes Mellitus',315),('Diabetic Eye Disease',316),('Diabetic Nephropathy',317),('Dialysis',318),('Dialysis Access Failure',319),('Diffuse Cerebral Sclerosis of Schilder',320),('Diffuse Idiopathic Skeletal Hyperostosis',321),('Diffuse Palmoplantar Keratoderma',322),('DiGeorge Syndrome',323),('Dihydropyrimidine Dehydrogenase Deficiency',324),('Dilated Cardiomyopathy',325),('Dipetalonemiasis',326),('Distal Muscular Dystrophy',327),('Diverticulitis',328),('Donohue Syndrome',329),('Down Syndrome',330),('Dracunculiasis',331),('Drug Induced Liver Injury',332),('Dry Eye Syndrome',333),('Duane Syndrome',334),('Dubin-Johnson Syndrome',335),('Duchenne Muscular Dystrophy',336),('Dystrophia Myotonica 1',337),('Dystrophia Myotonica 2',338),('Ebstein Anomaly',339),('Eccrine Porocarcinoma',340),('Echinococcosis',341),('Ectodermal Dysplasia',342),('Ectromelia',343),('Ehlers-Danlos Syndrome',344),('Eisenmenger Syndrome',345),('Ellis-Van Creveld Syndrome',346),('Emery-Dreifuss Muscular Dystrophy',347),('Empty Sella Syndrome',348),('Encephalitis',349),('Encephalocele',350),('Enchondromatosis',351),('End Stage Liver Disease',352),('Endemic Typhus Fever',353),('Endocarditis',354),('Endometrial Stromal Sarcoma',355),('Endometriosis',356),('Enteritis',357),('Eosinophilic Granuloma',358),('Ependymoma',359),('Epidemic Louse-Borne Typhus',360),('Epidermolysis Bullosa',361),('Epidermolysis Bullosa Acquisita',362),('Epidermolysis Bullosa Dystrophica',363),('Epidermolysis Bullosa Simplex',364),('Epidermolytic Hyperkeratosis',365),('Epidermolytic Palmoplantar Keratoderma',366),('Epilepsy',367),('Epithelioid Hemangioma',368),('Equine Infectious Anemia',369),('Erythema Infectiosum',370),('Erythrokeratodermia Variabilis',371),('Erythromelalgia',372),('Erythropoietic Porphyria',373),('Erythropoietic Protoporphyria',374),('Esophageal Achalasia',375),('Esophageal Carcinoma',376),('Ewing Sarcoma',377),('Excessive Blood Clotting',378),('Experimental Allergic Encephalomyelitis',379),('Extramammary Paget Disease',380),('Eye Disorder',381),('Fabry Disease',382),('Facial Asymmetry',383),('Facial Hemiatrophy',384),('Facial Nerve Paralysis',385),('Facioscapulohumeral Muscular Dystrophy',386),('Factor I Deficiency',387),('Factor XI Deficiency',388),('Factor XII Deficiency',389),('Fallopian Tube Carcinoma',390),('Fallopian Tube Neoplasm',391),('Familial Amyloid Neuropathy',392),('Familial Amyloidosis',393),('Familial Benign Pemphigus',394),('Familial Dysautonomia',395),('Familial Hypertrophic Cardiomyopathy',396),('Familial Mediterranean Fever',397),('Familial Partial Lipodystrophy',398),('Familial Periodic Paralysis',399),('Fanconi Anemia',400),('Fanconi Syndrome',401),('Farber Lipogranulomatosis',402),('Fatal Familial Insomnia',403),('Felty Syndrome',404),('Fetal Alcohol Syndrome',405),('Fibromuscular Dysplasia',406),('Focal Dermal Hypoplasia',407),('Focal Segmental Glomerulosclerosis',408),('Fox-Fordyce Disease',409),('Fragile X Syndrome',410),('Friedreich Ataxia',411),('Frontotemporal Dementia',412),('Fuchs Endothelial Dystrophy',413),('Fucosidosis',414),('Fusobacterium Infection',415),('Galactosemia',416),('Gallbladder Carcinoma',417),('Gallbladder Neoplasm',418),('Ganglioglioma',419),('Gardner Syndrome',420),('Gastric Antral Vascular Ectasia',421),('Gastric Carcinoma',422),('Gastrointestinal Stromal Tumor',423),('Gastroparesis',424),('Gastroschisis',425),('Gaucher Disease',426),('Genetic Study',427),('Genu Varum',428),('Gerstmann-Straussler-Scheinker Disease',429),('Giant Axonal Neuropathy',430),('Giant Hypertrophic Gastritis',431),('Gilbert Syndrome',432),('Gitelman Syndrome',433),('Glanzmann Thrombasthenia',434),('Glaucoma',435),('Glioblastoma',436),('Glomerulonephritis',437),('Glomus Tumor',438),('Glycine Encephalopathy',439),('Glycogen Storage Disease',440),('Glycogen Storage Disease Type I',441),('Glycogen Storage Disease Type II',442),('Glycogen Storage Disease Type IIb',443),('Glycogen Storage Disease Type III',444),('Glycogen Storage Disease Type IV',445),('Glycogen Storage Disease Type V',446),('GM1 Gangliosidosis',447),('Goiter',448),('Goldenhar Syndrome',449),('Goodpasture Syndrome',450),('Granuloma Annulare',451),('Granulosa Cell Tumor',452),('Graves\' Disease',453),('Gray Platelet Syndrome',454),('Great Vessels Transposition',455),('Gynatresia',456),('Gyrate Atrophy',457),('Hairy Cell Leukemia',458),('Hairy Tongue',459),('Hajdu-Cheney Syndrome',460),('Hallermann Syndrome',461),('Halo Nevus',462),('Hantavirus Pulmonary Syndrome',463),('Hartnup Disease',464),('Hashimoto Thyroiditis',465),('Head and Neck Carcinoma',466),('Heart Block',467),('Heart Disorder',468),('Heart Failure',469),('Heart Murmur',470),('HELLP Syndrome',471),('Helminthiasis',472),('Hemangiopericytoma',473),('Hemochromatosis',474),('Hemoglobin C Disease',475),('Hemoglobinopathy',476),('Hemolytic Anemia',477),('Hemolytic Uremic Syndrome',478),('Hemophagocytic Lymphohistiocytosis',479),('Hemophilia',480),('Hemophilia A',481),('Hemophilia B',482),('Hemorrhagic Fever with Renal Syndrome',483),('Henoch-Schonlein Purpura',484),('Hepatic Disorder',485),('Hepatitis',486),('Hepatitis A Infection',487),('Hepatitis B Infection',488),('Hepatitis C Infection',489),('Hepatoblastoma',490),('Hepatocellular Carcinoma',491),('Hepatoerythropoietic Porphyria',492),('Hepatolenticular Degeneration',493),('Hereditary Angioedema',494),('Hereditary Angioedema Types I and II',495),('Hereditary Coproporphyria',496),('Hereditary Fructose Intolerance',497),('Hereditary Hemolytic Anemia',498),('Hereditary Hemorrhagic Telangiectasia',499),('Hereditary Hyperbilirubinemia',500),('Hereditary Melanoma',501),('Hereditary Mucosal Leukokeratosis',502),('Hereditary Non-Polyposis Colon Cancer',503),('Hermansky-Pudlak Syndrome',504),('Hermaphrodite',505),('Herpes Simplex Encephalitis',506),('Herpes Zoster Oticus',507),('HFE-Associated Hereditary Hemochromatosis',508),('Hidradenoma',509),('High Grade Cervical Squamous Intraepithelial Neoplasia',510),('Hilar Cholangiocarcinoma',511),('Histiocytic Necrotizing Lymphadenitis',512),('HMG-CoA Lyase Deficiency',513),('Hodgkin Lymphoma',514),('Holmes-Adie Syndrome',515),('Holoprosencephaly',516),('Homocystinuria',517),('Hunter Syndrome',518),('Huntington\'s Disease',519),('Hurler Syndrome',520),('Hyaline Membrane Syndrome',521),('Hydatidiform Mole',522),('Hydroa Vacciniforme',523),('Hydrocephalus',524),('Hydrops Fetalis',525),('Hymenolepiasis',526),('Hyperargininemia',527),('Hypercholesterolemia',528),('Hyperhomocysteinemia',529),('Hyperlipoproteinemia Type I',530),('Hyperlipoproteinemia Type II',531),('Hyperostosis Frontalis Interna',532),('Hyperplasia',533),('Hypertension',534),('Hypertrophic Cardiomyopathy',535),('Hypoalphalipoproteinemia',536),('Hypochromic Anemia',537),('Hypokalemic Periodic Paralysis',538),('Hypoparathyroidism',539),('Hypophosphatasia',540),('Hypopituitarism',541),('Hypotension',542),('Ichthyosis',543),('Ichthyosis Bullosa of Siemens',544),('Ichthyosis Vulgaris',545),('Idiopathic CD4-Positive T-Lymphocytopenia',546),('Idiopathic Hypersomnolence',547),('Idiopathic Pulmonary Fibrosis',548),('Idiopathic Thrombocytopenic Purpura',549),('IgA Nephropathy',550),('Ileitis',551),('Immunodeficiency With Hyper-IgM',552),('Imperforate Anus',553),('Inborn Urea Cycle Disorder',554),('Inclusion Body Myositis',555),('Incontinentia Pigmenti',556),('Infantile Neuroaxonal Dystrophy',557),('Infantile Refsum Disease',558),('Inflammation',559),('Inflammatory Breast Carcinoma',560),('Insomnia',561),('Interstitial Cystitis',562),('Intestinal Atresia',563),('Intracranial Hypertension',564),('Iridocorneal Endothelial Syndrome',565),('Iron-Deficiency Anemia',566),('Irritable Bowel Syndrome',567),('Islet Cell Adenoma',568),('Jacobsen Syndrome',569),('Japanese B Encephalitis',570),('Jervell and Lange Nielsen Syndrome',571),('Jeune Syndrome',572),('Joubert Syndrome',573),('Juvenile Myelomonocytic Leukemia',574),('Juvenile Myoclonic Epilepsy',575),('Juvenile Osteochondrosis of Spine',576),('Kala-Azar',577),('Kallmann Syndrome',578),('Kaposi Sarcoma',579),('Kartagener Syndrome',580),('Kawasaki Disease',581),('Kearns-Sayre Syndrome',582),('Keratoacanthoma',583),('Keratoconus',584),('Kernicterus',585),('Kidney Transplantation',586),('Kidney Volume',587),('Kleine-Levin Syndrome',588),('Klinefelter Syndrome',589),('Klippel-Trenaunay-Weber Syndrome',590),('Kluver-Bucy Syndrome',591),('Korsakoff Syndrome',592),('Krabbe Disease',593),('Krukenberg Tumor',594),('Lafora Disease',595),('Lambert Eaton Myasthenic Syndrome',596),('Lamellar Ichthyosis',597),('Landau-Kleffner Syndrome',598),('Langerhans Cell Histiocytosis',599),('Latent Syphilis',600),('Lateral Medullary Syndrome',601),('Leber Hereditary Optic Atrophy',602),('Lecithin Acyltransferase Deficiency',603),('Leigh Disease',604),('Leiomyoma',605),('Leiomyosarcoma',606),('Leishmaniasis',607),('Lennox-Gastaut Syndrome',608),('LEOPARD Syndrome',609),('Leprosy',610),('Leptospirosis',611),('Lesch-Nyhan Syndrome',612),('Leukemia',613),('Lewy Body Dementia',614),('Lichen Sclerosus et Atrophicus',615),('Liddle Syndrome',616),('Li-Fraumeni Syndrome',617),('Limb-Girdle Muscular Dystrophy',618),('Limbic Encephalitis',619),('Lipoid Proteinosis of Urbach and Wiethe',620),('Lipoma',621),('Liposarcoma',622),('Liver and Intrahepatic Biliary Tract Carcinoma',623),('Liver Disease Associated with Cystic Fibrosis',624),('Liver Study',625),('Liver Transplantation',626),('Lobular Breast Carcinoma In Situ',627),('Localized Scleroderma',628),('Long QT Syndrome',629),('Loss of Chromosome 8',630),('Lung Carcinoma',631),('Lupus Erythematosus',632),('Lymphangioleiomyomatosis',633),('Lymphangioma',634),('Lymphedema',635),('Lymphoblastic Lymphoma',636),('Lymphoma',637),('Lymphopenia',638),('Machado-Joseph Disease',639),('Macroglossia',640),('Macular Degeneration',641),('Malakoplakia',642),('Malaria',643),('Malformations of Cortical Development',644),('Malignant Atrophic Papulosis',645),('Malignant Bone Neoplasm',646),('Malignant Brain Neoplasm',647),('Malignant Eye Neoplasm',648),('Malignant Fibrous Histiocytoma',649),('Malignant Hyperthermia Syndrome',650),('Malignant Ovarian Neoplasm',651),('Malignant Peripheral Nerve Sheath Tumor',652),('Malignant Pineal Region Neoplasm',653),('Malignant Skin Neoplasm',654),('Malignant Splenic Neoplasm',655),('Malignant Uterine Neoplasm',656),('Mallory-Weiss Syndrome',657),('Mansonelliasis',658),('Maple Syrup Urine Disease',659),('Marburg Virus Disease',660),('Marek Disease',661),('Marfan Syndrome',662),('Maroteaux-Lamy Syndrome',663),('Mast Cell Leukemia',664),('Mastocytosis',665),('Medullary Sponge Kidney',666),('Medulloblastoma',667),('Meesmann Corneal Dystrophy',668),('Megaloblastic Anemia',669),('Melanoma',670),('MELAS Syndrome',671),('Melkersson-Rosenthal Syndrome',672),('Melorheostosis',673),('Meningeal Tuberculosis',674),('Menkes Disease',675),('Mental Retardation',676),('Merkel Cell Carcinoma',677),('MERRF Syndrome',678),('Mesothelioma',679),('Metabolic Syndrome',680),('Metachromatic Leukodystrophy',681),('Mevalonate Kinase Deficiency',682),('Microscopic Polyarteritis',683),('Microsporidiosis',684),('Minimal Change Glomerulonephritis',685),('Mitochondrial Hepatopathy',686),('Mitral Valve Prolapse',687),('Mixed Connective Tissue Disease',688),('Mobius Syndrome',689),('Monilethrix',690),('Monoclonal Gammopathy',691),('Monoclonal Gammopathy of Undetermined Significance',692),('Mononeuritis Multiplex',693),('Morquio Syndrome',694),('Moyamoya Disease',695),('Mucolipidosis',696),('Mucolipidosis Type IV',697),('Mucopolysaccharidosis Type I',698),('Mucopolysaccharidosis Type IIIA',699),('Mucopolysaccharidosis Type IIIB',700),('Mucopolysaccharidosis Type IIIC',701),('Mucopolysaccharidosis Type IIID',702),('Mucopolysaccharidosis Type IVA',703),('Mucopolysaccharidosis Type IVB',704),('Muenke Syndrome',705),('Muir-Torre Syndrome',706),('Mulibrey Nanism',707),('Multi-Infarct Dementia',708),('Multiple Acyl-CoA Dehydrogenase Deficiency',709),('Multiple Endocrine Neoplasia',710),('Multiple Endocrine Neoplasia Type 1',711),('Multiple Endocrine Neoplasia Type 2A',712),('Multiple Endocrine Neoplasia Type 2B',713),('Multiple Osteochondromas',714),('Multiple Sclerosis',715),('Multiple Sulfatase Deficiency Disease',716),('Multiple System Atrophy',717),('Muscular Dystrophy',718),('Mycosis Fungoides',719),('Myelodysplastic Syndrome',720),('Myelodysplastic Syndrome',721),('Myeloid Sarcoma',722),('Myocardial Infarction',723),('Myokymia',724),('Myositis',725),('Myositis Ossificans',726),('Myotonia Congenita',727),('Myotonic Disorder',728),('Myotonic Dystrophy',729),('Nail-Patella Syndrome',730),('Narcolepsy',731),('Nasal Cavity and Paranasal Sinus Lethal Midline Granuloma',732),('Nasopharyngeal Neoplasm',733),('Necrotizing Enterocolitis',734),('Necrotizing Fasciitis',735),('Necrotizing Ulcerative Gingivitis',736),('Nelson Syndrome',737),('Neonatal Hepatitis',738),('Neonatal Respiratory Distress Syndrome',739),('Neoplasm of the Diffuse Neuroendocrine System',740),('Nephrocalcinosis',741),('Nephrogenic Diabetes Insipidus',742),('Nephrogenic Fibrosing Dermopathy',743),('Nephropathy',744),('Nesidioblastosis',745),('Netherton Syndrome',746),('Neural Tube Defect',747),('Neuroacanthocytosis',748),('Neuroblastoma',749),('Neurocysticercosis',750),('Neuroendocrine Carcinoma',751),('Neuroendocrine Neoplasm',752),('Neurofibroma',753),('Neurofibromatosis',754),('Neurofibromatosis Type 1',755),('Neurofibromatosis Type 2',756),('Neurogenic Diabetes Insipidus',757),('Neuroglial Tumor',758),('Neuromyelitis Optica',759),('Neuronal Ceroid Lipofuscinosis',760),('Neurosyphilis',761),('Neurotoxicity Syndrome',762),('Nevoid Basal Cell Carcinoma Syndrome',763),('Niemann-Pick Disease',764),('\"Niemann-Pick Disease, Type C\"',765),('Night Blindness',766),('Nijmegen Breakage Syndrome',767),('Noma',768),('Nonalcoholic Fatty Liver Disease',769),('Nonalcoholic Steatohepatitis',770),('Non-Hodgkin Lymphoma',771),('Non-Small Cell Lung Carcinoma',772),('Non-Trisomic Autosomal Aneuploidy',773),('Noonan Syndrome',774),('Obesity',775),('Ochronosis',776),('Ocular Cicatricial Pemphigoid',777),('Oculocerebrorenal Syndrome',778),('Oculocutaneous Albinism',779),('Oculopharyngeal Muscular Dystrophy',780),('Oligodendroglioma',781),('Olivopontocerebellar Atrophy',782),('Opsoclonus Myoclonus Syndrome',783),('Optic Atrophy',784),('Optic Neuritis',785),('Oral Neoplasm',786),('Organoid Nevus',787),('Ornithine Carbamoyltransferase Deficiency Disease',788),('Ornithine Transcarbamylase Deficiency',789),('Orofaciodigital Syndrome Type 1',790),('Orthostatic Hypotension',791),('Orthostatic Intolerance',792),('Ossification of Posterior Longitudinal Ligament',793),('Osteoarthritis',794),('Osteochondrodysplasia',795),('Osteogenesis Imperfecta',796),('Osteomalacia',797),('Osteopoikilosis',798),('Osteoporosis',799),('Osteosarcoma',800),('Ovarian Sertoli-Leydig Cell Tumor',801),('Pachyonychia Congenita',802),('Paget Disease',803),('Paget Disease of the Breast',804),('Pagetoid Reticulosis',805),('Pallister-Hall Syndrome',806),('Palmar Fibromatosis',807),('Palmoplantar Keratoderma',808),('Palpitation',809),('Pancreatic Carcinoma',810),('Pancreatic Endocrine Carcinoma',811),('Pancreatic Insulin Producing Tumor',812),('Pancreatitis',813),('Pantothenate Kinase-Associated Neurodegeneration',814),('Panuveitis',815),('Papillary Cystadenocarcinoma',816),('Papilledema',817),('Papillon-Lefevre Syndrome',818),('Paracoccidioidomycosis',819),('Paraganglioma',820),('Paragonimiasis',821),('Paraneoplastic Cerebellar Degeneration',822),('Paraplegia',823),('Parapsoriasis',824),('Parathyroid Gland Carcinoma',825),('Parkinson\'s Disease',826),('Paroxysmal Nocturnal Hemoglobinuria',827),('Pars Planitis',828),('Patent Ductus Arteriosus',829),('Pediatric Obesity',830),('Pelger-Huet Anomaly',831),('Pelizaeus-Merzbacher Disease',832),('Pemphigoid Gestationis',833),('Pemphigus',834),('Penile Fibromatosis',835),('Pericarditis',836),('Perineural Cyst',837),('Peripheral Arterial Disorder',838),('Peripheral Nervous System Neoplasm',839),('Peripheral Sensory Neuropathy',840),('Peritoneal Panniculitis',841),('Pernicious Anemia',842),('Peroxisomal Disorder',843),('Persistent Fetal Circulation Syndrome',844),('Perthes Disease',845),('Petit Mal Epilepsy',846),('Peutz-Jeghers Syndrome',847),('Phenylketonuria',848),('Pick\'s Disease',849),('Piebaldism',850),('Pierre Robin Syndrome',851),('Pilomatricoma',852),('Pineal Region Neoplasm',853),('Pinta',854),('Piriformis Muscle Syndrome',855),('Pituitary Gland Neoplasm',856),('Pityriasis Lichenoides',857),('Pityriasis Rubra Pilaris',858),('Plague',859),('Plasma Cell Leukemia',860),('Plasma Cell Myeloma',861),('Plasmacytoma',862),('Plummer-Vinson Syndrome',863),('Pneumoconiosis',864),('POEMS Syndrome',865),('Poland Syndrome',866),('Polycystic Kidney Disease',867),('Polycythemia Vera',868),('Polymyalgia Rheumatica',869),('Polymyositis',870),('Polyostotic Fibrous Dysplasia',871),('Porokeratosis',872),('Postural Orthostatic Tachycardia Syndrome',873),('Prader-Willi Syndrome',874),('Precocious Puberty',875),('Preeclampsia',876),('Pre-Excitation Syndrome',877),('Pregnancy Associated Hypertension',878),('Priapism',879),('Primary Biliary Cirrhosis',880),('Primary Effusion Lymphoma',881),('Primary Hyperparathyroidism',882),('Primary Hypertrophic Osteoarthropathy',883),('Primary Progressive Aphasia',884),('Primary Progressive Nonfluent Aphasia',885),('Primary Sclerosing Cholangitis',886),('Progeria',887),('Progressive Bulbar Palsy',888),('Progressive Familial Intrahepatic Cholestasis',889),('Progressive Multifocal Leukoencephalopathy',890),('Progressive Muscular Atrophy',891),('Progressive Myoclonus Epilepsy',892),('Progressive Supranuclear Palsy',893),('Prolidase Deficiency',894),('Proliferative Diabetic Retinopathy',895),('Propionic Acidemia',896),('Prosopagnosia',897),('Prostate Disorder',898),('Prostate Neoplasm',899),('Prostatitis',900),('Proteus Syndrome',901),('Prune Belly Syndrome',902),('Pseudohypoaldosteronism',903),('Pseudomyxoma Peritonei',904),('Pseudotumor Cerebri',905),('Pseudoxanthoma Elasticum',906),('Psoriasis',907),('Pulmonary Alveolar Proteinosis',908),('Pulmonary Blastoma',909),('Pulmonary Embolism',910),('Pulmonary Emphysema',911),('Pulmonary Fibrosis',912),('Pulmonary Hypertension',913),('Pulmonary Sarcoidosis',914),('Pulmonary Veno-Occlusive Disease',915),('Pyruvate Carboxylase Deficiency',916),('Q Fever',917),('Rabies',918),('Raynaud\'s Disease',919),('Reflex Epilepsy',920),('Reflex Sympathetic Dystrophy Syndrome',921),('Refsum Disease',922),('Renal Cell Carcinoma',923),('Renal Disorder',924),('Renal Failure',925),('Renal Neoplasm',926),('Renal Tubular Acidosis',927),('Renovascular Hypertension',928),('Respiratory Distress Syndrome',929),('Restless Leg Syndrome',930),('Retinal Neoplasm',931),('Retinitis Pigmentosa',932),('Retinoblastoma',933),('Retinopathy',934),('Retinoschisis',935),('Retrolental Fibroplasia',936),('Retroperitoneal Fibrosis',937),('Rett Syndrome',938),('Reye Syndrome',939),('Rh Incompatibility',940),('Rhabdoid Tumor of the Kidney',941),('Rheumatic Fever',942),('Rheumatoid Arthritis',943),('Rhizomelic Chondrodysplasia Punctata',944),('Robinow Syndrome',945),('Romano-Ward Syndrome',946),('Rothmund-Thomson Syndrome',947),('Rubella',948),('Rubinstein-Taybi Syndrome',949),('Sandhoff Disease',950),('Sarcoidosis',951),('Sarcoma',952),('Scheie Syndrome',953),('Schistosomiasis',954),('Schizophrenia',955),('Scimitar Syndrome',956),('Scleredema Adultorum',957),('Scleroderma',958),('Scleromyxedema',959),('Sea-Blue Histiocyte Syndrome',960),('Seborrheic Keratosis',961),('Selective Antibody Deficiency with Normal Immunoglobulins',962),('Seminoma',963),('Septo-Optic Dysplasia',964),('Severe Acute Respiratory Syndrome',965),('Severe Combined Immunodeficiency',966),('Sex Cord-Stromal Tumor',967),('Sezary Syndrome',968),('Short Rib-Polydactyly Syndrome',969),('Shy-Drager Syndrome',970),('Sialadenitis',971),('Sialic Acid Storage Disease',972),('Sickle Cell Disease',973),('Silver-Russell Syndrome',974),('Simultanagnosia',975),('Sinus Histiocytosis',976),('Sinus Histiocytosis with Massive Lymphadenopathy',977),('Sjogren Syndrome',978),('Sjogren-Larsson Syndrome',979),('Skin Basal Cell Carcinoma',980),('Skin Pigmentation Disorder',981),('Sleep Apnea',982),('Sly Syndrome',983),('Small Intestinal Carcinoma',984),('Smith-Lemli-Opitz Syndrome',985),('Smoldering Myeloma',986),('Spasmodic Torticollis',987),('Speech Manifestations',988),('Spherocytosis',989),('Spinal Muscular Atrophy',990),('Spinal Muscular Atrophy of Childhood',991),('Spinocerebellar Ataxia',992),('Squamous Cell Carcinoma',993),('Staphylococcal Scalded Skin Syndrome',994),('Stargardt Disease',995),('Status Epilepticus',996),('Stevens-Johnson Syndrome',997),('Stiff Person Syndrome',998),('Stromal Neoplasm',999),('Sturge-Weber Syndrome',1000),('Subacute Sclerosing Panencephalitis',1001),('Subcutaneous Panniculitis-Like T-Cell Lymphoma',1002),('Subependymoma',1003),('Subvalvular Aortic Stenosis',1004),('Sudden Infant Death Syndrome',1005),('SUNCT Syndrome',1006),('Superior Mesenteric Artery Syndrome',1007),('Superior Vena Cava Syndrome',1008),('Supravalvular Aortic Stenosis',1009),('Sweet Syndrome',1010),('Swyer James Syndrome',1011),('Syphilis',1012),('Syringomyelia',1013),('Systemic Mastocytosis',1014),('Systemic Scleroderma',1015),('Tabes Dorsalis',1016),('Taeniasis',1017),('Takayasu Arteritis',1018),('Takotsubo Cardiomyopathy',1019),('Tangier Disease',1020),('Tarsal Tunnel Syndrome',1021),('Tay-Sachs Disease',1022),('T-Cell Large Granular Lymphocyte Leukemia',1023),('Temporal Arteritis',1024),('Testicular Neoplasm',1025),('Tetanus',1026),('Tetralogy of Fallot',1027),('Thalamic Disease',1028),('Thalassemia',1029),('Thalassemia Major',1030),('Thanatophoric Dysplasia',1031),('Thoracic Outlet Syndrome',1032),('Thrombocytopenia',1033),('Thrombotic Thrombocytopenic Purpura',1034),('Thyroglossal Duct Cyst',1035),('Thyroid Dysgenesis',1036),('Thyroid Gland Carcinoma',1037),('Thyroid Hormone Resistance Syndrome',1038),('Tissue',1039),('Togaviridae Infection',1040),('Tolosa-Hunt Syndrome',1041),('Tourette Syndrome',1042),('Toxic Epidermal Necrolysis',1043),('Toxocariasis',1044),('Tracheobronchomalacia',1045),('Tracheobronchomegaly',1046),('Tracheoesophageal Fistula',1047),('Transient Global Amnesia',1048),('Treacher Collins Syndrome',1049),('Treponemal Infection',1050),('Trichinosis',1051),('Trichorhinophalangeal Syndrome Type II',1052),('Trichothiodystrophy',1053),('Tricuspid Atresia',1054),('Trigger Finger Disorder',1055),('Triploidy Syndrome',1056),('Trismus',1057),('Trisomy 12',1058),('Trisomy 18',1059),('Trisomy 8',1060),('Trisomy 9',1061),('Trophoblastic Tumor',1062),('True Hermaphroditism',1063),('Tuberculosis',1064),('Tuberous Sclerosis',1065),('Tularemia',1066),('Turner Syndrome',1067),('Type 1 Diabetes Mellitus',1068),('Type 2 Diabetes Mellitus',1069),('Ulcerative Colitis',1070),('Uniparental Disomy',1071),('Urachal Cyst',1072),('Urinary System Disorder',1073),('Urinary Tract Infection',1074),('Urticaria Pigmentosa/Maculopapular Cutaneous Mastocytosis',1075),('Usher Syndrome',1076),('Uterine Corpus Cancer',1077),('Uveomeningoencephalitic Syndrome',1078),('Vaginal Carcinoma',1079),('Vaginal Neoplasm',1080),('Valvular Heart Disorder',1081),('Variant Angina',1082),('Varicose Vein',1083),('Variegate Porphyria',1084),('Vascular Access Graft Failure',1085),('Vascular Dementia',1086),('Vascular Disorder',1087),('Vasculitis',1088),('Ventricular Septal Defect',1089),('Vesicoureteral Reflux',1090),('VIP Producing Tumor',1091),('Visceral Larva Migrans',1092),('Vitamin A Deficiency',1093),('Vitamin B6 Deficiency',1094),('Von Hippel-Lindau Syndrome',1095),('von Willebrand Disease',1096),('\"von Willebrand Disease, Type 3\"',1097),('Vulvar Carcinoma',1098),('Waardenburg Syndrome',1099),('Waldenstrom Macroglobulinemia',1100),('Wallerian Degeneration',1101),('Wandering Spleen',1102),('Waterhouse-Friderichsen Syndrome',1103),('Wegener Granulomatosis',1104),('Weill-Marchesani Syndrome',1105),('Wernicke-Korsakoff Syndrome',1106),('West Syndrome',1107),('Western Equine Encephalomyelitis',1108),('Whipple Disease',1109),('Whooping Cough',1110),('Williams Syndrome',1111),('Wilms Tumor',1112),('Wilms Tumor-Aniridia-Genitourinary Anomalies-Mental Retardation Syndrome',1113),('Wiskott-Aldrich Syndrome',1114),('Wolff-Parkinson-White Syndrome',1115),('Wolf-Hirschhorn Syndrome',1116),('Wolfram Syndrome',1117),('Wolman Disease',1118),('Wound Complication',1119),('Xeroderma Pigmentosum',1120),('Xerophthalmia',1121),('X-Linked Bulbar-Muscular Atrophy',1122),('X-Linked Dominant Hypophosphatemic Rickets',1123),('X-Linked Ichthyosis',1124),('X-Linked Severe Combined Immunodeficiency',1125),('XO Syndrome',1126),('XXXY and XXXXY Syndrome',1127),('XYY Syndrome',1128),('Yaws',1129),('Yellow Fever Virus Infection',1130),('Yellow Nail Syndrome',1131),('Yolk Sac Tumor',1132),('Zellweger Syndrome',1133),('Zollinger Ellison Syndrome',1134),('Zygomycosis',1135);
/*!40000 ALTER TABLE `Diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Institution`
--

DROP TABLE IF EXISTS `Institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Institution` (
  `homepageURL` varchar(50) default NULL,
  `institutionID` int(11) NOT NULL,
  PRIMARY KEY  (`institutionID`),
  KEY `institutionID` (`institutionID`),
  CONSTRAINT `FK_Institution_Organization` FOREIGN KEY (`institutionID`) REFERENCES `organization` (`organizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Institution`
--

LOCK TABLES `Institution` WRITE;
/*!40000 ALTER TABLE `Institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `Institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JoinAddressToSpecimenCollectionContact`
--

DROP TABLE IF EXISTS `JoinAddressToSpecimenCollectionContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JoinAddressToSpecimenCollectionContact` (
  `specimenCollectionContactID` int(11) default NULL,
  `addressID` int(11) default NULL,
  KEY `specimenCollectionContactID` (`specimenCollectionContactID`),
  KEY `addressID` (`addressID`),
  CONSTRAINT `Address` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JoinAddressToSpecimenCollectionContact`
--

LOCK TABLES `JoinAddressToSpecimenCollectionContact` WRITE;
/*!40000 ALTER TABLE `JoinAddressToSpecimenCollectionContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `JoinAddressToSpecimenCollectionContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JoinCollectionProtocolToInstitution`
--

DROP TABLE IF EXISTS `JoinCollectionProtocolToInstitution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JoinCollectionProtocolToInstitution` (
  `institutionID` int(11) default NULL,
  `collectionProtocolID` int(11) default NULL,
  KEY `institutionID` (`institutionID`),
  KEY `collectionProtocolID` (`collectionProtocolID`),
  CONSTRAINT `CollectionProtocol` FOREIGN KEY (`collectionProtocolID`) REFERENCES `collectionprotocol` (`collectionProtocolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JoinCollectionProtocolToInstitution`
--

LOCK TABLES `JoinCollectionProtocolToInstitution` WRITE;
/*!40000 ALTER TABLE `JoinCollectionProtocolToInstitution` DISABLE KEYS */;
/*!40000 ALTER TABLE `JoinCollectionProtocolToInstitution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JoinInstitutionToSpecimenCollectionContact`
--

DROP TABLE IF EXISTS `JoinInstitutionToSpecimenCollectionContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JoinInstitutionToSpecimenCollectionContact` (
  `specimenCollectionContactID` int(11) default NULL,
  `institutionID` int(11) default NULL,
  KEY `specimenCollectionContactID` (`specimenCollectionContactID`),
  KEY `institutionID` (`institutionID`),
  CONSTRAINT `Institution` FOREIGN KEY (`institutionID`) REFERENCES `institution` (`institutionID`),
  CONSTRAINT `SpecimenCollectionContact` FOREIGN KEY (`specimenCollectionContactID`) REFERENCES `specimencollectioncontact` (`specimenCollectionContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JoinInstitutionToSpecimenCollectionContact`
--

LOCK TABLES `JoinInstitutionToSpecimenCollectionContact` WRITE;
/*!40000 ALTER TABLE `JoinInstitutionToSpecimenCollectionContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `JoinInstitutionToSpecimenCollectionContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JoinParticipantCollectionSummaryToDiagnosis`
--

DROP TABLE IF EXISTS `JoinParticipantCollectionSummaryToDiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JoinParticipantCollectionSummaryToDiagnosis` (
  `diagnosisID` int(11) default NULL,
  `participantCollectionSummaryID` int(11) default NULL,
  KEY `diagnosisID` (`diagnosisID`),
  KEY `participantCollectionSummaryID` (`participantCollectionSummaryID`),
  CONSTRAINT `ParticipantCollectionSummary` FOREIGN KEY (`participantCollectionSummaryID`) REFERENCES `participantcollectionsummary` (`participantCollectionSummaryID`),
  CONSTRAINT `Diagnosis` FOREIGN KEY (`diagnosisID`) REFERENCES `diagnosis` (`diagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JoinParticipantCollectionSummaryToDiagnosis`
--

LOCK TABLES `JoinParticipantCollectionSummaryToDiagnosis` WRITE;
/*!40000 ALTER TABLE `JoinParticipantCollectionSummaryToDiagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `JoinParticipantCollectionSummaryToDiagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JoinParticipantCollectionSummaryToRace`
--

DROP TABLE IF EXISTS `JoinParticipantCollectionSummaryToRace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JoinParticipantCollectionSummaryToRace` (
  `participantCollectionSummaryID` int(11) default NULL,
  `raceID` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JoinParticipantCollectionSummaryToRace`
--

LOCK TABLES `JoinParticipantCollectionSummaryToRace` WRITE;
/*!40000 ALTER TABLE `JoinParticipantCollectionSummaryToRace` DISABLE KEYS */;
/*!40000 ALTER TABLE `JoinParticipantCollectionSummaryToRace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization` (
  `name` varchar(50) default NULL,
  `organizationID` int(11) NOT NULL,
  PRIMARY KEY  (`organizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipantCollectionSummary`
--

DROP TABLE IF EXISTS `ParticipantCollectionSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParticipantCollectionSummary` (
  `count` int(11) default NULL,
  `ethnicity` varchar(50) default NULL,
  `gender` varchar(50) default NULL,
  `participantCollectionSummaryID` int(11) NOT NULL,
  `registered_to` int(11) default NULL,
  PRIMARY KEY  (`participantCollectionSummaryID`),
  KEY `registered_to` (`registered_to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipantCollectionSummary`
--

LOCK TABLES `ParticipantCollectionSummary` WRITE;
/*!40000 ALTER TABLE `ParticipantCollectionSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `ParticipantCollectionSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `fullName` varchar(50) default NULL,
  `firstName` varchar(50) default NULL,
  `lastName` varchar(50) default NULL,
  `middleNameOrInitial` varchar(50) default NULL,
  `emailAddress` varchar(50) default NULL,
  `personID` int(11) NOT NULL,
  PRIMARY KEY  (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preservation`
--

DROP TABLE IF EXISTS `Preservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preservation` (
  `preservationType` varchar(100) default NULL,
  `storageTemperatureInCentegrades` int(11) default NULL,
  `preservationID` int(11) NOT NULL,
  PRIMARY KEY  (`preservationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preservation`
--

LOCK TABLES `Preservation` WRITE;
/*!40000 ALTER TABLE `Preservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Preservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Race`
--

DROP TABLE IF EXISTS `Race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Race` (
  `race` varchar(50) default NULL,
  `raceID` int(11) NOT NULL,
  PRIMARY KEY  (`raceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Race`
--

LOCK TABLES `Race` WRITE;
/*!40000 ALTER TABLE `Race` DISABLE KEYS */;
INSERT INTO `Race` VALUES ('Race',0),('American Indian or Alaska Native',1),('Asian',2),('Black or African American',3),('Caucasian',4),('Native Hawaiian or other Pacific Islander',5);
/*!40000 ALTER TABLE `Race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecimenAvailabilitySummaryProfile`
--

DROP TABLE IF EXISTS `SpecimenAvailabilitySummaryProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecimenAvailabilitySummaryProfile` (
  `isAvailableToCommercialOrganizations` tinyint(1) default NULL,
  `isAvailableToForeignInvestigators` tinyint(1) default NULL,
  `isAvailableToOutsideInstitution` tinyint(1) default NULL,
  `isCollaborationRequired` tinyint(1) default NULL,
  `specimenAvailabilitySummaryProfileID` int(11) NOT NULL,
  PRIMARY KEY  (`specimenAvailabilitySummaryProfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecimenAvailabilitySummaryProfile`
--

LOCK TABLES `SpecimenAvailabilitySummaryProfile` WRITE;
/*!40000 ALTER TABLE `SpecimenAvailabilitySummaryProfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecimenAvailabilitySummaryProfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecimenCollectionContact`
--

DROP TABLE IF EXISTS `SpecimenCollectionContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecimenCollectionContact` (
  `phone` varchar(50) default NULL,
  `specimenCollectionContactID` int(11) NOT NULL,
  PRIMARY KEY  (`specimenCollectionContactID`),
  KEY `specimenCollectionContactID` (`specimenCollectionContactID`),
  CONSTRAINT `FK_SpecimenCollectionContact_Person` FOREIGN KEY (`specimenCollectionContactID`) REFERENCES `person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecimenCollectionContact`
--

LOCK TABLES `SpecimenCollectionContact` WRITE;
/*!40000 ALTER TABLE `SpecimenCollectionContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecimenCollectionContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecimenCollectionSummary`
--

DROP TABLE IF EXISTS `SpecimenCollectionSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecimenCollectionSummary` (
  `anatomicSource` varchar(150) default NULL,
  `count` int(11) default NULL,
  `patientAgeAtCollection` varchar(50) default NULL,
  `specimenType` varchar(50) default NULL,
  `specimenCollectionSummaryID` int(11) NOT NULL,
  `is_collected_from` int(11) default NULL,
  `undergoes` int(11) default NULL,
  PRIMARY KEY  (`specimenCollectionSummaryID`),
  KEY `is_collected_from` (`is_collected_from`),
  KEY `undergoes` (`undergoes`),
  CONSTRAINT `FK_undergoes` FOREIGN KEY (`undergoes`) REFERENCES `preservation` (`preservationID`),
  CONSTRAINT `FK_is_collected_from` FOREIGN KEY (`is_collected_from`) REFERENCES `participantcollectionsummary` (`participantCollectionSummaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecimenCollectionSummary`
--

LOCK TABLES `SpecimenCollectionSummary` WRITE;
/*!40000 ALTER TABLE `SpecimenCollectionSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpecimenCollectionSummary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-04-28 17:20:06
