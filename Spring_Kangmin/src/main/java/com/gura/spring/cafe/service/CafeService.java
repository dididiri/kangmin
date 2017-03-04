package com.gura.spring.cafe.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.dto.CafeDto;

public interface CafeService {
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	public List<CafeDto> getList2(String writer);
	public void insert(CafeDto dto);
	public ModelAndView getData(int num);
	public List<CafeDto> getData2();
	public void update(CafeDto dto);
	public void delete(int num);
	public ModelAndView updateForm(int num);
}
