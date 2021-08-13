package com.nextit.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nextit.exception.BizNotFoundException;
import com.nextit.exception.BizPasswordNotMatchedException;
import com.nextit.member.vo.MemberVO;

public interface LoginService {
	public MemberVO loginCheck(String id, String pw) throws BizNotFoundException, BizPasswordNotMatchedException;
	public String findId(String name, String mail) throws BizNotFoundException;
	public String findPass(String id, String mail) throws BizNotFoundException; 
	public void sessionRefresh(HttpServletRequest req) throws BizNotFoundException;
}
