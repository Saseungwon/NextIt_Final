package com.nextit.team.service;

import java.util.List;

import com.nextit.member.vo.MemberVO;
import com.nextit.team.vo.TeamVO;

public interface TeamService {
	public List<TeamVO> getTeamList();
	public TeamVO getTeamInfo(String teamName);
	public void registTeam(TeamVO team);
	public void deleteTeam(String teamName);
	public void quitTeam(String memId);
	public void joinTeam(MemberVO member);

}
