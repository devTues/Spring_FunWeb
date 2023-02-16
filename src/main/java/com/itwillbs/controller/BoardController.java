package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {
	
	@Inject
	private BoardService boardService;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String write() {
		return "center/writeForm";
	} 
	
	@RequestMapping(value = "/board/writePro", method = RequestMethod.POST)
	public String writePro(BoardDTO boardDTO, HttpSession session) {
		boardService.insertBoard(boardDTO);
		return "redirect:/board/list";
	} // insertPro 메서드
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		int pageSize=10;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		// set메서드 호출
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<BoardDTO> boardList = boardService.getBoardList(pageDTO);
		
		int count=boardService.getBoardCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize== 0 ? 0 : 1);
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		pageDTO.setCount(pageCount);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDto",pageDTO);
		return "center/notice"; // 폴더명/파일이름
	} // insertPro 메서드
	
	
	@RequestMapping(value = "/board/content", method = RequestMethod.GET)
	public String content(Model model, HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		boardService.updateReadcount(num);
		BoardDTO boardDTO=boardService.getBoard(num);
		model.addAttribute("boardDTO", boardDTO);
		return "center/content";
	} 
	
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String update(Model model) {
		return "/center/updateForm"; 
	}
	
	@RequestMapping(value = "/board/updatePro", method = RequestMethod.POST)
	public String updatePro(BoardDTO boardDTO, Model model, HttpServletRequest request) {
		boardService.updateBoard(boardDTO);
		return "redirect:/center/content";
	} // updatePro 메서드
	
	
	@RequestMapping(value = "/board/fwrite", method = RequestMethod.GET)
	public String fwrite(Model model, HttpServletRequest request) {
		return "center/fwriteForm";
	} 
	
	@RequestMapping(value = "/board/fwritePro", method = RequestMethod.POST)
	public String fwritePro(HttpServletRequest request, MultipartFile file) throws Exception{
		// 업로드 파일명 => 랜덤문자_파일이름
		UUID uuid=UUID.randomUUID();
		String filename=uuid.toString()+"_"+file.getOriginalFilename();
		// 원본파일을 복사해서 upload 폴더에 붙여넣기
		FileCopyUtils.copy(file.getBytes(), new File(uploadPath,filename));
		// BoardDTO 객체생성 => 저장
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setName(request.getParameter("name"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		boardDTO.setFile(filename);
		
		boardService.insertBoard(boardDTO);
		return "redirect:/board/list";
	} // insertPro 메서드
	
	@RequestMapping(value = "/board/flist", method = RequestMethod.GET)
	public String flist(Model model, HttpServletRequest request) {
		int pageSize=10;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		// set메서드 호출
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<BoardDTO> boardList = boardService.getBoardList(pageDTO);
		
		int count=boardService.getBoardCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize== 0 ? 0 : 1);
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		pageDTO.setCount(pageCount);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDto",pageDTO);
		return "center/fnotice"; // 폴더명/파일이름
	} // insertPro 메서드
	
	@RequestMapping(value = "/board/fcontent", method = RequestMethod.GET)
	public String fcontent(Model model, HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		boardService.updateReadcount(num);
		BoardDTO boardDTO=boardService.getBoard(num);
		model.addAttribute("boardDTO", boardDTO);
		return "center/fcontent";
	} // update 메서드

}
