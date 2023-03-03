package com.itwillbs.service;

import java.security.MessageDigest;

public class MyHash {
	//멤버변수 암호화된 비밀번호
	private String strHashData="";
	
	//생성자
	public MyHash(String algorithm,String pass) {
		//암호화 알고리즘 호출
		testHashing(algorithm, pass);
	}
	
	//암호화 알고리즘
	private void testHashing(String algorithm, String pass) {
		try {
		MessageDigest md=MessageDigest.getInstance(algorithm);
			
		byte[] bytePass=pass.getBytes();
		md.update(bytePass);
		
		byte[] digest=md.digest();
		for(byte b:digest) {
			strHashData += Integer.toHexString(b & 0xFF).toUpperCase();
		}
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("암호화 알고리즘 존재하지 않습니다.");
		}
	}
	
	// 외부에서 호출할수 있는 메서드
	public String getHashData() {
		return strHashData;
	}
	
}//
