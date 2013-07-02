/*L
 *  Copyright Washington University in St.Louis
 *  Copyright Information Management Services, Inc.
 *  Copyright Sapient
 *  Copyright Booz Allen Hamilton
 *
 *  Distributed under the OSI-approved BSD 3-Clause License.
 *  See http://ncip.github.com/common-biorepository-model/LICENSE.txt for details.
 */

package org.cagrid.CBM.test;

import java.io.File;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.cagrid.CBM.client.CBMClient;
import org.junit.Test;
import org.xml.sax.SAXException;

public class CbmDataExtractionTests extends CbmTest {

	/**
	 * Test to download and validate the structure of a CBM data extraction file
	 * 
	 * @throws Exception
	 */
	@Test
	public void testDataExtractionMethod() throws Exception{
		
		String url = CbmTest.getServiceUrl();
		String fileName = "temp.xml";
		try{
			CBMClient.retrieveData(fileName, url);
		}
		catch(Exception e){
			String failMsg = "There has been an exception downloading the data file from the CBM node: " + url;
			failMsg += "\n\n" + e.getLocalizedMessage();
			fail(failMsg);
		}
		
		validateXml(fileName);
		
		
	}
	
	static private void validateXml(String fileName) throws Exception{
		File schemaFile = new File("CBM.xsd");

		Source xmlFile = new StreamSource(new File(fileName));
		SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
		Schema schema = schemaFactory.newSchema(schemaFile);
		Validator validator = schema.newValidator();

		try {
			validator.validate(xmlFile);
		} catch (SAXException e) {
			String failMsg = "The file downloaded from the CBM node ";
			failMsg += xmlFile.getSystemId() + " is NOT valid";
			failMsg += "Reason: " + e.getLocalizedMessage();
			fail(failMsg);
		}
	}
	


}
