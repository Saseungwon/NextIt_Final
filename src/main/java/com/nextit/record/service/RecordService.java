package com.nextit.record.service;

import java.util.List;

import com.nextit.exception.BizDuplicateKeyException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.record.vo.FriendlyRecordVO;
import com.nextit.record.vo.LeagueRecordVO;
import com.nextit.record.vo.MemberRecordCountVO;
import com.nextit.record.vo.MemberRecordVO;

public interface RecordService {
	public List<MemberRecordVO> getMemRcd(String memId) throws BizNotFoundException;

	public List<FriendlyRecordVO> getFrdRcd(String teamName) throws BizNotFoundException;

	public List<LeagueRecordVO> getLeaRcd(String teamName) throws BizNotFoundException;

	public void registMemRcd(MemberRecordVO memRcd) throws BizDuplicateKeyException, BizNotFoundException;

	public void registFrdRcd(FriendlyRecordVO frdRcd) throws BizDuplicateKeyException, BizNotFoundException;

	public void registLeaRcd(LeagueRecordVO leaRcd) throws BizDuplicateKeyException, BizNotFoundException;

	public List<MemberRecordCountVO> getMemRcdCount(String memId) throws BizNotFoundException;
}
