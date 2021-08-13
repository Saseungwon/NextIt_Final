package com.nextit.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.aspectj.lang.annotation.SuppressAjWarnings;

import com.nextit.common.vo.PagingVO;


@SuppressAjWarnings("serial")
public class ReplySearchVO extends PagingVO {
	private int reBoNo;       /* 부모 번호 */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public int getReBoNo() {
		return reBoNo;
	}

	public void setReBoNo(int reBoNo) {
		this.reBoNo = reBoNo;
	}
	

}
