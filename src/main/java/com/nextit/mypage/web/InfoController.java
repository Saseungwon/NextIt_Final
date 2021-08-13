package com.nextit.mypage.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nextit.common.valid.ModifyType;
import com.nextit.common.vo.ResultMessageVO;
import com.nextit.exception.BizNotEffectedException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.member.service.MemberService;
import com.nextit.member.vo.MemberVO;

@Controller
public class InfoController {

	@Inject
	MemberService memberService;

//	private Logger logger=LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/mypage/info.wow", method = RequestMethod.POST)
	public String info(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO) session.getAttribute("MEM_INFO");
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		if (user == null) {
			return "login/login";
		} else {
			try {
				MemberVO member = memberService.getMember(user.getMemId());
				req.setAttribute("member", member);

				return "mypage/info";
			} catch (BizNotFoundException e) {
				resultMessageVO.setResult(false);
				resultMessageVO.setTitle("regist");
				resultMessageVO.setMessage("해당 멤버를 찾을 수 없습니다.");
				resultMessageVO.setUrl("memberList.wow");
				resultMessageVO.setUrlTitle("목록으로");

				req.setAttribute("resultMessageVO", resultMessageVO);

				return "common/message";
			}
		}

	}

	@RequestMapping(value = "/mypage/edit.wow", method = RequestMethod.POST)
	public String edit(@ModelAttribute("member") MemberVO member, BindingResult error) {
		if (error.hasErrors()) {
			return "mypage/info";
		}
		return "mypage/edit";
	}

	@RequestMapping(value = "/mypage/modify.wow", method = RequestMethod.POST)
	public String modify(@ModelAttribute("member") @Validated({ ModifyType.class }) MemberVO member,
			BindingResult error) {
		if (error.hasErrors()) {
			return "mypage/edit";
		}
//		logger.info("MemberVO={}", member);
		ResultMessageVO resultMessageVO = new ResultMessageVO();
		try {
			memberService.modifyMember(member);

			resultMessageVO.setResult(true);
			resultMessageVO.setTitle("modify");
			resultMessageVO.setMessage("정상적으로 수정했습니다.");
			resultMessageVO.setUrl("info.wow");
			resultMessageVO.setUrlTitle("내 정보");
//			model.addAttribute("resultMessageVO", resultMessageVO);

		} catch (BizNotFoundException bizNotFoundException) {

			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("modify");
			resultMessageVO.setMessage("해당 멤버를 찾을 수 없습니다.");
			resultMessageVO.setUrl("info.wow");
			resultMessageVO.setUrlTitle("내 정보");
//			model.addAttribute("resultMessageVO", resultMessageVO);

		} catch (BizNotEffectedException bizNotEffectedException) {

			resultMessageVO.setResult(false);
			resultMessageVO.setTitle("modify");
			resultMessageVO.setMessage("수정 실패");
			resultMessageVO.setUrl("info.wow");
			resultMessageVO.setUrlTitle("내 정보");
//			model.addAttribute("resultMessageVO", resultMessageVO);

		}

		return "mypage/info";
	}

}
