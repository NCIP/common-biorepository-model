package org.cagrid.CBM.client;

import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.rmi.RemoteException;

import org.apache.axis.client.Stub;
import org.apache.axis.message.addressing.EndpointReferenceType;
import org.apache.axis.types.URI.MalformedURIException;
import org.cagrid.CBM.common.CBMI;
import org.cagrid.transfer.context.client.TransferServiceContextClient;
import org.cagrid.transfer.context.client.helper.TransferClientHelper;
import org.cagrid.transfer.context.stubs.types.TransferServiceContextReference;
import org.globus.gsi.GlobusCredential;

/**
 * This class is autogenerated, DO NOT EDIT GENERATED GRID SERVICE ACCESS METHODS.
 *
 * This client is generated automatically by Introduce to provide a clean unwrapped API to the
 * service.
 *
 * On construction the class instance will contact the remote service and retrieve it's security
 * metadata description which it will use to configure the Stub specifically for each method call.
 * 
 * @created by Introduce Toolkit version 1.4
 */
public class CBMClient extends CBMClientBase implements CBMI {	

	public CBMClient(String url) throws MalformedURIException, RemoteException {
		this(url,null);	
	}

	public CBMClient(String url, GlobusCredential proxy) throws MalformedURIException, RemoteException {
		super(url,proxy);
	}

	public CBMClient(EndpointReferenceType epr) throws MalformedURIException, RemoteException {
		this(epr,null);
	}

	public CBMClient(EndpointReferenceType epr, GlobusCredential proxy) throws MalformedURIException, RemoteException {
		super(epr,proxy);
	}

	public static void usage(){
		System.out.println(CBMClient.class.getName() + " -url <service url>");
	}

