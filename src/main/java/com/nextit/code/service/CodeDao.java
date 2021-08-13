package com.nextit.code.service;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.nextit.code.vo.CodeVO;

@Mapper
public interface CodeDao {

	public List<CodeVO> getCodeListByParent(String parentCode);
}

