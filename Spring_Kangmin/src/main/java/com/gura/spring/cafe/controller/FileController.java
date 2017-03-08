package com.gura.spring.cafe.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.dto.FileDto;
import com.gura.spring.cafe.service.CafeService;
import com.gura.spring.cafe.service.FileService;



@Controller //요청 처리를 하는 컨트롤러를 만들기 위한 어노테이션 (bean)
public class FileController {
	
	@Autowired //의존 객체를 주입 받기위한 어노 테이션 
	private FileService fileService;
	
	
	
	
	
	
	
	
	
	// /file/insert.do 요청 처리 
	@RequestMapping(value="cafe/insert2")
	public String insert(HttpServletRequest request,@ModelAttribute FileDto dto){
		fileService.insert(request, dto);
		dto.getWriter();
		//리다일렉트 이동 
		return "redirect:/cafe/list.do?writer="+dto.getWriter();
	}
	
	@RequestMapping(value="cafe/insert3")
	public String insert2(HttpServletRequest request,@ModelAttribute FileDto dto){
		fileService.insert(request, dto);
		dto.getWriter();
		//리다일렉트 이동 
		return "redirect:/cafe/list2.do?writer="+dto.getWriter();
	}
	
	// /file/insertform.do 요청 처리
	@RequestMapping(value="cafe/form2")
	public String insertform(){
		// /WEB-INF/views/file/insertform.jsp 로 forward 이동
		return "file/insertform";
	}
	
	// /file/list.do 요청 처리 
	@RequestMapping("/file/list")
	public ModelAndView list(@RequestParam String writer){
		FileDto dto=fileService.getData(writer);
		//글목록이 담겨 있는 ModelAndView 객체를 리턴 받는다.
		ModelAndView mView=new ModelAndView();
		
		
		mView.addObject("dto", dto);
		mView.setViewName("redirect:/cafe/list.do");
		return mView;
	}
}







