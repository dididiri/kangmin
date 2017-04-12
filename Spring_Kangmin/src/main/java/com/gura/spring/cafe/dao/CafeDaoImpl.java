package com.gura.spring.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.cafe.dto.CafeDto;

@Repository
public class CafeDaoImpl implements CafeDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CafeDto> getList(CafeDto dto) {
		List<CafeDto> list=session.selectList("cafe.getList", dto);
		return list;
	}
	@Override
	public List<CafeDto> getList2(String writer) {
		List<CafeDto> list2=session.selectList("cafe.getList2",writer);
		return list2;
	}

	@Override
	public void insert(CafeDto dto) {
		session.insert("cafe.insert", dto);
	}

	@Override
	public CafeDto getData(int num) {
		CafeDto dto=session.selectOne("cafe.getData", num);
		return dto;
	}
	@Override
	public List<CafeDto> getData2(CafeDto dto) {
		
		List<CafeDto> list3=session.selectList("cafe.getData2", dto);
		return list3;
	}

	@Override
	public void increaseViewCount(int num) {
		session.update("cafe.increaseViewCount", num);
	}

	@Override
	public void update(CafeDto dto) {
		session.update("cafe.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("cafe.delete", num);
	}
	
	@Override
	public int getCount() {
		int count=session.selectOne("cafe.getCount");
		return count;
	}
	@Override
	public int getRow(String id) {
		int row=session.selectOne("cafe.getRow", id);
		return row;
	}

	

}











