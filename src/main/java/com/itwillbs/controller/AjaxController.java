package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private BoardService boardService;
	
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
	
	@RequestMapping(value = "board/mainlist", method = RequestMethod.GET)
	public ResponseEntity<List<BoardDTO>> mainlist(HttpServletRequest request) {
		PageDTO pageDTO=new PageDTO();
		pageDTO.setStartRow(1);
		pageDTO.setPageSize(5);
		pageDTO.setCurrentPage(1);
		
		List<BoardDTO> boardList = boardService.getBoardList(pageDTO);
//		List<BoardDTO> -> json �����ϴ� ���α׷� ��ġ
//		pom.xml -> jackson-databind 2.13.3 ��ġ
		
		ResponseEntity<List<BoardDTO>> entity=new ResponseEntity<List<BoardDTO>>(boardList, HttpStatus.OK);
		return entity; 
	} 

}
