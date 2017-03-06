package com.gura.spring.cafe.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.dto.FileDto;


// FileServiceImpl 클래스가 구현할 인터페이스 정의하기 
public interface FileService {
	public void insert(HttpServletRequest request, FileDto dto);
	public ModelAndView list();
	public void delete(HttpServletRequest request, int num);
	public FileDto getData(String writer);
	public List<FileDto> getData2();
}