	public static void main(String [] args){
		System.out.println("Running the Grid Service Client");
		for (int i = 0; i < args.length; i++)
			System.out.println(args[i]);
		try {
			if (!(args.length != 2)) {

				String fileName = args[0];
				String url = args[1];

				retrieveData(fileName, url);
			}
			else {
				usage();
				System.exit(1);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
	}

	public static void retrieveData(String fileName, String url)
	throws MalformedURIException, RemoteException, Exception,
	IOException {
		CBMClient client = new CBMClient(url);
		TransferServiceContextReference ref = client.extractCBMdata();
		// create a client that enables me to talk to my transfer resource
		TransferServiceContextClient tclient = new TransferServiceContextClient(ref.getEndpointReference());
		// use the TransferClientHelper to get an InputStream to the data
		InputStream stream = TransferClientHelper.getData(tclient.getDataTransferDescriptor());

		int data = stream.read();

		FileWriter fstream = new FileWriter(fileName);
		while (data != -1) {
			fstream.write(data);
			data = stream.read();
		}
		stream.close();
		fstream.flush();
		fstream.close();
	}

	public org.cagrid.transfer.context.stubs.types.TransferServiceContextReference extractCBMdata() throws RemoteException {
		synchronized(portTypeMutex){
			configureStubSecurity((Stub)portType,"extractCBMdata");
			org.cagrid.CBM.stubs.ExtractCBMdataRequest params = new org.cagrid.CBM.stubs.ExtractCBMdataRequest();
			org.cagrid.CBM.stubs.ExtractCBMdataResponse boxedResult = portType.extractCBMdata(params);
			return boxedResult.getTransferServiceContextReference();
		}
	}

	public org.oasis.wsrf.properties.GetMultipleResourcePropertiesResponse getMultipleResourceProperties(org.oasis.wsrf.properties.GetMultipleResourceProperties_Element params) throws RemoteException {
		synchronized(portTypeMutex){
			configureStubSecurity((Stub)portType,"getMultipleResourceProperties");
			return portType.getMultipleResourceProperties(params);
		}
	}

	public org.oasis.wsrf.properties.GetResourcePropertyResponse getResourceProperty(javax.xml.namespace.QName params) throws RemoteException {
		synchronized(portTypeMutex){
			configureStubSecurity((Stub)portType,"getResourceProperty");
			return portType.getResourceProperty(params);
		}
	}

	public org.oasis.wsrf.properties.QueryResourcePropertiesResponse queryResourceProperties(org.oasis.wsrf.properties.QueryResourceProperties_Element params) throws RemoteException {
		synchronized(portTypeMutex){
			configureStubSecurity((Stub)portType,"queryResourceProperties");
			return portType.queryResourceProperties(params);
		}
	}

	public gov.nih.nci.cagrid.cqlresultset.CQLQueryResults query(gov.nih.nci.cagrid.cqlquery.CQLQuery cqlQuery) throws RemoteException, gov.nih.nci.cagrid.data.faults.QueryProcessingExceptionType, gov.nih.nci.cagrid.data.faults.MalformedQueryExceptionType {
		synchronized(portTypeMutex){
			configureStubSecurity((Stub)portType,"query");
			gov.nih.nci.cagrid.data.QueryRequest params = new gov.nih.nci.cagrid.data.QueryRequest();
			gov.nih.nci.cagrid.data.QueryRequestCqlQuery cqlQueryContainer = new gov.nih.nci.cagrid.data.QueryRequestCqlQuery();
			cqlQueryContainer.setCQLQuery(cqlQuery);
			params.setCqlQuery(cqlQueryContainer);
			gov.nih.nci.cagrid.data.QueryResponse boxedResult = portType.query(params);
			return boxedResult.getCQLQueryResultCollection();
		}
	}

	public org.cagrid.cql2.results.CQLQueryResults executeQuery(org.cagrid.cql2.CQLQuery query) throws RemoteException, gov.nih.nci.cagrid.data.faults.QueryProcessingExceptionType, gov.nih.nci.cagrid.data.faults.MalformedQueryExceptionType {
		synchronized(portTypeMutex){
			configureStubSecurity((Stub)portType,"executeQuery");
			org.cagrid.dataservice.ExecuteQueryRequest params = new org.cagrid.dataservice.ExecuteQueryRequest();
			org.cagrid.dataservice.ExecuteQueryRequestQuery queryContainer = new org.cagrid.dataservice.ExecuteQueryRequestQuery();
			queryContainer.setCQLQuery(query);
			params.setQuery(queryContainer);
			org.cagrid.dataservice.ExecuteQueryResponse boxedResult = portType.executeQuery(params);
			return boxedResult.getCQLQueryResults();
		}
	}

	public org.cagrid.transfer.context.stubs.types.TransferServiceContextReference transferQuery(gov.nih.nci.cagrid.cqlquery.CQLQuery cqlQuery) throws RemoteException, gov.nih.nci.cagrid.data.faults.QueryProcessingExceptionType, gov.nih.nci.cagrid.data.faults.MalformedQueryExceptionType {
		synchronized(portTypeMutex){
			configureStubSecurity((Stub)portType,"transferQuery");
			gov.nih.nci.cagrid.data.transfer.TransferQueryRequest params = new gov.nih.nci.cagrid.data.transfer.TransferQueryRequest();
			gov.nih.nci.cagrid.data.transfer.TransferQueryRequestCqlQuery cqlQueryContainer = new gov.nih.nci.cagrid.data.transfer.TransferQueryRequestCqlQuery();
			cqlQueryContainer.setCQLQuery(cqlQuery);
			params.setCqlQuery(cqlQueryContainer);
			gov.nih.nci.cagrid.data.transfer.TransferQueryResponse boxedResult = portType.transferQuery(params);
			return boxedResult.getTransferServiceContextReference();
		}
	}

	public org.cagrid.transfer.context.stubs.types.TransferServiceContextReference executeTransferQuery(org.cagrid.cql2.CQLQuery cqlQuery) throws RemoteException, gov.nih.nci.cagrid.data.faults.QueryProcessingExceptionType, gov.nih.nci.cagrid.data.faults.MalformedQueryExceptionType {
		synchronized(portTypeMutex){
			configureStubSecurity((Stub)portType,"executeTransferQuery");
			org.cagrid.dataservice.transfer.ExecuteTransferQueryRequest params = new org.cagrid.dataservice.transfer.ExecuteTransferQueryRequest();
			org.cagrid.dataservice.transfer.ExecuteTransferQueryRequestCqlQuery cqlQueryContainer = new org.cagrid.dataservice.transfer.ExecuteTransferQueryRequestCqlQuery();
			cqlQueryContainer.setCQLQuery(cqlQuery);
			params.setCqlQuery(cqlQueryContainer);
			org.cagrid.dataservice.transfer.ExecuteTransferQueryResponse boxedResult = portType.executeTransferQuery(params);
			return boxedResult.getTransferServiceContextReference();
		}
	}

}
