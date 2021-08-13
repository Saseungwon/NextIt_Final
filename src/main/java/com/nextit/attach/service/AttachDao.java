package com.nextit.attach.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nextit.attach.vo.AttachVO;

@Mapper
public interface AttachDao {
	public void registAttaches(AttachVO attach);
	public void deleteAttach(int atchNo);
	public void deleteAttaches(int[] atchNos);
	public AttachVO getAttach(int atchNo);
	public List<AttachVO> getAttachByParentNoList(@Param("category")String category, @Param("parentNo")int parentNo);
	public int increaseDownHit(int atchNo);
}
