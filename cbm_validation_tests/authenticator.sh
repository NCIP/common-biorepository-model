#!/bin/sh

export CBM_TEST_DIR=.
export LIB_DIR=$CBM_TEST_DIR/lib
export JAVA_HOME=/usr/local/java/jdk1.6.0_20
export ANT_HOME=$CBM_TEST_DIR/apache-ant-1.8.2
export classpath=./bin:$LIB_DIR/*

echo $classpath

java -classpath ./bin:$LIB_DIR/* org.cagrid.cbm.test.GridAuthenticator
