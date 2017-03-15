package com.gura.spring.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.cafe.dto.FileDto;



@Repository
public class FileDaoImpl implements FileDao{
	
	
	@Autowired 
	private SqlSession session;
	
	@Override
	public void insert(FileDto dto) {
		session.insert("file.insert", dto);
	}

	

	@Override
	public List<FileDto> getList() {
		List<FileDto> list=session.selectList("file.getList");
		return list;
	}

	@Override
	public FileDto getData(String writer) {
		return session.selectOne("file.getData", writer);
	}

	@Override
	public List<FileDto> getData2() {
		List<FileDto> list5=session.selectList("file.getData2");
		return list5;
	}

}





