

Custom grid client for testing the CBM installations. It ships ready to use on the Training Grid. 

For in-depth information on the Grid Client, please see the caGrid Client Application Guide: https://cagrid.org/display/knowledgebase/Client+Application+Guide

Install:
•	Check if /cbmGridClientTool/cbmGridClient directory exists
If it does not exist, go to:https://ncisvn.nci.nih.gov/WebSVN/listing.php?repname=common_biorepository_model&path=%2Ftrunk%2FTools%2FcbmGridClientTool%2F&#aea979494d01bdeb7b7fdb0ee0d30f9ef
to download the cbmGridClient.zip 
•	Unzip into the CBM distribution. Will create a "cbmGridClient" directory 

Build:
•	From a command line, run the 'ant all' command. 
Run:
•	From a command line, run the 'ant run' command
Setting to use Production Grid:
1.	Open the file cbmGridClient/ivy.xml
2.	Search for the text 'Target Grid Configuration'
3.	To configure for production, change 'training-1.3' to 'nci_prod-1.3'
4.	Save the file
5.	From a command line, run the 'ant clean all' command

Run Options:
When the client is run you will be presented with 5 options:
1.	Sync With Trust Fabric
This option will run the SyncGTS client.  This retrieves the grid certificates into the .globus directory.

Example Output:

    [java] Select client action:  [1..5] :
1
     [java] 
     [java] Synchronize Once...
     [java] Sync file = conf/sync-description.xml
     [java] A pre synchronization snapshot of the Trusted CA Directory found 8 Trusted CAs.
     [java] The CA O=caBIG,OU=caGrid,OU=Training Trust Fabric,CN=caGrid Training Trust Fabric CA was not removed because it is the exclude list.
     [java] The CA O=caBIG,OU=caGrid,OU=Training Trust Fabric,CN=caGrid Training Trust Fabric CA was not removed because it is the exclude list.
     [java] Successfully removed 6 Trusted Authority(s) from /Users/williamstephens/.globus/certificates
     [java] Successfully wrote out 6 Trusted Authority(s) to /Users/williamstephens/.globus/certificates
     [java] Synchronize Complete.
     [java] 

	2. Login to Grid

This option allows a user to authenticate against the Dorian service using their grid username and password. 

A grid credential will be written to cbmGridClient/user.proxy.  Subsequent calls to login will use this file while it is valid, rather than request username and password again.

Example Output:

     [java] --------------------------
     [java] 1 : Sync with Trust Fabric
     [java] 2 : Login to Grid
     [java] 3 : Search for CBM Services in Index Service
     [java] 4 : Query a CBM Data Service
     [java] 5: Quit
     [java] Select client action:  [1..5] :
2
     [java] 
     [java] Login to the Grid
     [java] Provide Username: 
     [java] 
wistephens
     [java] Provide Password: 
     [java] 
<Password will be shown>
     [java] Enter credential lifetime in hours [1..12] :
12
     [java] Identity = /O=caBIG/OU=caGrid/OU=Training/OU=Dorian/CN=wistephens
     [java] User credential saved to  = user.proxy
     [java] Login complete.

	3. Search for CBM Services in Index Service

This option allows the user to query the Index service for all instances of CBM services.

Example Output: 

     [java] Select client action:  [1..5] :
3
     [java] 
     [java] Discovering Grid Services
     [java] Searching for 'CBM' services
     [java] Available services:
     [java]     0: http://209.121.128.62:88/wsrf/services/cagrid/CBM
     [java]     1: https://cabigapps01.cancer.gov:9295/wsrf/services/cagrid/CBM
     [java]     2: http://tutorials.training.cagrid.org:8085/wsrf/services/cagrid/CBM
     [java]     3: http://128.23.35.126:8080/wsrf/services/cagrid/CBM 

	4. Query a CBM Data Service

 This option allows the user to select a CBM service and submit a query to the service using 2 options:
