package com.nextit.record.vo;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.nextit.common.valid.RegistType;

public class LeagueRecordVO {
	
	private int leaMatchNo;                 /* 리그경기번호 */
	@NotBlank(message = "팀 이름 필수", groups = {RegistType.class})
	private String leaTeamName;             /* 팀 이름      */
	@NotBlank(message = "점수 필수", groups = {RegistType.class})
	private int leaScore;                   /* 점수         */
	@NotBlank(message = "소속리그 필수", groups = {RegistType.class})
	private String leaNo;                      /* N부리그      */
	@NotBlank(message = "분기 필수", groups = {RegistType.class})
	private String leaQuarter;              /* 분기         */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public int getLeaMatchNo() {
		return leaMatchNo;
	}
	public void setLeaMatchNo(int leaMatchNo) {
		this.leaMatchNo = leaMatchNo;
	}
	public String getLeaTeamName() {
		return leaTeamName;
	}
	public void setLeaTeamName(String leaTeamName) {
		this.leaTeamName = leaTeamName;
	}
	public int getLeaScore() {
		return leaScore;
	}
	public void setLeaScore(int leaScore) {
		this.leaScore = leaScore;
	}
	public String getLeaNo() {
		return leaNo;
	}
	public void setLeaNo(String leaNo) {
		this.leaNo = leaNo;
	}
	public String getLeaQuarter() {
		return leaQuarter;
	}
	public void setLeaQuarter(String leaQuarter) {
		this.leaQuarter = leaQuarter;
	}
	
	
}
