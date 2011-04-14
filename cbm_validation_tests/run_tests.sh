#!/bin/sh

export CBM_TEST_DIR=.
export LIB_DIR=$CBM_TEST_DIR/lib
export classpath=./bin:$LIB_DIR/*
TEST_OUTPUT_DIRECTORY=./data
TEST_REPORT_DIRECTORY=./report


#Modify to suit environment
export JAVA_HOME=/usr/lib/java
export ANT_HOME=$CBM_TEST_DIR/apache-ant-1.7.0
CBM_URL=http://cabigapps01.cancer.gov:9294/wsrf/services/cagrid/CBM



echo $classpath

$ANT_HOME/bin/ant -Dcbm.url=$CBM_URL -Doutput.dir=$TEST_OUTPUT_DIRECTORY -Dreport.dir=$TEST_REPORT_DIRECTORY
