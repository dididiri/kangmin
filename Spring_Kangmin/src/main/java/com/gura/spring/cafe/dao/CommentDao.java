package com.gura.spring.cafe.dao;


import com.gura.spring.cafe.dto.CommentDto;

public interface CommentDao {
    
	public void insert(CommentDto dto);
	public int getSequence();
}
