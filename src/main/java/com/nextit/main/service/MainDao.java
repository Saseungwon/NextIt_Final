package com.nextit.main.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nextit.board.vo.BoardVO;
import com.nextit.main.vo.ArticleVO;
import com.nextit.match.vo.MatchVO;
import com.nextit.member.vo.MemberVO;

@Mapper
public interface MainDao {
	public List<ArticleVO> getArticleList();
	public List<BoardVO> getFreeBoardList();
	public List<BoardVO> getOpeningsList(MemberVO member);
	public List<MatchVO> getMatchInfoList();
}
