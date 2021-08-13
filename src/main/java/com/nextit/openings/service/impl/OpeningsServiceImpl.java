package com.nextit.openings.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nextit.attach.service.AttachDao;
import com.nextit.attach.vo.AttachVO;
import com.nextit.board.vo.BoardVO;
import com.nextit.openings.service.OpeningsDao;
import com.nextit.openings.service.OpeningsService;
import com.nextit.openings.vo.OpeningsSearchVO;

@Service
public class OpeningsServiceImpl implements OpeningsService {
	@Inject
	OpeningsDao openingsDao;
	@Inject
	AttachDao attachDao;

	@Override
	public List<BoardVO> getOfferList(OpeningsSearchVO searchVO) {
		searchVO.setSearchBoCate("OFFER");
		int totalRowCount = openingsDao.getOpeningsCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		List<BoardVO> offerList = openingsDao.getOpeningsList(searchVO);
		
		return offerList;
	}

	@Override
	public List<BoardVO> getSearchList(OpeningsSearchVO searchVO) {
		searchVO.setSearchBoCate("SEARCH");
		int totalRowCount = openingsDao.getOpeningsCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		List<BoardVO> offerList = openingsDao.getOpeningsList(searchVO);
		
		return offerList;
	}

	@Override
	public BoardVO getOpenings(int boNo) {
		BoardVO openings = openingsDao.getOpenings(boNo);
		
		return openings;
	}

	@Override
	public void registOpenings(BoardVO board) {
		openingsDao.registOpenings(board);
		
		if (board.getAttaches() != null) {
			for (AttachVO attach : board.getAttaches()) {		
				attach.setAtchParentNo(board.getBoNo());
				attachDao.registAttaches(attach);
			}
		}
	}

}
