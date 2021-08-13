package com.nextit.member.service;

import java.util.List;

import com.nextit.exception.BizDuplicateKeyException;
import com.nextit.exception.BizNotEffectedException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.member.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> getMemList();
	public MemberVO getMember(String memId) throws BizNotFoundException;
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException;
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException;
	public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException;
	public void restoreMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException;
	public MemberVO getMemberYn(String memId) throws BizNotFoundException;
}
