package com.nextit.main.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nextit.board.vo.BoardVO;
import com.nextit.main.service.MainService;
import com.nextit.main.vo.ArticleVO;
import com.nextit.match.vo.MatchVO;
import com.nextit.member.vo.MemberVO;

@Controller
public class MainController {
	@Inject
	MainService mainService;
	
	private Logger logger=LoggerFactory.getLogger(getClass());
	
	@RequestMapping(path = "/main.wow")
	public String main(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("MEM_INFO");
		String memId = member.getMemId();
		List<BoardVO> freeList = mainService.getFreeBoardList();
		List<ArticleVO> articleList = mainService.getArticleList();
		List<BoardVO> openingsList = mainService.getOpeningsList(memId);
		
		logger.debug("openingsList = {}", openingsList);
		
		model.addAttribute("freeList", freeList);
		model.addAttribute("articleList", articleList);
		model.addAttribute("openingsList", openingsList);
		
		return "main/main";
	}
	
	@RequestMapping(path = "/matchList.wow")
	public String matchList(Model model) {
		List<MatchVO> matchInfoList = mainService.getMatchInfoList();
		model.addAttribute("matchInfoList", matchInfoList);
		return "main/matchList";
	}
	
	@RequestMapping(path = "/matchView.wow")
	public String matchView() {
		
		return "main/matchView";
	}
}
