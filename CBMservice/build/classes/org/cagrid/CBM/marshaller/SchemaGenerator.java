package org.cagrid.CBM.marshaller;

import gov.nih.nci.cbm.domain.MarshallerModel.CbmNode;

import java.io.File;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.SchemaOutputResolver;
import javax.xml.transform.Result;
import javax.xml.transform.stream.StreamResult;

public class SchemaGenerator {

    private static final String XML_SCHEMA = "CBM.xsd";

    public SchemaGenerator() {
    }

    public static void main(String args[]) throws Exception {
	SchemaGenerator impl = new SchemaGenerator();
	impl.generateSchema();
    }

    public void generateSchema() {
	Class[] classes = new Class[1];
	classes[0] = CbmNode.class;

	JAXBContext jaxbContext;
	try {
	    jaxbContext = JAXBContext.newInstance(classes);
	    SchemaOutputResolver sor = new MySchemaOutputResolver();
	    jaxbContext.generateSchema(sor);
	} catch (Throwable e) {
	    System.err
		    .println("An error has occurred while generating the schema: "
			    + e.getMessage());
	    e.printStackTrace();
	}
	System.out
		.println("Schema generation complete.  \nThe schema has been written to "
			+ XML_SCHEMA);
    }

    private class MySchemaOutputResolver extends SchemaOutputResolver {
	public Result createOutput(String namespaceURI, String suggestedFileName)
		throws IOException {
	    // Write schema to CBM.xsd
	    File file = new File(XML_SCHEMA);
	    StreamResult result = new StreamResult(file);
	    result.setSystemId(file.toURI().toURL().toString());
	    return result;
	}
    }
}
