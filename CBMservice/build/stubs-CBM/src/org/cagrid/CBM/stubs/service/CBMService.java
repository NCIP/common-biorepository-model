/*L
 *  Copyright Washington University in St.Louis
 *  Copyright Information Management Services, Inc.
 *  Copyright Sapient
 *  Copyright Booz Allen Hamilton
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-biorepository-model/LICENSE.txt for details.
 */

/**
 * CBMService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2RC2 Apr 28, 2006 (12:42:00 EDT) WSDL2Java emitter.
 */

package org.cagrid.CBM.stubs.service;

public interface CBMService extends javax.xml.rpc.Service {
    public java.lang.String getCBMPortTypePortAddress();

    public org.cagrid.CBM.stubs.CBMPortType getCBMPortTypePort() throws javax.xml.rpc.ServiceException;

    public org.cagrid.CBM.stubs.CBMPortType getCBMPortTypePort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
