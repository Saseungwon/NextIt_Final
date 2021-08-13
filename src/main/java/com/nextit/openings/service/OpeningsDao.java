package com.nextit.openings.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nextit.board.vo.BoardVO;
import com.nextit.openings.vo.OpeningsSearchVO;

@Mapper
public interface OpeningsDao {
	public int getOpeningsCount(OpeningsSearchVO searchVO);
	public List<BoardVO> getOpeningsList(OpeningsSearchVO searchVO);
	public BoardVO getOpenings(int boNo);
	public void registOpenings(BoardVO board);
}
