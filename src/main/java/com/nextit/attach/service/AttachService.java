package com.nextit.attach.service;

import com.nextit.attach.vo.AttachVO;
import com.nextit.exception.BizException;

public interface AttachService {
	public AttachVO getAttach(int atchNo) throws BizException;
	public void increaseDownHit(int atchNo) throws BizException;
}
