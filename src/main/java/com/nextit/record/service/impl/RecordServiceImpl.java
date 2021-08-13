package com.nextit.record.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nextit.exception.BizDuplicateKeyException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.record.service.RecordDao;
import com.nextit.record.service.RecordService;
import com.nextit.record.vo.FriendlyRecordVO;
import com.nextit.record.vo.LeagueRecordVO;
import com.nextit.record.vo.MemberRecordCountVO;
import com.nextit.record.vo.MemberRecordVO;

@Service
public class RecordServiceImpl implements RecordService {

	@Inject
	RecordDao recordDao;
	
	
	@Override
	public List<MemberRecordVO> getMemRcd(String memId) throws BizNotFoundException {
		List<MemberRecordVO> memRcd = recordDao.getMemRcd(memId);
		if(memRcd==null) {
			throw new BizNotFoundException();
		}
		return memRcd;
	}

	@Override
	public List<FriendlyRecordVO> getFrdRcd(String teamName) throws BizNotFoundException {
		List<FriendlyRecordVO> frdRcd = recordDao.getFrdRcd(teamName);
		if(frdRcd==null) {
			throw new BizNotFoundException();
		}
		return frdRcd;
	}

	@Override
	public List<LeagueRecordVO> getLeaRcd(String teamName) throws BizNotFoundException {
		List<LeagueRecordVO> leagueRcd = recordDao.getLeaRcd(teamName);
		if(leagueRcd==null) {
			throw new BizNotFoundException();
		}
		return leagueRcd;
	}

	@Override
	public void registMemRcd(MemberRecordVO memRcd) throws BizDuplicateKeyException, BizNotFoundException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rcdMemId",memRcd.getRcdMemId());
		map.put("rcdMatchNo",memRcd.getRcdMatchNo());
		map.put("rcdMatchCate",memRcd.getRcdMatchCate());
		MemberRecordVO vo = recordDao.checkMemRcd(map);
		if(vo!=null) throw new BizDuplicateKeyException();
		recordDao.insertMemRcd(memRcd);
		
	}

	@Override
	public void registFrdRcd(FriendlyRecordVO frdRcd) throws BizDuplicateKeyException, BizNotFoundException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fndTeamName", frdRcd.getFndTeamName());
		map.put("fndMatchNo",frdRcd.getFndMatchNo());
		FriendlyRecordVO vo = recordDao.checkFrdRcd(map);
		if(vo!=null) throw new BizDuplicateKeyException();
		recordDao.insertFrdRcd(frdRcd);
		
	}

	@Override
	public void registLeaRcd(LeagueRecordVO leaRcd) throws BizDuplicateKeyException, BizNotFoundException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("leaTeamName", leaRcd.getLeaTeamName());
		map.put("leaMatchNo",leaRcd.getLeaMatchNo());
		LeagueRecordVO vo = recordDao.checkLeaRcd(map);
		if(vo!=null) throw new BizDuplicateKeyException();
		recordDao.insertLeaRcd(leaRcd);
		
	}

	@Override
	public List<MemberRecordCountVO> getMemRcdCount(String memId) throws BizNotFoundException {
		List<MemberRecordCountVO> memRcdCount = recordDao.getRecordCount(memId);
		if(memRcdCount==null) {
			throw new BizNotFoundException();
		}
		return memRcdCount;
	}

	
}
