package com.gura.spring.cafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.dao.CommentDao;
import com.gura.spring.cafe.dto.CafeDto;
import com.gura.spring.cafe.dto.CommentDto;


@Component
public class CommentServiceImpl implements CommentService{
    
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public void insert(CommentDto dto) {
		commentDao.insert(dto);
	}
	
	@Override
	public int getSequence() {
		int seq = commentDao.getSequence();
		return seq;
	}

	@Override
	public List<CommentDto> getList(int num) {
		
		List<CommentDto> list = commentDao.getList(num);
		
		return list;
	}

	@Override
	public List<CommentDto> getList2() {
		CommentDto dto=new CommentDto();
		List<CommentDto> list = commentDao.getList2(dto);
		
		return list;
	}
}
