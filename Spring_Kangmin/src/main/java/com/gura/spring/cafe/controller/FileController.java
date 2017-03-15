package com.gura.spring.cafe.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.dto.FileDto;

import com.gura.spring.cafe.service.FileService;

@Controller
public class FileController {

	@Autowired
	private FileService fileService;

	@RequestMapping(value = "cafe/insert2")
	public String insert(HttpServletRequest request, @ModelAttribute FileDto dto) {
		fileService.insert(request, dto);
		dto.getWriter();

		return "redirect:/cafe/list.do?writer=" + dto.getWriter();
	}

	@RequestMapping(value = "cafe/insert3")
	public String insert2(HttpServletRequest request, @ModelAttribute FileDto dto) {
		fileService.insert(request, dto);
		dto.getWriter();

		return "redirect:/cafe/list2.do?writer=" + dto.getWriter();
	}

	@RequestMapping(value = "cafe/form2")
	public String insertform() {

		return "file/insertform";
	}

	@RequestMapping("/file/list")
	public ModelAndView list(@RequestParam String writer) {
		FileDto dto = fileService.getData(writer);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		mView.setViewName("redirect:/cafe/list.do");
		return mView;
	}
}
