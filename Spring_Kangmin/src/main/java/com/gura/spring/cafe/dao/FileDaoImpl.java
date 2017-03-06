package com.gura.spring.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.cafe.dto.FileDto;



@Repository //Dao 를 bean 으로 만들때 사용하는 어노테이션 
public class FileDaoImpl implements FileDao{
	
	//의존객체
	@Autowired //의존객체 주입 받는 어노테이션 
	private SqlSession session;
	
	@Override
	public void insert(FileDto dto) {
		//업로드된 파일의 정보를 DB 에 저장하기 
		session.insert("file.insert", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("file.delete", num);
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