1.	Select an object that is exposed via the CBM domain Model
2.	Specify the name of a CQL query file that is stored in the cbmGridClient directory, with the query output written to the file 'cbmGridClient/queryResults.xml'
Example Output 1:

     [java] Select client action:  [1..5] :
4
     [java] 
     [java] Query Data Services: obtaining service list...
     [java] Searching for 'CBM' services
     [java] Available CBM Data Services:
     [java]     0: http://209.121.128.62:88/wsrf/services/cagrid/CBM
     [java]     1: https://cabigapps01.cancer.gov:9295/wsrf/services/cagrid/CBM
     [java]     2: http://tutorials.training.cagrid.org:8085/wsrf/services/cagrid/CBM
     [java]     3: http://128.23.35.126:8080/wsrf/services/cagrid/CBM
     [java] Select Service [0..3] :
2
     [java] 1 : Select query object from list
     [java] 2 : Read CQL query from file
     [java] Select Query Type [1..2] :
1
     [java]     0: gov.nih.nci.cbm.domain.LogicalModel.Organization
     [java]     1: gov.nih.nci.cbm.domain.LogicalModel.Institution
     [java]     2: gov.nih.nci.cbm.domain.LogicalModel.Person
     [java]     3: gov.nih.nci.cbm.domain.LogicalModel.CollectionProtocol
     [java]     4: gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionSummary
     [java]     5: gov.nih.nci.cbm.domain.LogicalModel.Address
     [java]     6: gov.nih.nci.cbm.domain.LogicalModel.SpecimenCollectionContact
     [java]     7: gov.nih.nci.cbm.domain.LogicalModel.AnnotationAvailabilityProfile
     [java]     8: gov.nih.nci.cbm.domain.LogicalModel.ParticipantCollectionSummary
     [java]     9: gov.nih.nci.cbm.domain.LogicalModel.Race
     [java]     10: gov.nih.nci.cbm.domain.LogicalModel.Preservation
     [java]     11: gov.nih.nci.cbm.domain.LogicalModel.Diagnosis
     [java]     12: gov.nih.nci.cbm.domain.LogicalModel.SpecimenAvailabilitySummaryProfile
     [java] Select a object to query [0..12] :
9
     [java] Querying: gov.nih.nci.cbm.domain.LogicalModel.Race
     [java] <ns2:Race race="Black or African American" id="602" xmlns:ns2="gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel"/>
     [java] <ns3:Race race="Not Reported" id="603" xmlns:ns3="gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel"/>
     [java] <ns4:Race race="Unknown" id="604" xmlns:ns4="gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel"/>
     [java] <ns5:Race race="Asian" id="622" xmlns:ns5="gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel"/>
     [java] <ns6:Race race="American Indian or Alaska Native" id="647" xmlns:ns6="gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel"/>
     [java] <ns7:Race race="White" id="1475" xmlns:ns7="gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel"/>
     [java] <ns8:Race race="Native Hawaiian or Other Pacific Islander" id="1496" xmlns:ns8="gme://caCORE.caCORE/3.2/gov.nih.nci.cbm.domain.LogicalModel"/>
     [java] 


Example Output 2:

     [java] Select client action:  [1..5] :
4
     [java] 
     [java] Query Data Services: obtaining service list...
     [java] Searching for 'CBM' services
     [java] Available CBM Data Services:
     [java]     0: http://209.121.128.62:88/wsrf/services/cagrid/CBM
     [java]     1: https://cabigapps01.cancer.gov:9295/wsrf/services/cagrid/CBM
     [java]     2: http://tutorials.training.cagrid.org:8085/wsrf/services/cagrid/CBM
     [java]     3: http://128.23.35.126:8080/wsrf/services/cagrid/CBM
     [java] Select Service [0..3] :
2
     [java] 1 : Select query object from list
     [java] 2 : Read CQL query from file
     [java] Select Query Type [1..2] :
2
     [java] Provide CQL Filename:
cbmQuery.xml
     [java] Querying non-secure with CQL query
     [java] Query results written to queryResults.xml
     [java] 
