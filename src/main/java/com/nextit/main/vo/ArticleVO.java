package com.nextit.main.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ArticleVO {
	private int atcNo;            /*기사 번호*/
	private String atcImg;        /*기사 이미지 주소*/
	private String atcTitle;      /*기사 제목*/
	private String atcSource;     /*기사 출처*/
	private String atcDate;       /*기사 날짜*/
	private String atcLink;       /*기사 링크*/
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public int getAtcNo() {
		return atcNo;
	}

	public void setAtcNo(int atcNo) {
		this.atcNo = atcNo;
	}

	public String getAtcImg() {
		return atcImg;
	}

	public void setAtcImg(String atcImg) {
		this.atcImg = atcImg;
	}

	public String getAtcTitle() {
		return atcTitle;
	}

	public void setAtcTitle(String atcTitle) {
		this.atcTitle = atcTitle;
	}

	public String getAtcSource() {
		return atcSource;
	}

	public void setAtcSource(String atcSource) {
		this.atcSource = atcSource;
	}

	public String getAtcDate() {
		return atcDate;
	}

	public void setAtcDate(String atcDate) {
		this.atcDate = atcDate;
	}

	public String getAtcLink() {
		return atcLink;
	}

	public void setAtcLink(String atcLink) {
		this.atcLink = atcLink;
	}
	
}
