package com.nextit.team.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nextit.member.service.MemberDao;
import com.nextit.member.vo.MemberVO;
import com.nextit.team.service.TeamDao;
import com.nextit.team.service.TeamService;
import com.nextit.team.vo.TeamVO;

@Service
public class TeamServiceImpl implements TeamService {
	@Inject
	TeamDao teamDao;
	

	@Override
	public List<TeamVO> getTeamList() {
		List<TeamVO> teamList = teamDao.getTeamList();
		return teamList;
	}

	@Override
	public TeamVO getTeamInfo(String teamName) {
		TeamVO team = teamDao.getTeamInfo(teamName);
		return team;
	}

	@Override
	public void deleteTeam(String teamName) {
		teamDao.deleteTeam(teamName);
	}


	@Override
	public void quitTeam(String memId) {
		teamDao.quitTeam(memId);
		
	}

	@Override
	public void joinTeam(MemberVO member) {
		teamDao.joinTeam(member);
		
	}
	
	@Override
	public void registTeam(TeamVO team) {
		teamDao.registTeam(team);
	}

}
