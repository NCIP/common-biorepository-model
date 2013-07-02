/*L
   Copyright Washington University in St.Louis
   Copyright Information Management Services, Inc.
   Copyright Sapient
   Copyright Booz Allen Hamilton

   Distributed under the OSI-approved BSD 3-Clause License.
   See http://ncip.github.com/common-biorepository-model/LICENSE.txt for details.
L*/

/* This performs necessary MySQL steps before running CBMEmpty.sql
*/

SET storage_engine=INNODB;

CREATE DATABASE CBM;

USE CBM;
