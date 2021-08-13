package com.nextit.login.web;

import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nextit.common.util.CookieUtils;
import com.nextit.exception.BizNotFoundException;
import com.nextit.exception.BizPasswordNotMatchedException;
import com.nextit.login.service.LoginService;
import com.nextit.member.service.MailSendService;
import com.nextit.member.service.MemberService;
import com.nextit.member.vo.MemberVO;

@Controller
public class LoginController {
	@Inject
	LoginService loginService;
	@Inject
	MemberService memberService;
	@Inject
	MailSendService mailSendService;

	private Logger logger = LoggerFactory.getLogger(getClass());

	@GetMapping("/login/login.wow")
	public String getLogin() throws Exception {
		return "login/login";
	}
	
	@PostMapping("/login/login.wow")
	public String postLogin(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam(value = "userId", required = false) String id,
			@RequestParam(value = "userPass", required = false) String pw,
			@RequestParam(value = "rememberMe", required = false) String save_id, Model model) throws Exception {
		logger.info("id = " + id + ", pw = " + pw + ", save_id = " + save_id);
		if ((id == null || id.isEmpty()) || (pw == null || pw.isEmpty())) {
			return "redirect:/login/login.wow?msg=" + URLEncoder.encode("입력안함", "utf-8");
		}

		try {
			MemberVO member = loginService.loginCheck(id, pw);
			HttpSession session = req.getSession();

			if (save_id == null) {
				CookieUtils cookieUtils = new CookieUtils(req);
				if (cookieUtils.exists("SAVE_ID")) {
					Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, "/", 0);
					resp.addCookie(cookie);
				}
				save_id = "";
			}
			if (save_id.equals("Y")) {
				resp.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
			}
			CookieUtils cookieUtils = new CookieUtils(req);
			if (cookieUtils.exists("SAVE_ID")) {
				session.setAttribute("checked", "checked");
				session.setAttribute("id", cookieUtils.getValue("SAVE_ID"));
			}
			session.setAttribute("MEM_INFO", member);
			session.setMaxInactiveInterval(1800);

			return "redirect:/main.wow";
		} catch (BizNotFoundException e) {
			return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비번 확인", "utf-8");
		} catch (BizPasswordNotMatchedException e) {
			return "redirect:/login/login.wow?msg=" + URLEncoder.encode("아이디 또는 비번 확인", "utf-8");
		}
	}

	@RequestMapping("/login/logout.wow")
	public String getLogout(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		session.removeAttribute("MEM_INFO");

		return "redirect:/";
	}

	

	@RequestMapping(value = "/login/find.wow", method = RequestMethod.GET)
	public String find() throws Exception {

		return "login/find";
	}

	@RequestMapping(value = "login/find.wow", method = RequestMethod.POST )
	public String find(@RequestParam(value="memId", required = false)String id,
			@RequestParam(value="memName", required = false)String name,
			@RequestParam(value="memMail", required = false)String mail, Model model) throws Exception{
//		System.out.println(mail);
		System.out.println(id +", "+ name + ", " + mail);
		if(id == null) {
			String msg = loginService.findId(name, mail);
			System.out.println(msg);
			model.addAttribute("msg", msg); 
			model.addAttribute("url", "/"); 			
			return "login/result"; 
		}else if(name == null) {
			String pass = loginService.findPass(id, mail);
			String msg = "";
			if(pass== null) {
				msg = "일치하는 회원이 없습니다. 아이디와 메일을 확인해주세요.";
			}else {
				mailSendService.sendPass(mail, pass, "localhost", 8080);
				msg = mail + "로 비밀번호를 전송하였습니다.";
			}
			
			model.addAttribute("msg", msg); 
			model.addAttribute("url", "/"); 			
			return "login/result"; 
		}
		
		return "redirect:/";
	}

}
