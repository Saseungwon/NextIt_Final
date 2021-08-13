package com.nextit.tatics.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nextit.record.vo.MemberRecordCountVO;
import com.nextit.record.vo.MemberRecordVO;
import com.nextit.tatics.service.TaticsDao;
import com.nextit.tatics.service.TaticsService;
import com.nextit.tatics.vo.TaticsVO;
import com.nextit.team.vo.TeamVO;

@Service
public class TaticsServiceImpl implements TaticsService{
	
	@Inject
	private TaticsDao taticsDao;

	@Override
	public List<MemberRecordVO> getMemRcd(String memId) {
		return null;
	}
	@Override
	public List<MemberRecordCountVO> getMemRcdCount(String memId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public TeamVO getTeamInfo(String teamName) {
		return null;
	}
	@Override
	public List<TaticsVO> getTeamList(String teamName) {
		return taticsDao.getTeamList(teamName);
	}
	
	@Override
	public TaticsVO getHighGoal(String memTeamName) {
		return taticsDao.getHighGoal(memTeamName);
	}
	
	@Override
	public TaticsVO getImage(String memTeamName) {
		
		return taticsDao.getImage(memTeamName);
	}
	
	@Override
	public TaticsVO getHighAssi(String memTeamName) {
		return taticsDao.getHighAssi(memTeamName);
	}
	
}
