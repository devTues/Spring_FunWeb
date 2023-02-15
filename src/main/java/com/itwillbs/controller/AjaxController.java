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
	// 주소 매핑 처리 => 처리결과 출력
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result="";
		// data: {'id':$(.id').val()},
		String id=request.getParameter("id");
		// MemberDTO = getMember() 메서드 호출
		MemberDTO dto=memberService.getMember(id);
		if(dto!=null) {
			// 아이디 중복
			result = "iddup";
		}else {
			result = "idok";
		}
		
		// ResponseEntity 출력 결과를 담아서 리턴
		// result를 담아서 상태가 좋은것ok만 담아서 entity에 담기 
		ResponseEntity<String> entity=new ResponseEntity<String>(result, HttpStatus.OK);
//		return "결과";
		return entity; 
	} 
	
	@RequestMapping(value = "board/mainlist", method = RequestMethod.GET)
	public ResponseEntity<List<BoardDTO>> mainlist(HttpServletRequest request) {
		PageDTO pageDTO=new PageDTO();
		pageDTO.setStartRow(1);
		pageDTO.setPageSize(5);
		pageDTO.setCurrentPage(1);
		
		List<BoardDTO> boardList = boardService.getBoardList(pageDTO);
//		List<BoardDTO> -> json 변경하는 프로그램 설치
//		pom.xml -> jackson-databind 2.13.3 설치
		
		ResponseEntity<List<BoardDTO>> entity=new ResponseEntity<List<BoardDTO>>(boardList, HttpStatus.OK);
		return entity; 
	} 

}
