package com.nextit.member.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.groups.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nextit.common.valid.RegistType;
import com.nextit.exception.BizDuplicateKeyException;
import com.nextit.exception.BizNotEffectedException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.member.service.MailSendService;
import com.nextit.member.service.MemberService;
import com.nextit.member.vo.MemberVO;

@Controller
public class MemberController {
	@Inject
	MemberService memberService;
	@Inject
	MailSendService mailSendService;
	
	private Logger logger=LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/join/join.wow")
	public String join(@ModelAttribute("memberVO") MemberVO memberVO) {
		
		return "join/join";
	}

	@RequestMapping(value = "/join/regist.wow", method = RequestMethod.POST)
	public String memberRegist(@ModelAttribute("memberVO")@Validated({Default.class, RegistType.class})  MemberVO member,BindingResult error) {
//		System.out.println("ddd");
		if (error.hasErrors()) {
			return "join/join";
		}
		
		try {
			memberService.registMember(member);
		} catch (BizNotEffectedException | BizDuplicateKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/login/login.wow";
	}
	
	@RequestMapping(value = "/join/idck.wow", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String idCk(MemberVO member) {
		logger.info("member = {}", member);
		try {
			memberService.getMember(member.getMemId());
			return "isExist";
		} catch (BizNotFoundException e) {			
			return "isNotExist";
		}
	}
	
	@RequestMapping(value = "/join/email.wow", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String email(@RequestParam("email")String email, HttpServletRequest req) {
		logger.info("email = " + email);
		return mailSendService.sendAuthMail(email, req.getServerName(), req.getServerPort());
	}
}
