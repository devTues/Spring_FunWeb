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
		// ���Գ�¥
		memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// ��й�ȣ ��ȣȭ �۾�
		// �ܹ��� ��ȣȭ => Hash �̿� ��ȣȭ
		String algorithm="SHA-256";
		String pass=memberDTO.getPass();
		
		// ��ü����
		MyHash myHash =  new MyHash(algorithm, pass);
		
		// �޼��� ȣ��
		String result = myHash.getHashData();
		
		System.out.println("��й�ȣ ��ȣȭ�� ��� :" + result);
		
		// ���DTO ����
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
