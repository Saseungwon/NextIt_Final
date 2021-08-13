package com.nextit.team.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nextit.common.util.ProfileUtils;
import com.nextit.common.valid.RegistType;
import com.nextit.exception.BizNotFoundException;
import com.nextit.login.service.LoginService;
import com.nextit.member.vo.MemberVO;
import com.nextit.profile.vo.ProfileVO;
import com.nextit.team.service.TeamService;
import com.nextit.team.vo.TeamVO;

@Controller
public class TeamController {
	@Inject
	TeamService teamService;
	@Inject
	LoginService loginService;
	@Inject
	ProfileUtils profileUtils;

	private Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(path = "/team/main.wow")
	public String teamMain() {

		return "team/main";
	}

	@RequestMapping(path = "/team/teamList.wow")
	public String teamList(Model model) {
		List<TeamVO> teamList = teamService.getTeamList();
		model.addAttribute("teamList", teamList);

		return "team/teamList";
	}

	@RequestMapping(path = "/team/teamView.wow")
	public String teamView(@RequestParam(name = "teamName") String teamName, Model model) {
		TeamVO team = teamService.getTeamInfo(teamName);
		model.addAttribute("team", team);
		return "team/teamView";
	}

	@RequestMapping(path = "/team/teamForm.wow")
	public String teamForm(@ModelAttribute(name = "team") TeamVO team) {
		return "team/teamForm";
	}

	@PostMapping(path = "/team/teamRegist.wow")
	public String teamRegist(@ModelAttribute(name = "team")@Validated({Default.class, RegistType.class})TeamVO team
			, BindingResult error
			, MultipartFile proFile
			, HttpServletRequest req) throws IOException {
			HttpSession session = req.getSession();
			MemberVO member = (MemberVO) session.getAttribute("MEM_INFO");
			
			if (error.hasErrors()) {
				return "team/teamForm";
			}
			
			if (!proFile.isEmpty()) {
				ProfileVO profileVO = profileUtils.getProfileByMultipart(proFile, "TEAM", member.getMemId());
				team.setTeamImageUrl(profileVO.getPfPath());
			}
			
			teamService.registTeam(team);
			
			return "redirect:/team/teamList.wow";
		}

	@RequestMapping(path = "/team/teamJoin.wow")
	public String teamJoin(@RequestParam(name = "teamName") String teamName, Model model) {
		model.addAttribute("teamName", teamName);
		return "team/teamJoin";
	}

	@RequestMapping(path = "/team/teamJoinRegist.wow", method = RequestMethod.POST)
	public String teamJoinRegist(HttpServletRequest req, @RequestParam(name = "memId") String memId,
			@RequestParam(name = "memTeamName") String memTeamName, @RequestParam(name = "memBackNo") String memBackNo,
			@RequestParam(name = "memPref") String memPref) throws BizNotFoundException {
		MemberVO member = new MemberVO();
		member.setMemId(memId);
		member.setMemTeamName(memTeamName);
		member.setMemBackNo(memBackNo);
		member.setMemPref(memPref);
		teamService.joinTeam(member);
		loginService.sessionRefresh(req);
		return "forward:/team/teamView.wow?teamName=" + member.getMemTeamName();
	}

	@RequestMapping(path = "/team/teamQuit.wow")
	public String teamQuit(HttpServletRequest req, Model model) throws BizNotFoundException {
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO) session.getAttribute("MEM_INFO");
		teamService.quitTeam(user.getMemId());
		loginService.sessionRefresh(req);
		List<TeamVO> teamList = teamService.getTeamList();
		model.addAttribute("teamList", teamList);
		return "team/teamList";
	}

}