/*L
 *  Copyright Washington University in St.Louis
 *  Copyright Information Management Services, Inc.
 *  Copyright Sapient
 *  Copyright Booz Allen Hamilton
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-biorepository-model/LICENSE.txt for details.
 */

package org.cagrid.CBM.marshaller;

import gov.nih.nci.cbm.domain.MarshallerModel.CbmNode;
import gov.nih.nci.cbm.domain.MarshallerModel.CollectionProtocol;
import gov.nih.nci.cbm.domain.MarshallerModel.ParticipantCollectionSummary;
import gov.nih.nci.cbm.domain.MarshallerModel.SpecimenCollectionSummary;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.rmi.RemoteException;
import java.util.Collection;
import java.util.List;
import java.util.Vector;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

/**
 * TODO:I am the service side implementation class. IMPLEMENT AND DOCUMENT ME
 * 
 * @created by Introduce Toolkit version 1.3
 */
public class CbmMarshaller {

    // The name of the xml file we will marshall the database data to.
    static final String DEFAULT_OUTPUT_XML_FILE_NAME = "dataDump.xml";
    // when true, we're only pulling the first 10 results from the database
    static boolean debug = false;
    private static final String XML_SCHEMA = "CBM.xsd";
    private static final String HIBERNATE_CONFIG = "./hibernate.cfg.xml";
    // specifies the max number of results to be pulled from the hibernate query
    // at one time.
    private static final int MAX_RESULTS = 25;

    public CbmMarshaller() throws RemoteException {
	super();
    }

    /**
     * @param args
     *            - takes 2 optional arguments. 1.Information about the source
     *            of the data. 2.Output file name
     * @throws Exception
     */
    public static void main(String args[]) throws Exception {
	String parameters[] = new String[2];
	parameters[0] = "N/A"; // source information
	parameters[1] = DEFAULT_OUTPUT_XML_FILE_NAME; // data dump file

	if (args.length <= 1)
	    System.out
		    .println("Warning: No source infromation was provided for the data dump.");
	if (args.length > 2)
	    throw new IllegalArgumentException(
		    "Only 2 arguments maybe specified.\n 1. Information about the source of the data.\n 2. Output file name.");
	for (int i = 0; i < args.length; i++)
	    parameters[i] = args[i];

	if (debug) {
	    FileWriter fstream = new FileWriter(parameters[1]);
	    System.out.println("info: " + parameters[0]);
	    BufferedWriter writer = new BufferedWriter(fstream);
	    writer.write("test file");
	    writer.flush();
	    writer.close();
	    return;
	}

	System.out.println(String.format("Data will be written to %s.",
		parameters[1]));
	CbmMarshaller impl = new CbmMarshaller();
	CbmNode dataDump = impl.createCbmNode(parameters[0]);
	impl.marshall(parameters[1], dataDump);
    }

    public void marshall(String outputFile, CbmNode node) throws JAXBException,
	    FileNotFoundException {
	JAXBContext jaxbContext = JAXBContext
		.newInstance(new Class[] { CbmNode.class });
	javax.xml.bind.Marshaller marshaller = jaxbContext.createMarshaller();
	marshaller.setProperty(javax.xml.bind.Marshaller.JAXB_FORMATTED_OUTPUT,
		new Boolean(true));
	// Specify the schema in the xml
	marshaller.setProperty(
		javax.xml.bind.Marshaller.JAXB_NO_NAMESPACE_SCHEMA_LOCATION,
		XML_SCHEMA);
	marshaller.marshal(node, new FileOutputStream(outputFile));
    }

    /**
     * Retrieves the data dump in the form of a CbmNode.
     * 
     * @param sourceData
     *            - Information about the source of the data that will be stored
     *            in teh CbmNode
     * @return
     * @throws RemoteException
     */
    public CbmNode createCbmNode(String sourceData) throws RemoteException {
	List<CollectionProtocol> protocols = getCollectionProtocols();

	CbmNode node = new CbmNode(protocols, sourceData);
	return node;
    }

    /**
     * Retrieves the collection protocol data from the database. The database is
     * specified in the hibernate.cfg.xml file in the CBM_orm file.
     * 
     * @return
     * @throws RemoteException
     */
    public List<CollectionProtocol> getCollectionProtocols()
	    throws RemoteException {
	SessionFactory sessionFactory = new Configuration().configure(
		HIBERNATE_CONFIG).buildSessionFactory();
	Session session = sessionFactory.openSession();

	List<CollectionProtocol> allResults = new Vector<CollectionProtocol>();
	Query createQuery = session
		.createQuery("from gov.nih.nci.cbm.domain.MarshallerModel.CollectionProtocol as cp order by collectionprotocolid ");
	int page = 0;
	List<CollectionProtocol> results = null;

	if (debug) {
	    createQuery.setMaxResults(10);
	    allResults = createQuery.list();
	} else {
	    while (results == null || results.size() == MAX_RESULTS) {
		createQuery.setFirstResult(page * MAX_RESULTS);
		createQuery.setMaxResults(MAX_RESULTS);
		page++;
		results = createQuery.list();
		allResults.addAll(results);
	    }
	}
	return allResults;
    }

}
