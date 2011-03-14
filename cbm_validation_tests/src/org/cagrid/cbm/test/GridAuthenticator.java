package org.cagrid.cbm.test;

import gov.nih.nci.cagrid.authentication.bean.BasicAuthenticationCredential;
import gov.nih.nci.cagrid.authentication.bean.Credential;
import gov.nih.nci.cagrid.authentication.client.AuthenticationClient;
import gov.nih.nci.cagrid.common.security.ProxyUtil;
import gov.nih.nci.cagrid.dorian.client.IFSUserClient;
import gov.nih.nci.cagrid.dorian.ifs.bean.ProxyLifetime;
import gov.nih.nci.cagrid.opensaml.SAMLAssertion;

import org.globus.gsi.GlobusCredential;

/**
 * gridClient Command line grid login example for client developers.
 * 
 * @author William Stephens
 */
public class GridAuthenticator {

   /*
    * 
    * 
    */
   private static SAMLAssertion authenticate(String url, String username, String password) throws Exception {
      Credential credential = new Credential();
      BasicAuthenticationCredential bac = new BasicAuthenticationCredential();
      bac.setUserId(username);
      bac.setPassword(password);
      credential.setBasicAuthenticationCredential(bac);

      SAMLAssertion saml = null;
      try {
         System.out.println("authenticating against : " + url);
         AuthenticationClient client = new AuthenticationClient(url, credential);
         saml = client.authenticate();
      }
      catch (Exception e) {
         // TODO: Display appropriate client error
         System.out.println("Authentication Exception " + e.getMessage());
         e.printStackTrace();
         throw e;
      }

      return saml;
   }

   private static GlobusCredential authorize(String url, SAMLAssertion saml) {
      GlobusCredential cred = null;

      System.out.println("authorizing against : " + url);

      // Create a IFS Client for authorization
      IFSUserClient c2 = null;
      try {
         c2 = new IFSUserClient(url);
      }
      catch (Exception e) {
         // TODO: Display appropriate client error
         System.out.println("IFSUserClient " + e.getMessage());
         e.printStackTrace();
      }

      // Create a lifetime for the proxy cert, 12 hours in this case
      ProxyLifetime lifetime = new ProxyLifetime();
      lifetime.setHours(12);
      lifetime.setMinutes(0);
      lifetime.setSeconds(0);

      // specify delegation, use 0 for now
      int delegation = 0;
      try {
         delegation = Integer.valueOf(1);
      }
      catch (Exception e) {
         // TODO: Display appropriate client error
         System.out.println("Delegation " + e.getMessage());
         e.printStackTrace();
      }

      try {
         cred = c2.createProxy(saml, lifetime, delegation);
      }
      catch (Throwable e) {
         // TODO: Display appropriate client error
         System.out.println("Authorization Exception " + e.getMessage());
         e.printStackTrace();
      }

      return cred;
   }

   public static void main(String args[]) throws Exception {

      authenticateWithGrid();
   }

   /**
    * @param args
    * @throws Exception
    */
   public static void authenticateWithGrid() throws Exception {

      // if (args.length < 2) {
      // System.out.println("usage: <username> <password>");
      // System.exit(-1);
      // }

      String url = "https://dorian.training.cagrid.org:8443/wsrf/services/cagrid/Dorian";

      String username = "powersb";
      SAMLAssertion saml = authenticate(url, username, "<todo>");
      if (saml == null) {
         // TODO: Display appropriate client error
         System.out.println("Failed to retrieve SAML assertion for : " + username);
         throw new Exception("Failed to retrieve SAML assertion for : " + username);
      }
      GlobusCredential cred = authorize(url, saml);
      ProxyUtil.saveProxyAsDefault(cred);
      System.out.println("logged in. saved proxy as default");

   }
}
