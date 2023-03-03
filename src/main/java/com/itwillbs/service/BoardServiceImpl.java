package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BoardServiceImpl implements BoardService{
	//객체생성
	@Inject
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardDTO boardDTO) {
		// name subject content
		// num readcount date
		boardDTO.setReadcount(0);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		//num 
		if(boardDAO.getMaxNum()==null) {
			//글없음
			boardDTO.setNum(1);
			// re_ref  일반글(기준글) = 그룹번호 일치
			boardDTO.setRe_ref(1);
		}else {
			//글있음
			boardDTO.setNum(boardDAO.getMaxNum()+1);
			// re_ref  일반글(기준글) = 그룹번호 일치
			boardDTO.setRe_ref(boardDAO.getMaxNum()+1);
		}
		
//		일반글 => re_ref 일반글 번호 일치,  re_lev 0  re_seq 0
		boardDTO.setRe_lev(0);
		boardDTO.setRe_seq(0);
		
		//메서드 호출
		boardDAO.insertBoard(boardDTO);
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return boardDAO.getBoardList(pageDTO);
	}

	@Override
	public int getBoardCount() {
		return boardDAO.getBoardCount();
	}

	@Override
	public BoardDTO getBoard(int num) {
		
		return boardDAO.getBoard(num);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
		
	}

	@Override
	public void deleteBoard(int num) {
		boardDAO.deleteBoard(num);
	}
	
	@Override
	public void reinsertBoard(BoardDTO boardDTO) {
		// name subject content re_ref re_lev re_seq
		// 답글 순서 재배치
		boardDAO.updateReSeq(boardDTO);		
		
		// num readcount date
		boardDTO.setReadcount(0);
		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
		//num 
		if(boardDAO.getMaxNum()==null) {
			//글없음
			boardDTO.setNum(1);
		}else {
			//글있음
			boardDTO.setNum(boardDAO.getMaxNum()+1);
		}
		
//		답글 => re_ref 그대로 사용,  re_lev +1  re_seq +1
		boardDTO.setRe_lev(boardDTO.getRe_lev()+1);
		boardDTO.setRe_seq(boardDTO.getRe_seq()+1);
		
		//메서드 호출
		boardDAO.insertBoard(boardDTO);
	}

	@Override
	public List<Map<String, Object>> getBoardListMap() {
		return boardDAO.getBoardListMap();
	}

}
