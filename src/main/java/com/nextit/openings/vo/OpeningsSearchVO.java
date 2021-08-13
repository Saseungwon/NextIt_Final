package com.nextit.openings.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.nextit.common.vo.PagingVO;

@SuppressWarnings("serial")
public class OpeningsSearchVO extends PagingVO {
	private String posCate = "";
	private String searchCate;
	private String searchWord = "";
	private String searchBoCate;
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	public String getSearchBoCate() {
		return searchBoCate;
	}

	public void setSearchBoCate(String searchBoCate) {
		this.searchBoCate = searchBoCate;
	}

	public String getPosCate() {
		return posCate;
	}

	public void setPosCate(String posCate) {
		this.posCate = posCate;
	}

	public String getSearchCate() {
		return searchCate;
	}

	public void setSearchCate(String searchCate) {
		this.searchCate = searchCate;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

}
