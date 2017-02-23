package com.gura.spring.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.cafe.dto.CommentDto;


@Repository
public class CommentDaoImpl implements CommentDao{
    
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(CommentDto dto) {
		session.insert("Comment.insert", dto);
		
	}

	@Override
	public int getSequence() {
		int seq = session.selectOne("Comment.getSequence");
		return seq;
	}

	@Override
	public List<CommentDto> getList(int num) {
		List<CommentDto> list = session.selectList("Comment.getList", num);
		return list;
		
	}

}
