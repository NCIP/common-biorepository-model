package org.cagrid.CBM.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.rmi.RemoteException;

import org.cagrid.transfer.context.service.helper.TransferServiceHelper;
import org.cagrid.transfer.context.stubs.types.TransferServiceContextReference;
import org.cagrid.transfer.descriptor.DataDescriptor;

/** 
 * TODO:I am the service side implementation class.  IMPLEMENT AND DOCUMENT ME
 * 
 * @created by Introduce Toolkit version 1.4
 * 
 */
public class CBMImpl extends CBMImplBase {

	
	public CBMImpl() throws RemoteException {
		super();
	}
	
  public org.cagrid.transfer.context.stubs.types.TransferServiceContextReference extractCBMdata() throws RemoteException {
		try{
			String fileNameAttribute = "CBM_FILE_LOCATION";
			String fileName = System.getenv(fileNameAttribute);
			if(fileName == null){
				throw new RemoteException("Unable to locate CBM data file for transfer.  Please confirm that the environment variable " + fileNameAttribute + " is set.");
			}
			
			// create some data to sent
			File file = new File(fileName);
			boolean exists = file.exists();
			if(!exists){
				throw new RemoteException("Unable to locate CBM data file for transfer.  Please confirm that the file " + fileName + " exists.");
			}
			
			
			byte[] data = getBytesFromFile(file);
			
			// create a descriptor for that data
			DataDescriptor dd = new DataDescriptor(null, "CBM data");
			
			// create the transfer resource that will handle delivering the data and
			// return the reference to the user
			TransferServiceContextReference ref = TransferServiceHelper.createTransferContext(data, dd);
			return ref;
		}
		catch(IOException ioe){
			throw new RemoteException(ioe.getMessage());
		}
  }
  
	/** Returns the contents of the file in a byte array.
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public static byte[] getBytesFromFile(File file) throws IOException {
		InputStream is = new FileInputStream(file);

		// Get the size of the file
		long length = file.length();

		// You cannot create an array using a long type.
		// It needs to be an int type.
		// Before converting to an int type, check
		// to ensure that file is not larger than Integer.MAX_VALUE.
		if (length > Integer.MAX_VALUE) {
			throw new IOException("File is too large, max size is " + Integer.MAX_VALUE + " bytes");
		}

		// Create the byte array to hold the data
		byte[] bytes = new byte[(int)length];

		// Read in the bytes
		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length
				&& (numRead=is.read(bytes, offset, bytes.length-offset)) >= 0) {
			offset += numRead;
		}

		// Ensure all the bytes have been read in
		if (offset < bytes.length) {
			throw new IOException("Could not completely read file "+file.getName());
		}

		// Close the input stream and return bytes
		is.close();
		return bytes;
	}
  

}

