package com.nextit.record.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberRecordCountVO {
	
	
	private String matchCate;
	private int totalMatch;
	private int totalGoal;
	private int totalAssist;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public int getTotalMatch() {
		return totalMatch;
	}

	public void setTotalMatch(int totalMatch) {
		this.totalMatch = totalMatch;
	}

	public int getTotalGoal() {
		return totalGoal;
	}

	public void setTotalGoal(int totalGoal) {
		this.totalGoal = totalGoal;
	}

	public int getTotalAssist() {
		return totalAssist;
	}

	public void setTotalAssist(int totalAssist) {
		this.totalAssist = totalAssist;
	}

	public String getMatchCate() {
		return matchCate;
	}

	public void setMatchCate(String matchCate) {
		this.matchCate = matchCate;
	}
	
	
	
}
