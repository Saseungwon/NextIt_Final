package com.nextit.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nextit.member.vo.MemberVO;

@Mapper
public interface MemberDao {
	public List<MemberVO> getMemList();
	public MemberVO getMember(String memId);
	public void updateMember(MemberVO member);
	public void deleteMember(MemberVO member);
	public void insertMember(MemberVO member);
	public void restoreMember(MemberVO member);
	public String getUserRole(String userId);
	public String findId(Map<String, String> map);
	public String findPass(Map<String, String> map);
	
	public MemberVO getMemberYn(String memId);
	
}
