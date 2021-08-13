package com.nextit.login.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nextit.exception.BizNotFoundException;
import com.nextit.exception.BizPasswordNotMatchedException;
import com.nextit.login.service.LoginService;
import com.nextit.member.service.MemberDao;
import com.nextit.member.service.MemberService;
import com.nextit.member.vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {
	@Inject
	MemberDao memberDao;
	@Inject
	MemberService memberService;

	@Override
	public MemberVO loginCheck(String id, String pw) throws BizNotFoundException, BizPasswordNotMatchedException {
		MemberVO member = memberDao.getMember(id);
		if(member==null) {
			throw new BizNotFoundException("id가 일치하는 member 없음.");
		} else {
			if (pw.equals(member.getMemPass())) {
				return member;
			} else {
				throw new BizPasswordNotMatchedException();
			}
		}
	}

	@Override
	public String findId(String name, String mail) throws BizNotFoundException {
		Map<String, String> map = new HashMap<String, String>();
//		System.out.println(mail);
		map.put("memName", name);
		map.put("memMail", mail);
//		System.out.println(map);
		String searchId = memberDao.findId(map);
//		System.out.println(searchId);
		String msg = "";
		if(searchId == null) {
			msg = "일치하는 회원이 없습니다. 회원명과 메일을 확인해주세요. ";
		}else {
			msg = name + "님의 아이디는 '" + searchId + "'입니다.";
		}
		return msg;
	}

	@Override
	public String findPass(String id, String mail) throws BizNotFoundException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", id);
		map.put("memMail", mail);
		String findPass = memberDao.findPass(map);
		
		return findPass;
	}
	
	@Override
	public void sessionRefresh(HttpServletRequest req) throws BizNotFoundException {
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("MEM_INFO");
		String id = member.getMemId();
		member = memberService.getMember(id);
		session.setAttribute("MEM_INFO", member);

	}

}
