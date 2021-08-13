package com.nextit.team.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nextit.member.vo.MemberVO;
import com.nextit.team.vo.TeamVO;

@Mapper
public interface TeamDao {
	public List<TeamVO> getTeamList();
	public TeamVO getTeamInfo(String teamName);
	public void registTeam(TeamVO team);
	public void deleteTeam(String teamName);
	public void quitTeam(String memId);
	public void joinTeam(MemberVO member);
}
