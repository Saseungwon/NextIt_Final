package com.nextit.openings.service;

import java.util.List;

import com.nextit.board.vo.BoardVO;
import com.nextit.openings.vo.OpeningsSearchVO;

public interface OpeningsService {
	public List<BoardVO> getOfferList(OpeningsSearchVO searchVO);
	public List<BoardVO> getSearchList(OpeningsSearchVO searchVO);
	public BoardVO getOpenings(int boNo);
	public void registOpenings(BoardVO board);
}
