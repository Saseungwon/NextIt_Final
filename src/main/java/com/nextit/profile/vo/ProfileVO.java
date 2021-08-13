package com.nextit.profile.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ProfileVO {
	private String pfCate;        /*선수, 팀 분류*/
	private String pfParent;      /*아이디 혹은 팀이름*/
	private String pfDelYn;       /*파일 삭제 여부*/
	
	private String pfPath;      /*이미지 경로*/
	
	public String getPfPath() {
		return pfPath;
	}


	public void setPfPath(String pfPath) {
		this.pfPath = pfPath;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}


	public String getPfCate() {
		return pfCate;
	}


	public void setPfCate(String pfCate) {
		this.pfCate = pfCate;
	}


	public String getPfParent() {
		return pfParent;
	}


	public void setPfParent(String pfParent) {
		this.pfParent = pfParent;
	}


	public String getPfDelYn() {
		return pfDelYn;
	}


	public void setPfDelYn(String pfDelYn) {
		this.pfDelYn = pfDelYn;
	}

}
