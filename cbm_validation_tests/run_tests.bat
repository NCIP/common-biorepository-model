set CBM_TEST_DIR=C:\prj\cbm_validation_tests
set LIB_DIR=%CBM_TEST_DIR%/lib
set JAVA_HOME=C:\Program Files\Java\jre6
set ANT_HOME=%CBM_TEST_DIR%\apache-ant-1.7.0
set classpath=.\bin;%LIB_DIR%\junit-4.8.1.jar;
set CBM_URL=http://cabigapps01.cancer.gov:9294/wsrf/services/cagrid/CBM
set TEST_OUTPUT_DIRECTORY=./data
set TEST_REPORT_DIRECTORY=./report

%ANT_HOME%\bin\ant -Dcbm.url=$CBM_URL -Doutput.dir=$TEST_OUTPUT_DIRECTORY -Dreport.dir=$TEST_REPORT_DIRECTORY