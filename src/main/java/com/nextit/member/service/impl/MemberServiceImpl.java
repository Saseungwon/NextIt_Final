package com.nextit.member.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nextit.exception.BizDuplicateKeyException;
import com.nextit.exception.BizNotEffectedException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.member.service.MemberDao;
import com.nextit.member.service.MemberService;
import com.nextit.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDao memberDao;
	
	@Override
	public MemberVO getMember(String memId) throws BizNotFoundException {
		MemberVO member=memberDao.getMember(memId);
		if(member==null) {
			throw new BizNotFoundException();
		}
		return member;
	}

	@Override
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		MemberVO vo=memberDao.getMember(member.getMemId());
		if(vo==null) {
			throw new BizNotFoundException();
		}
		memberDao.updateMember(member);
		
	}

	@Override
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		MemberVO vo = memberDao.getMember(member.getMemId());
		if(vo==null) {
			throw new BizNotFoundException();
		}
		memberDao.deleteMember(member);
	
	}

	@Override
	public void registMember(MemberVO member) throws BizNotEffectedException, BizDuplicateKeyException {
		MemberVO vo=memberDao.getMember(member.getMemId());
		if(vo!=null) throw new BizDuplicateKeyException();
		memberDao.insertMember(member);
		
	}

	@Override
	public List<MemberVO> getMemList() {
		List<MemberVO> memList = memberDao.getMemList();
		return memList;
	}

	@Override
	public void restoreMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		MemberVO vo = memberDao.getMemberYn(member.getMemId());
		if(vo==null) {
			throw new BizNotFoundException();
		}
		memberDao.restoreMember(member);
		
	}
	
	@Override
	public MemberVO getMemberYn(String memId) throws BizNotFoundException {
		MemberVO member=memberDao.getMemberYn(memId);
		if(member==null) {
			throw new BizNotFoundException();
		}
		return member;
	}

}
