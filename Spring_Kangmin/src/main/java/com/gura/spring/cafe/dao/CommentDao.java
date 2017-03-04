package com.gura.spring.cafe.dao;


import java.util.List;

import com.gura.spring.cafe.dto.CommentDto;


public interface CommentDao {
    
	public void insert(CommentDto dto);
	public int getSequence();
	public List<CommentDto> getList(int num);
	public List<CommentDto> getList2(CommentDto dto);
}
