package com.nextit.code.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class CodeVO {

	private String cateName;                /*분류명*/
	private String cateHrchy;               /*분류 계층*/
	private String cateKname;               /*분류 한글명*/
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateHrchy() {
		return cateHrchy;
	}
	public void setCateHrchy(String cateHrchy) {
		this.cateHrchy = cateHrchy;
	}
	public String getCateKname() {
		return cateKname;
	}
	public void setCateKname(String cateKname) {
		this.cateKname = cateKname;
	}
	
	
	
}
