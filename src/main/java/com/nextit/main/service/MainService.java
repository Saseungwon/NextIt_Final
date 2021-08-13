package com.nextit.main.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.nextit.board.vo.BoardVO;
import com.nextit.main.vo.ArticleVO;
import com.nextit.match.vo.MatchVO;

public interface MainService {
	public List<BoardVO> getFreeBoardList();
	public List<ArticleVO> getArticleList();
	public List<BoardVO> getOpeningsList(String memId);
	public List<MatchVO> getMatchInfoList();
}
