package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardDTO boardDTO) {
		
		if(boardDAO.getMaxNum()==null) {
			// 글이 없는 경우
			boardDTO.setNum(1);
		} else {
			boardDTO.setNum(boardDAO.getMaxNum()+1);
		}
		boardDTO.setReadcount(0);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		
		boardDAO.insertBoard(boardDTO);
		
	}
	
	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		 
		 // startRow-1
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return boardDAO.getBoardList(pageDTO);
	}

	@Override
	public int getBoardCount() {
		return boardDAO.getBoardCount();
	}

	@Override
	public void updateReadcount(int num) {
		boardDAO.updateReadcount(num);
	}

	@Override
	public BoardDTO getBoard(int num) {
		return boardDAO.getBoard(num);
	}

}
