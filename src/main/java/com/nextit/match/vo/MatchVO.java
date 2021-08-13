package com.nextit.match.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MatchVO {
	private String matchName;     /*대회명*/
	private String matchStart;    /*참가 시작일*/
	private String matchEnd;      /*참가 종료일*/
	private String matchImage;    /*대회 이미지*/
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}

	public String getMatchStart() {
		return matchStart;
	}

	public void setMatchStart(String matchStart) {
		this.matchStart = matchStart;
	}

	public String getMatchEnd() {
		return matchEnd;
	}

	public void setMatchEnd(String matchEnd) {
		this.matchEnd = matchEnd;
	}

	public String getMatchImage() {
		return matchImage;
	}

	public void setMatchImage(String matchImage) {
		this.matchImage = matchImage;
	}
	
}
