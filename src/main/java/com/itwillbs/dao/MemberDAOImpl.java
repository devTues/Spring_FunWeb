package com.itwillbs.dao;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.memberMapper";

	@Override
	public void insetMember(MemberDTO memberDTO) {
		Timestamp date=new Timestamp(System.currentTimeMillis());
		memberDTO.setDate(date);
		sqlSession.insert(namespace+".insertMember", memberDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}

	@Override
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne(namespace+".getMember", id);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		sqlSession.update(namespace+".updateMember", memberDTO);
		
	}
	
	
	
}
