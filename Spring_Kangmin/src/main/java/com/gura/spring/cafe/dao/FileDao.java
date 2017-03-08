package com.gura.spring.cafe.dao;

import java.util.List;

import com.gura.spring.cafe.dto.FileDto;
// FileDaoImpl 클래스가 구현할 인터페이스 정의하기 
public interface FileDao {
	public void insert(FileDto dto);
	
	public List<FileDto> getList();
	public FileDto getData(String writer);
	public List<FileDto> getData2();
}
