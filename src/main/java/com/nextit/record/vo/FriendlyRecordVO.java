package com.nextit.record.vo;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.nextit.common.valid.RegistType;

public class FriendlyRecordVO {
	
	private int fndScore;                   /* 점수         */
	private int fndMatchNo;                 /* 친선경기번호 */
	@NotBlank(message = "팀이름 필수", groups = {RegistType.class})
	private String fndTeamName;             /* 팀이름       */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public int getFndScore() {
		return fndScore;
	}
	public void setFndScore(int fndScore) {
		this.fndScore = fndScore;
	}
	public int getFndMatchNo() {
		return fndMatchNo;
	}
	public void setFndMatchNo(int fndMatchNo) {
		this.fndMatchNo = fndMatchNo;
	}
	public String getFndTeamName() {
		return fndTeamName;
	}
	public void setFndTeamName(String fndTeamName) {
		this.fndTeamName = fndTeamName;
	}

	
	
}
