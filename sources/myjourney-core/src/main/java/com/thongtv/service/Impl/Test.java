package com.thongtv.service.Impl;

import org.opencms.security.CmsDefaultPasswordHandler;
import org.opencms.security.CmsPasswordEncryptionException;


public class Test {
	
	public static void main(String[] args) {
        CmsDefaultPasswordHandler handler = new CmsDefaultPasswordHandler();
        
       // handler.initConfiguration();
       // handler.setDigestType("scrypt");
        try {
			String pass = handler.digest("123456", "scrypt", "utf8");
			System.out.println(pass);
		} catch (CmsPasswordEncryptionException e) {
			e.printStackTrace();
		}
	}
}
