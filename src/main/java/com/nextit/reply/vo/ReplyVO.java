package com.nextit.reply.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ReplyVO implements Serializable{
	
	private int reNo;                       /*댓글번호*/
	private int reParentNo;                 /*상위 댓글번호*/
	private String reWriter;                /*작성자*/
	private String reContent;               /*내용*/
	private String reRegDate;               /*작성일*/
	private String reModDate;               /*수정일*/
	private int reLike;                     /*추천수*/
	private String reDelYn;                 /*삭제여부*/
	private String reMemId;                 /*아이디*/
	private int reBoNo;                     /*글 번호*/
	
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public int getReParentNo() {
		return reParentNo;
	}
	public void setReParentNo(int reParentNo) {
		this.reParentNo = reParentNo;
	}
	public String getReWriter() {
		return reWriter;
	}
	public void setReWriter(String reWriter) {
		this.reWriter = reWriter;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReRegDate() {
		return reRegDate;
	}
	public void setReRegDate(String reRegDate) {
		this.reRegDate = reRegDate;
	}
	public String getReModDate() {
		return reModDate;
	}
	public void setReModDate(String reModDate) {
		this.reModDate = reModDate;
	}
	public int getReLike() {
		return reLike;
	}
	public void setReLike(int reLike) {
		this.reLike = reLike;
	}
	public String getReDelYn() {
		return reDelYn;
	}
	public void setReDelYn(String reDelYn) {
		this.reDelYn = reDelYn;
	}
	public String getReMemId() {
		return reMemId;
	}
	public void setReMemId(String reMemId) {
		this.reMemId = reMemId;
	}
	public int getReBoNo() {
		return reBoNo;
	}
	public void setReBoNo(int reBoNo) {
		this.reBoNo = reBoNo;
	}
	
	
	
}
