set JAVA_HOME=C:\Program Files\Java\jre6
set CBM_TEST_DIR=C:\prj\cbm_validation_tests
set LIB_DIR=%CBM_TEST_DIR%/lib

set ANT_HOME=%CBM_TEST_DIR%\apache-ant-1.8.2

set classpath=.\bin;%LIB_DIR%\junit-4.8.1.jar;



%ANT_HOME%\bin\ant -verbose