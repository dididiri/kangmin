package com.gura.spring.users.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.users.dto.UsersDto;

public interface UsersService {
	public void insert(UsersDto dto);
	public boolean isValid(UsersDto dto);
	public void update(UsersDto dto);
	public void delete(String id);	
	public ModelAndView getData(String id);
	public boolean canUseId(UsersDto dto);
	public Map<String, Object> canUseId2(String id);
}
