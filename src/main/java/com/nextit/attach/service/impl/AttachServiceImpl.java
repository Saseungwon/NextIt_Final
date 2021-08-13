package com.nextit.attach.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nextit.attach.service.AttachDao;
import com.nextit.attach.service.AttachService;
import com.nextit.attach.vo.AttachVO;
import com.nextit.exception.BizException;
import com.nextit.exception.BizNotFoundException;

@Service
public class AttachServiceImpl implements AttachService {
	@Inject
	private AttachDao attachDao;

	@Override
	public AttachVO getAttach(int atchNo) throws BizException {
		AttachVO vo = attachDao.getAttach(atchNo);
		if (vo == null) {
			throw new BizNotFoundException("첨부파일 [" + atchNo + "]에 대한 조회 실패");
		}
		return vo;
	}

	@Override
	public void increaseDownHit(int atchNo) throws BizException {
		attachDao.increaseDownHit(atchNo);
	}
}
