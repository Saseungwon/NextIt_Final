package com.nextit.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nextit.exception.BizAccessFailException;
import com.nextit.exception.BizNotFoundException;
import com.nextit.member.vo.MemberVO;
import com.nextit.reply.service.ReplyService;
import com.nextit.reply.vo.ReplySearchVO;
import com.nextit.reply.vo.ReplyVO;

@Controller
public class ReplyController {
	@Inject
	ReplyService replyService;
	
	@RequestMapping(value = "/reply/replyList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> replyList(ReplySearchVO searchVO) throws Exception {
		List<ReplyVO> list = replyService.getReplyListByParent(searchVO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		map.put("count", list.size());
		return map;
	}

	// @PostMapping ("/reply/replyRegist")
	@RequestMapping(value = "/reply/replyRegist", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyRegist(ReplyVO reply, HttpServletRequest req, HttpSession session)
			throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("MEM_INFO"); 
		reply.setReMemId(member.getMemId());
		replyService.registReply(reply);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("msg", "정상 등록 되었습니다.");
		return map;
	}

	@RequestMapping(value = "/reply/replyModify" , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyModify(ReplyVO reply, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("MEM_INFO"); 
		reply.setReMemId(member.getMemId());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			replyService.modifyReply(reply);
			map.put("result", true);
			map.put("msg", "수정 되었습니다.");	
			return map;
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "글이 존재하지 않습니다.");
			return map;
		} catch (BizAccessFailException e) {
			map.put("result", false);
			map.put("msg", "접근에 실패했습니다.");
			return map;
		}
	}
	
	@RequestMapping(value = "/reply/replyDelete")
	@ResponseBody
	public Map<String, Object> replyDelete(ReplyVO reply, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("MEM_INFO"); 
		reply.setReMemId(member.getMemId());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			replyService.removeReply(reply);
			map.put("result", true);
			map.put("msg", "삭제 되었습니다.");
			return map;
		} catch (BizNotFoundException e) {
			map.put("result", false);
			map.put("msg", "글이 존재하지 않습니다.");
			return map;
		} catch (BizAccessFailException e) {
			map.put("result", false);
			map.put("msg", "접근에 실패했습니다.");
			return map;
		}
	}
}
