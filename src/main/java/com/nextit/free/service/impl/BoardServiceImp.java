package com.nextit.free.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nextit.board.vo.BoardVO;
import com.nextit.exception.BizNotEffectedException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.free.service.BoardDao;
import com.nextit.free.service.BoardService;
import com.nextit.free.vo.FreeBoardSearchVO;

@Service
public class BoardServiceImp implements BoardService{

	@Inject
	BoardDao boardDao;
	
	@Override
	public List<BoardVO> getBoardList(FreeBoardSearchVO searchVO) {
		int totalRowCount = boardDao.getBoardCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		return boardDao.getBoardList(searchVO);
	}
	
	@Override
	public BoardVO getBoard(int boNo) throws BizNotFoundException {
		BoardVO board = boardDao.getBoard(boNo);
		if (board == null) {
			throw new BizNotFoundException();
		}
		return board;
	}
	
	@Override
	public void increaseHit(int boNo) throws BizNotEffectedException {
		int cnt = boardDao.increaseHit(boNo);
		if (cnt < 1) {
			throw new BizNotEffectedException();
		}
	}
	
	@Override
	public void modifyBoard(BoardVO free)
			throws BizNotFoundException, BizNotEffectedException{
		BoardVO board = boardDao.getBoard(free.getBoNo());
		System.out.println(board);
		if (board == null) {
			throw new BizNotFoundException();
		}else {
			int cnt = boardDao.updateBoard(free);
			System.out.println(cnt);
			if (cnt < 1)
				throw new BizNotEffectedException();
		}
	}
	
	@Override
	public void removeBoard(BoardVO free)
		throws BizNotFoundException, BizNotEffectedException {
		BoardVO board = boardDao.getBoard(free.getBoNo());
		if (board == null)
			throw new BizNotFoundException();
		else {
			int cnt = boardDao.deleteBoard(free);
			if(cnt < 1)
				throw new BizNotEffectedException();
		}
	}
	
	@Override
	public void registBoard(BoardVO free) throws BizNotEffectedException {
		boardDao.insertBoard(free);
	}

	@Override
	public void restoreBoard(BoardVO free) throws BizNotFoundException,BizNotEffectedException {
		BoardVO board = boardDao.getBoard(free.getBoNo());
		if (board == null)
			throw new BizNotFoundException();
		else {
			int cnt = boardDao.restoreBoard(free);
			if(cnt < 1)
				throw new BizNotEffectedException();
		}
		
	}

	@Override
	public List<BoardVO> getBoardListYn(FreeBoardSearchVO searchVO) {
		int totalRowCount = boardDao.getBoardCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		return boardDao.getBoardListYn(searchVO);
	}
	
	
}
	
