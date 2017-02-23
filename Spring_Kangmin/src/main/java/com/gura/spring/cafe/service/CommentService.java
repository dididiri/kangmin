package com.gura.spring.cafe.service;

import com.gura.spring.cafe.dto.CommentDto;

public interface CommentService {
    
	public void insert(CommentDto dto);
	public int getSequence();
}
