package com.nextit.tatics.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nextit.record.vo.MemberRecordCountVO;
import com.nextit.record.vo.MemberRecordVO;
import com.nextit.tatics.vo.TaticsVO;
import com.nextit.team.vo.TeamVO;

@Mapper
public interface TaticsDao {
	public List<TaticsVO> getTeamList(String teamName) ;
	public TeamVO getTeamInfo(String teamName);
	
	public List<MemberRecordVO> getMemRcd(String memId);
	public List<MemberRecordCountVO> getMemRcdCount(String memId);
	public TaticsVO getHighGoal(String memTeamName);
	public TaticsVO getImage(String memTeamName);
	public TaticsVO getHighAssi(String memTeamName); 
}
