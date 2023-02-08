package com.itwillbs.dao;

import com.itwillbs.domain.MemberDTO;

public interface MemberDAO {

	public void insetMember(MemberDTO memberDTO);
	public MemberDTO userCheck(MemberDTO memberDTO);
	public MemberDTO getMember(String id);
	public void updateMember(MemberDTO memberDTO);
	
}
