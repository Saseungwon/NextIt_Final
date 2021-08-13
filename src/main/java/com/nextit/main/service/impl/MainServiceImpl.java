package com.nextit.main.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.nextit.board.vo.BoardVO;
import com.nextit.main.service.MainDao;
import com.nextit.main.service.MainService;
import com.nextit.main.vo.ArticleVO;
import com.nextit.match.vo.MatchVO;
import com.nextit.member.service.MemberDao;
import com.nextit.member.vo.MemberVO;

@Service
public class MainServiceImpl implements MainService {
	@Inject
	MainDao mainDao;
	@Inject
	MemberDao memberDao;
	
	private Logger logger=LoggerFactory.getLogger(getClass());
	
	public List<BoardVO> getFreeBoardList() {
		List<BoardVO> freeList = mainDao.getFreeBoardList();
		
		return freeList;
	}
	
	public List<ArticleVO> getArticleList() {
		List<ArticleVO> articleList = mainDao.getArticleList();
		
		return articleList;
	}

	@Override
	public List<BoardVO> getOpeningsList(String memId) {
		MemberVO member = memberDao.getMember(memId);
		List<BoardVO> openingsList = mainDao.getOpeningsList(member);

		return openingsList;
	}

	@Override
	public List<MatchVO> getMatchInfoList() {
		List<MatchVO> matchInfoList = mainDao.getMatchInfoList();
		return matchInfoList;
	}

}
