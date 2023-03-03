package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardService {
	//추상메서드 정의
	public void insertBoard(BoardDTO boardDTO);
	
	public List<BoardDTO> getBoardList(PageDTO pageDTO);
	
	public int getBoardCount();
	
	public BoardDTO getBoard(int num);
	
	public void updateBoard(BoardDTO boardDTO);
	
	public void deleteBoard(int num);
	
	public void reinsertBoard(BoardDTO boardDTO);
	
	public List<Map<String, Object>> getBoardListMap(); 
	
}
