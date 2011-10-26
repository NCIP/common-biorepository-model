/**
 * CBMServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2RC2 Apr 28, 2006 (12:42:00 EDT) WSDL2Java emitter.
 */

package org.cagrid.CBM.stubs.service;

public class CBMServiceLocator extends org.apache.axis.client.Service implements org.cagrid.CBM.stubs.service.CBMService {

    public CBMServiceLocator() {
    }


    public CBMServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public CBMServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for CBMPortTypePort
    private java.lang.String CBMPortTypePort_address = "http://localhost:8080/wsrf/services/";

    public java.lang.String getCBMPortTypePortAddress() {
        return CBMPortTypePort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String CBMPortTypePortWSDDServiceName = "CBMPortTypePort";

    public java.lang.String getCBMPortTypePortWSDDServiceName() {
        return CBMPortTypePortWSDDServiceName;
    }

    public void setCBMPortTypePortWSDDServiceName(java.lang.String name) {
        CBMPortTypePortWSDDServiceName = name;
    }

    public org.cagrid.CBM.stubs.CBMPortType getCBMPortTypePort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(CBMPortTypePort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getCBMPortTypePort(endpoint);
    }

    public org.cagrid.CBM.stubs.CBMPortType getCBMPortTypePort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            org.cagrid.CBM.stubs.bindings.CBMPortTypeSOAPBindingStub _stub = new org.cagrid.CBM.stubs.bindings.CBMPortTypeSOAPBindingStub(portAddress, this);
            _stub.setPortName(getCBMPortTypePortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setCBMPortTypePortEndpointAddress(java.lang.String address) {
        CBMPortTypePort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (org.cagrid.CBM.stubs.CBMPortType.class.isAssignableFrom(serviceEndpointInterface)) {
                org.cagrid.CBM.stubs.bindings.CBMPortTypeSOAPBindingStub _stub = new org.cagrid.CBM.stubs.bindings.CBMPortTypeSOAPBindingStub(new java.net.URL(CBMPortTypePort_address), this);
                _stub.setPortName(getCBMPortTypePortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("CBMPortTypePort".equals(inputPortName)) {
            return getCBMPortTypePort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://CBM.cagrid.org/CBM/service", "CBMService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://CBM.cagrid.org/CBM/service", "CBMPortTypePort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        if ("CBMPortTypePort".equals(portName)) {
            setCBMPortTypePortEndpointAddress(address);
        }
        else { // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
