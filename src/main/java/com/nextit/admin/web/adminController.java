package com.nextit.admin.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nextit.board.vo.BoardVO;
import com.nextit.exception.BizDuplicateKeyException;
import com.nextit.exception.BizNotEffectedException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.exception.BizPasswordNotMatchedException;
import com.nextit.free.service.BoardService;
import com.nextit.free.vo.FreeBoardSearchVO;
import com.nextit.member.service.MemberService;
import com.nextit.member.vo.MemberVO;
import com.nextit.team.service.TeamService;
import com.nextit.team.vo.TeamVO;

@Controller
public class adminController {

	@Inject
	TeamService teamService;
	@Inject
	MemberService memberService;
	@Inject
	BoardService boardService;

	@RequestMapping(value = "/admin/teamDelete.wow", method = RequestMethod.POST)
	public String teamDelete(@RequestParam(name = "teamName") String teamName) {
		teamService.deleteTeam(teamName);

		return "team/teamList";
	}

	@RequestMapping(value = "/admin/memDelete.wow", method = RequestMethod.POST)
	public String memDelete(@RequestParam(name = "memId") String memId, Model model)
			throws BizNotEffectedException, BizNotFoundException {
		MemberVO member = (MemberVO) memberService.getMember(memId);
		memberService.removeMember(member);
		List<MemberVO> memList = memberService.getMemList();
		model.addAttribute("memList", memList);
		return "mypage/memberList";
	}

	@RequestMapping(value = "/admin/memRestore.wow", method = RequestMethod.POST)
	public String memRestore(@RequestParam(name = "memId") String memId, Model model)
			throws BizNotEffectedException, BizNotFoundException {
		MemberVO member = (MemberVO) memberService.getMemberYn(memId);
		memberService.restoreMember(member);
		List<MemberVO> memList = memberService.getMemList();
		model.addAttribute("memList", memList);
		return "mypage/memberList";
	}

	@RequestMapping(value = "/admin/memList.wow", method = RequestMethod.POST)
	public String memList(Model model) {
		List<MemberVO> memList = memberService.getMemList();
		model.addAttribute("memList", memList);
		return "mypage/memberList";
	}

	@RequestMapping(value = "/admin/boDelete.wow", method = RequestMethod.POST)
	public String boDelete(@ModelAttribute("searchVO") FreeBoardSearchVO searchVO,
			@RequestParam(name = "boNo") int boNo, Model model)
			throws BizNotEffectedException, BizNotFoundException, BizPasswordNotMatchedException {
		BoardVO board = boardService.getBoard(boNo);
		boardService.removeBoard(board);
		model.addAttribute("searchVO", searchVO);
		List<BoardVO> boardList = boardService.getBoardList(searchVO);
		model.addAttribute("boardList", boardList);
		return "free/boardList";
	}

	@RequestMapping(value = "/admin/boRestore.wow", method = RequestMethod.POST)
	public String boRestore(@ModelAttribute("searchVO") FreeBoardSearchVO searchVO,
			@RequestParam(name = "boNo") int boNo, Model model) throws BizNotEffectedException, BizNotFoundException {
		BoardVO board = boardService.getBoard(boNo);
		boardService.restoreBoard(board);
		model.addAttribute("searchVO", searchVO);
		List<BoardVO> boardList = boardService.getBoardList(searchVO);
		model.addAttribute("boardList", boardList);
		return "free/boardList";
	}

}
