package com.springmvcexample.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class AppUtils {
	
	public  static String getIpAddress() throws UnknownHostException {
		
		 InetAddress ipAddr = InetAddress.getLocalHost();
		 
		return ipAddr.getHostAddress();
		
	}

}
