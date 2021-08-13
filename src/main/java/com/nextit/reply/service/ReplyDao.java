package com.nextit.reply.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nextit.reply.vo.ReplySearchVO;
import com.nextit.reply.vo.ReplyVO;

@Mapper
public interface ReplyDao {
	public int getReplyCountByParent(ReplySearchVO searchVO);
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO);
	public ReplyVO getReply(int reNo);
	public int insertReply(ReplyVO reply);
	public int updateReply(ReplyVO reply);
	public int deleteReply(ReplyVO reply);
}
