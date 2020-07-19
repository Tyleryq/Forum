package common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5_Test {
	public static String MD5(String oldStr)	{
		byte[] oldBytes = oldStr.getBytes();
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] newBytes = md.digest(oldBytes);
			BASE64Encoder en = new BASE64Encoder();
			String newStr = en.encode(newBytes);
			return newStr;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	
}
