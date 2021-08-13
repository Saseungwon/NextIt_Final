package com.nextit.code.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nextit.code.vo.CodeVO;


public interface CodeService {
	List<CodeVO> getCodeListByParent(String parentCode);
}
