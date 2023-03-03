package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public void insertMember(MemberDTO memberDTO) {
		// 가입날짜
		memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// 비밀번호 암호화 작업
		// 단방향 암호화 => Hash 이용 암호화
		String algorithm="SHA-256";
		String pass=memberDTO.getPass();
		
		// 객체생성
		MyHash myHash =  new MyHash(algorithm, pass);
		
		// 메서드 호출
		String result = myHash.getHashData();
		
		System.out.println("비밀번호 암호화된 결과 :" + result);
		
		// 멤버DTO 저장
//		memberDTO.setPass(result);
	
		
		memberDAO.insetMember(memberDTO);
		
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return memberDAO.userCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		memberDAO.updateMember(memberDTO);
	}
	
	
	
}
