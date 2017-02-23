package com.gura.spring.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.gura.spring.cafe.dao.CommentDao;

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
}
