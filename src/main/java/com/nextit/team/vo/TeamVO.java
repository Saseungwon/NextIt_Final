package com.nextit.team.vo;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.nextit.common.valid.RegistType;

public class TeamVO {
	@NotBlank(groups = {Default.class, RegistType.class}, message = "팀 이름은 필수 항목입니다.")
	private String teamName;      /*팀 이름*/
	private String teamImageUrl;  /*팀 엠블럼*/
	private int teamPoint;        /*승점*/
	private String teamLeague;       /*소속리그*/
	private String teamRegDate;   /*팀 등록일*/
	@NotBlank(groups = {Default.class, RegistType.class}, message = "팀 소개는 필수입니다.")
	@Length(max = 100)
	private String teamProfile;   /*팀 소개*/
	private String teamRegion;    /*활동 지역*/
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}


	public String getTeamName() {
		return teamName;
	}


	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}


	public String getTeamImageUrl() {
		return teamImageUrl;
	}


	public void setTeamImageUrl(String teamImageUrl) {
		this.teamImageUrl = teamImageUrl;
	}


	public int getTeamPoint() {
		return teamPoint;
	}


	public void setTeamPoint(int teamPoint) {
		this.teamPoint = teamPoint;
	}


	public String getTeamLeague() {
		return teamLeague;
	}


	public void setTeamLeague(String teamLeague) {
		this.teamLeague = teamLeague;
	}


	public String getTeamRegDate() {
		return teamRegDate;
	}


	public void setTeamRegDate(String teamRegDate) {
		this.teamRegDate = teamRegDate;
	}


	public String getTeamProfile() {
		return teamProfile;
	}


	public void setTeamProfile(String teamProfile) {
		this.teamProfile = teamProfile;
	}


	public String getTeamRegion() {
		return teamRegion;
	}


	public void setTeamRegion(String teamRegion) {
		this.teamRegion = teamRegion;
	}
	
}
