package com.gura.spring.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.users.dto.UsersDto;


@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired 
	private SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}
	@Override
	public boolean isValid(UsersDto dto) {
		UsersDto resultDto=session.selectOne("users.isValid", dto);
		if(resultDto==null){
			return false;
		}else{
			return true;
		}
	}  

	@Override
	public void update(UsersDto dto) {
		session.update("users.update",dto);
		
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}

	@Override
	public boolean canUseId(UsersDto dto) {
		
		UsersDto selectedId=session.selectOne("users.isExistId",dto);
		System.out.println(selectedId);
		if(selectedId==null){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public boolean canUseId2(String id) {
		
		String selectedId=session.selectOne("users.isExistId2", id);
		if(selectedId==null){
				return true; 
		}else{
			return false;
		}
	}
	@Override
	public UsersDto getData(String id) {
		UsersDto dto=session.selectOne("users.getData", id);
		return dto;
	}
	@Override
	public String getPassword(String id) {
        String password=session.selectOne("users.getPwd", id);
		
		return password;
	}

}












