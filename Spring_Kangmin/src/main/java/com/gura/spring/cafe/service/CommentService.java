package com.gura.spring.cafe.service;



import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.dto.CommentDto;

public interface CommentService {
    
	public void insert(CommentDto dto);
	public int getSequence();
	public List<CommentDto> getList(int num);
}
