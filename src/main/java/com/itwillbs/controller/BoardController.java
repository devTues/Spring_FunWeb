package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {
	// 객체생성
	@Inject
	private BoardService boardService;
	
	//xml 업로드 경로 (자원이름)=> 변수 저장
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)	
	public String write() {
		// 기본 이동방식 : 주소변경 없이 이동 
		return "center/writeForm";
	}//
	
	@RequestMapping(value = "/board/writePro", method = RequestMethod.POST)	
	public String writePro(BoardDTO boardDTO) {
		// insertBoard(boardDTO) 메서드 호출
		boardService.insertBoard(boardDTO);
		
		return "redirect:/board/list";
	}//
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)	
	public String list(HttpServletRequest request,Model model) {
		//화면에 보여줄 글개수 
		int pageSize=15;
		//페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		
		int count=boardService.getBoardCount();
		
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		//데이터 담기
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "center/notice";
	}//
	
	@RequestMapping(value = "/board/fwrite", method = RequestMethod.GET)	
	public String fwrite() {
		// 기본 이동방식 : 주소변경 없이 이동 
		return "center/fwriteForm";
	}//
	
	@RequestMapping(value = "/board/fwritePro", method = RequestMethod.POST)	
	public String fwritePro(HttpServletRequest request,MultipartFile file) throws Exception{
		// 업로드 파일명 => 랜덤문자_파일이름 => 파일이름 중복 안됨
		UUID uuid=UUID.randomUUID();
		String filename=uuid.toString()+"_"+file.getOriginalFilename();
		
		// 원본 파일 복사 => upload 복사
//		FileCopyUtils.copy(원본, 복사해서 새롭게 파일 만들기);
		FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
		
		// BoardDTO 객체생성 <= 저장
		 BoardDTO boardDTO=new BoardDTO();
		 boardDTO.setName(request.getParameter("name"));
		 boardDTO.setSubject(request.getParameter("subject"));
		 boardDTO.setContent(request.getParameter("content"));
		 boardDTO.setFile(filename);
		
		// insertBoard(boardDTO) 메서드 호출
		boardService.insertBoard(boardDTO);
		
		return "redirect:/board/list";
	}//
	
	@RequestMapping(value = "/board/content", method = RequestMethod.GET)	
	public String content(HttpServletRequest request,Model model) {
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardDTO dto=boardService.getBoard(num);
		
		model.addAttribute("dto", dto);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "center/content";
	}//
	
	
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)	
	public String update(HttpServletRequest request,Model model) {
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardDTO dto=boardService.getBoard(num);
		
		model.addAttribute("dto", dto);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "center/updateForm";
	}//
	
	@RequestMapping(value = "/board/updatePro", method = RequestMethod.POST)	
	public String updatePro(BoardDTO boardDTO) {
		// updateBoard(boardDTO) 메서드 호출
		boardService.updateBoard(boardDTO);
		
		return "redirect:/board/list";
	}//
	
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)	
	public String delete(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		
		boardService.deleteBoard(num);
		
		return "redirect:/board/list";
	}//
	
	@RequestMapping(value = "/board/rewrite", method = RequestMethod.GET)	
	public String rewrite(BoardDTO boardDTO, Model model) {
		// /board/rewrite?num=${dto.num}
		//re_ref, re_lev, re_seq 가져오기
		boardDTO=boardService.getBoard(boardDTO.getNum());
		
		model.addAttribute("boardDTO", boardDTO);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "center/rewriteForm";
	}//
	
	@RequestMapping(value = "/board/rewritePro", method = RequestMethod.POST)	
	public String rewritePro(BoardDTO boardDTO) {
		// insertBoard(boardDTO) 메서드 호출
		boardService.reinsertBoard(boardDTO);
		
		return "redirect:/board/list";
	}//
	
	@RequestMapping(value = "/board/listmap", method = RequestMethod.POST)	
	public String listmap(HttpServletRequest request, Model model) {
		List<Map<String, Object>> boardListMap = boardService.getBoardListMap();
		
		model.addAttribute("boardListMap", boardListMap);
		
		return "center/noticemap";
	}//
	
	
}//
