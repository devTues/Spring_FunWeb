package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardDAO {

	public void insertBoard(BoardDTO boardDTO);
	public Integer getMaxNum();
	public List<BoardDTO> getBoardList(PageDTO dto);
	public int getBoardCount();
	public BoardDTO getBoard(int num);
	public void updateReadcount(int num);
	public void updateBoard(BoardDTO boardDTO);
	

}
