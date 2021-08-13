package com.nextit.tatics.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class TaticsVO {
	private String ttsMemPos;
	private String ttsMemName;
	private int ttsCnt;
	private int ttsGoal;
	private int ttsAssi;
	private int ttsTotalGoal;
	private String ttsMemImageUrl;
	private int ttsTotalAssi;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	

	
	
	public int getTtsTotalAssi() {
		return ttsTotalAssi;
	}


	public void setTtsTotalAssi(int ttsTotalAssi) {
		this.ttsTotalAssi = ttsTotalAssi;
	}


	public String getTtsMemImageUrl() {
		return ttsMemImageUrl;
	}



	public void setTtsMemImageUrl(String ttsMemImageUrl) {
		this.ttsMemImageUrl = ttsMemImageUrl;
	}



	public String getTtsMemPos() {
		return ttsMemPos;
	}

	public void setTtsMemPos(String ttsMemPos) {
		this.ttsMemPos = ttsMemPos;
	}

	public String getTtsMemName() {
		return ttsMemName;
	}

	public void setTtsMemName(String ttsMemName) {
		this.ttsMemName = ttsMemName;
	}

	public int getTtsCnt() {
		return ttsCnt;
	}

	public void setTtsCnt(int ttsCnt) {
		this.ttsCnt = ttsCnt;
	}

	public int getTtsGoal() {
		return ttsGoal;
	}

	public void setTtsGoal(int ttsGoal) {
		this.ttsGoal = ttsGoal;
	}

	public int getTtsAssi() {
		return ttsAssi;
	}

	public void setTtsAssi(int ttsAssi) {
		this.ttsAssi = ttsAssi;
	}



	public int getTtsTotalGoal() {
		return ttsTotalGoal;
	}



	public void setTtsTotalGoal(int ttsTotalGoal) {
		this.ttsTotalGoal = ttsTotalGoal;
	}
	
	
	

}
