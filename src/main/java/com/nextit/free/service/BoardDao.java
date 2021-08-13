package com.nextit.free.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nextit.board.vo.BoardVO;
import com.nextit.free.vo.FreeBoardSearchVO;

@Mapper
public interface BoardDao {
	public int getBoardCount(FreeBoardSearchVO searchVO);
	public List<BoardVO> getBoardList(FreeBoardSearchVO searchVO); 
	public List<BoardVO> getBoardListYn(FreeBoardSearchVO searchVO); 
	public BoardVO getBoard(int boNo) ;
	public int increaseHit(int boNo);
	public int updateBoard(BoardVO board);
	public int deleteBoard(BoardVO board);
	public int insertBoard(BoardVO board);
	public int restoreBoard(BoardVO board);
}