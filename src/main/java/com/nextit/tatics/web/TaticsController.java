package com.nextit.tatics.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nextit.member.vo.MemberVO;
import com.nextit.tatics.service.TaticsService;
import com.nextit.tatics.vo.TaticsVO;
import com.nextit.team.vo.TeamVO;

@Controller
public class TaticsController {

	@Inject
	TaticsService taticsService; 
	
	@RequestMapping("/team/tatics.wow")
	public String tatics(@RequestParam(name = "teamName")String teamName, Model model) {
		TeamVO team = taticsService.getTeamInfo(teamName);
		model.addAttribute("team", team);
		return "team/tatics";
	}
	
	@RequestMapping("/tatics/taticsView.wow")
	public String memRecord(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO) session.getAttribute("MEM_INFO");
		String teamName = user.getMemTeamName();
		List<TaticsVO> teamList = taticsService.getTeamList(teamName);
		TaticsVO highGoal = taticsService.getHighGoal(teamName);
		TaticsVO highAssi = taticsService.getHighAssi(teamName); 
		model.addAttribute("teamList", teamList);
		model.addAttribute("highGoal", highGoal);
		model.addAttribute("highAssi", highAssi);
		
		return "tatics/taticsView";
	}
	
	
}
