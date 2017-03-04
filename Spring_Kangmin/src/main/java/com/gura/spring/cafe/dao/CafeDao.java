package com.gura.spring.cafe.dao;

import java.util.List;

import com.gura.spring.cafe.dto.CafeDto;

public interface CafeDao {
	public List<CafeDto> getList(CafeDto dto);
	public List<CafeDto> getList2(String writer);
	public void insert(CafeDto dto);
	public CafeDto getData(int num);
	public List<CafeDto> getData2(CafeDto dto);
	public void increaseViewCount(int num);
	public void update(CafeDto dto);
	public void delete(int num);
	public int getCount();
}
