package com.nextit.record.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nextit.common.valid.RegistType;
import com.nextit.common.vo.ResultMessageVO;
import com.nextit.member.vo.MemberVO;
import com.nextit.record.service.RecordDao;
import com.nextit.record.service.RecordService;
import com.nextit.record.vo.FriendlyRecordVO;
import com.nextit.record.vo.LeagueRecordVO;
import com.nextit.record.vo.MemberRecordCountVO;
import com.nextit.record.vo.MemberRecordVO;
import com.nextit.team.vo.TeamVO;

@Controller
public class RecordController {

	@Inject
	RecordService recordservice;

	@Inject
	RecordDao recordDao;

	@RequestMapping(value = "/mypage/record.wow")
	public String memRecord(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO) session.getAttribute("MEM_INFO");

		System.out.println(user.getMemId());
		List<MemberRecordVO> record = recordservice.getMemRcd(user.getMemId());
		List<MemberRecordCountVO> recordCount = recordservice.getMemRcdCount(user.getMemId());
		req.setAttribute("record", record);
		req.setAttribute("recordCount", recordCount);

		return "mypage/memRcd";

	}

	@RequestMapping(value = "/team/recordForm.wow")
	public String recordForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO) session.getAttribute("MEM_INFO");
		System.out.println(user);
		if (!user.getMemTeamRole().equals("MANAGER")) {
			ResultMessageVO resultMessageVO = new ResultMessageVO();

			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("recordForm");
			resultMessageVO.setMessage("권한이 없습니다..");

			req.setAttribute("resultMessageVO", resultMessageVO);

			return "common/message";
		} else {
			LeagueRecordVO leaRecord = new LeagueRecordVO();
			FriendlyRecordVO fndRecord = new FriendlyRecordVO();
			req.setAttribute("leaRecord", leaRecord);
			req.setAttribute("fndRecord", fndRecord);

			return "record/recordForm";
		}
	}

	@RequestMapping(value = "/record/league.wow", method = RequestMethod.POST)
	public String leagueRecord(
			@ModelAttribute(name = "leaRecord") @Validated({ Default.class,
					RegistType.class }) LeagueRecordVO leaRecord,
			@ModelAttribute(name = "memRcd") MemberRecordVO memRcd, BindingResult error) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("leaTeamName", leaRecord.getLeaTeamName());
		map.put("leaMatchNo", leaRecord.getLeaMatchNo());
		LeagueRecordVO vo = recordDao.checkLeaRcd(map);
		if (vo == null) {
			recordservice.registLeaRcd(leaRecord);
		}
		memRcd.setRcdMatchCate("lea");
		memRcd.setRcdMatchNo(leaRecord.getLeaMatchNo());
		return "record/scoreForm";
	}

	@RequestMapping(value = "/record/friendly.wow", method = RequestMethod.POST)
	public String friendlyRecord(
			@ModelAttribute(name = "fndRecord") @Validated({ Default.class,
					RegistType.class }) FriendlyRecordVO fndRecord,
			@ModelAttribute(name = "memRcd") MemberRecordVO memRcd, BindingResult error) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fndTeamName", fndRecord.getFndTeamName());
		map.put("fndMatchNo", fndRecord.getFndMatchNo());
		FriendlyRecordVO vo = recordDao.checkFrdRcd(map);
		if (vo == null) {
			recordservice.registFrdRcd(fndRecord);
		}
		memRcd.setRcdMatchCate("fnd");
		memRcd.setRcdMatchNo(fndRecord.getFndMatchNo());
		return "record/scoreForm";
	}

	@RequestMapping(value = "/record/registScore.wow", method = RequestMethod.POST)
	public String registMemRcd(@RequestParam(name = "rcdMatchNo") int rcdMatchNo,
			@RequestParam(name = "rcdMatchCate") String rcdMatchCate,
			@RequestParam(name = "rcdMemId") List<String> rcdMemId,
			@RequestParam(name = "rcdGoal") List<Integer> rcdGoal,
			@RequestParam(name = "rcdAssist") List<Integer> rcdAssist) throws Exception {
		for (int i = 0; i < rcdMemId.size(); i++) {
			MemberRecordVO memRcd = new MemberRecordVO();
			memRcd.setRcdMatchNo(rcdMatchNo);
			memRcd.setRcdMatchCate(rcdMatchCate);
			memRcd.setRcdMemId(rcdMemId.get(i));
			memRcd.setRcdGoal(rcdGoal.get(i));
			memRcd.setRcdAssist(rcdAssist.get(i));
			recordservice.registMemRcd(memRcd);
		}

		return "redirect:/";
	}

}
