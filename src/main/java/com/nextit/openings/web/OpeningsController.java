package com.nextit.openings.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.validation.groups.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nextit.attach.vo.AttachVO;
import com.nextit.board.vo.BoardVO;
import com.nextit.code.service.CodeService;
import com.nextit.code.vo.CodeVO;
import com.nextit.common.util.AttachUtils;
import com.nextit.common.valid.RegistType;
import com.nextit.openings.service.OpeningsService;
import com.nextit.openings.vo.OpeningsSearchVO;

@Controller
public class OpeningsController {
	@Inject
	OpeningsService openingsService;
	@Inject
	CodeService codeService;
	@Inject
	AttachUtils attachUtils;
	
	private Logger logger=LoggerFactory.getLogger(getClass());
	
	@ModelAttribute("posList")
	public List<CodeVO> getPosList() {
		List<CodeVO> posList = codeService.getCodeListByParent("OFFER");
		
		return posList;
	}
	
	@RequestMapping(path = "/openings/offerList.wow")
	public String offerList(@ModelAttribute(name = "search") OpeningsSearchVO searchVO, Model model) {
		List<BoardVO> offerList = openingsService.getOfferList(searchVO);
		model.addAttribute("offerList", offerList);
		
		return "openings/offerList";
	}
	
	@RequestMapping(path = "/openings/searchList.wow")
	public String searchList(@ModelAttribute(name = "search") OpeningsSearchVO searchVO, Model model) {
		List<BoardVO> searchList = openingsService.getSearchList(searchVO);
		model.addAttribute("searchList", searchList);
		
		return "openings/searchList";
	}
	
	@RequestMapping(path = "/openings/openingsView.wow")
	public String openingsView(@RequestParam int boNo, Model model) {
		BoardVO openings = openingsService.getOpenings(boNo);
		model.addAttribute("openings", openings);
		
		return "openings/openingsView";
	}
	
	@RequestMapping(path = "/openings/openingsForm.wow")
	public String openingsForm(@ModelAttribute("board")BoardVO board) {
		return "openings/openingsForm";
	}
	
	@RequestMapping(path = "/openings/openingsRegist.wow")
	public String openingsRegist(@Validated(value = {Default.class, RegistType.class})BoardVO board
			, BindingResult error
			, @RequestParam(name = "boFiles") MultipartFile[] boFiles) throws IOException {
		if (error.hasErrors()) {
			return "openings/openingsForm";
		}
		
		if (boFiles != null) {
			List<AttachVO> attaches = attachUtils.getAttachListByMultiparts(boFiles, "openings/");
			board.setAttaches(attaches);
		}
		
		openingsService.registOpenings(board);
		
		if (board.getBoSubCate().equals("OFFER")) {
			return "redirect:/openings/offerList.wow";
		}
		
		return "redirect:/openings/searchList.wow";
	}
}
