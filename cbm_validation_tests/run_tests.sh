#!/bin/sh

CBM_TEST_DIR=.
LIB_DIR=$CBM_TEST_DIR/lib

ANT_HOME=$CBM_TEST_DIR/apache-ant-1.8.2

classpath=./bin:$LIB_DIR/junit-4.8.1.jar

export $classpath

$ANT_HOME/bin/ant