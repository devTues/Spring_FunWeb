package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxController {
	
	@Inject
	private MemberService memberService;
	
	// ${pageContext.request.contextPath }/member/idCheck
	// �ּ� ���� ó�� => ó����� ���
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result="";
		// data: {'id':$(.id').val()},
		String id=request.getParameter("id");
		// MemberDTO = getMember() �޼��� ȣ��
		MemberDTO dto=memberService.getMember(id);
		if(dto!=null) {
			// ���̵� �ߺ�
			result = "iddup";
		}else {
			result = "idok";
		}
		
		// ResponseEntity ��� ����� ��Ƽ� ����
		// result�� ��Ƽ� ���°� ������ok�� ��Ƽ� entity�� ��� 
		ResponseEntity<String> entity=new ResponseEntity<String>(result, HttpStatus.OK);
//		return "���";
		return entity; 
	} 

}
