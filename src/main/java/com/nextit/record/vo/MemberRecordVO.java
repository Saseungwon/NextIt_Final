package com.nextit.record.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberRecordVO {
	
	private int rcdMatchNo;                 /* 경기번호     */
	private String rcdMatchCate;            /* 경기분류     */
	private String rcdMemId;                /* 아이디       */
	private int rcdGoal;                    /* 골           */
	private int rcdAssist;                  /* 어시         */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public int getRcdMatchNo() {
		return rcdMatchNo;
	}

	public void setRcdMatchNo(int rcdMatchNo) {
		this.rcdMatchNo = rcdMatchNo;
	}

	public String getRcdMemId() {
		return rcdMemId;
	}

	public void setRcdMemId(String rcdMemId) {
		this.rcdMemId = rcdMemId;
	}

	public String getRcdMatchCate() {
		return rcdMatchCate;
	}

	public void setRcdMatchCate(String rcdMatchCate) {
		this.rcdMatchCate = rcdMatchCate;
	}

	public int getRcdGoal() {
		return rcdGoal;
	}

	public void setRcdGoal(int rcdGoal) {
		this.rcdGoal = rcdGoal;
	}

	public int getRcdAssist() {
		return rcdAssist;
	}

	public void setRcdAssist(int rcdAssist) {
		this.rcdAssist = rcdAssist;
	}
	
	
	
	
	
}
