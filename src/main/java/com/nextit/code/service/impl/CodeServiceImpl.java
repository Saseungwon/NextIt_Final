package com.nextit.code.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nextit.code.service.CodeDao;
import com.nextit.code.service.CodeService;
import com.nextit.code.vo.CodeVO;

@Service
public class CodeServiceImpl implements CodeService {

	@Inject
	CodeDao codeDao; 
	
	@Override
	public List<CodeVO> getCodeListByParent(String parentCode) {
		List<CodeVO> codeList = codeDao.getCodeListByParent(parentCode);
		return codeList;
	
	}
}
