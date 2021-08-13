package com.nextit.record.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nextit.record.vo.FriendlyRecordVO;
import com.nextit.record.vo.LeagueRecordVO;
import com.nextit.record.vo.MemberRecordCountVO;
import com.nextit.record.vo.MemberRecordVO;

@Mapper
public interface RecordDao {
	public List<MemberRecordVO> getMemRcd(String memId);
	public List<FriendlyRecordVO> getFrdRcd(String teamName);
	public List<LeagueRecordVO> getLeaRcd(String teamName);
	
//	public List<FriendlyRecordVO> getFrdRcdList(String teamName);
//	public List<LeagueRecordVO> getLeagueRcdList(String teamName);
	
	public void insertMemRcd(MemberRecordVO memRcd);
	public void insertFrdRcd(FriendlyRecordVO frdRcd);
	public void insertLeaRcd(LeagueRecordVO leagueRcd);
	
	public MemberRecordVO checkMemRcd(Map<String, Object> map);
	public FriendlyRecordVO checkFrdRcd(Map<String, Object> map);
	public LeagueRecordVO checkLeaRcd(Map<String, Object> map);
	
	public List<MemberRecordCountVO> getRecordCount(String memId);
	
}
