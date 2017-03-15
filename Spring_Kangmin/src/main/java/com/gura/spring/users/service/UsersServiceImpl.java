package com.gura.spring.users.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;


import com.gura.spring.users.dao.UsersDao;
import com.gura.spring.users.dto.UsersDto;

@Component 
public class UsersServiceImpl implements UsersService{
	//라이브러리 인터페이스
	//비밀번호 인코더 객체
	private PasswordEncoder pEncoder=new BCryptPasswordEncoder();
	
	@Autowired
	private UsersDao usersDao;  
	//암호화된거 집어넣고
	@Override
	public void insert(UsersDto dto) {
		//암호화된 비밀번호를 얻어낸다. 
		String encodedPwd=pEncoder.encode(dto.getPwd());
		//Dto 객체에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		usersDao.insert(dto);
		
	}
    //암호화된거 비교해야되고
	/*
	 * 아이디만 셀렉트한다 그럼 암호화된 비밀번호도 가져와서 비교한다
	 */
	@Override
	public boolean isValid(UsersDto dto) {
		//아이디가 유효한지 여부 
		boolean isValid=false;
		//아이디에 해당하는 DB에 저장된 암호화된 비밀번호를 읽어온다.
		String password=usersDao.getPassword(dto.getId());
		if(password != null){ //아이디가 일단 존재하는 경우
			// .maches(사용자가 입력한 비밀번호, DB 에 저장된 암호화 비밀번호)
			// 를 이용해서 비밀번호가 맞는지 여부를 boolean type 으로 리턴받기
			isValid=pEncoder.matches(dto.getPwd(), password);
		}
		return isValid;
	}
    //암호회된거 업데이트해야됨
	@Override
	public void update(UsersDto dto) {
		//암호화된 비밀번호를 얻어낸다.
		String encodedPwd=pEncoder.encode(dto.getPwd());
		//Dto 객체에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		usersDao.update(dto);
		
	}

	@Override
	public void delete(String id) {
		usersDao.delete(id);
		
	}

	@Override
	public boolean canUseId(UsersDto dto) {
	 
		return usersDao.canUseId(dto);
	}
	@Override
	public Map<String, Object> canUseId2(String id) {
	
		boolean canUse = usersDao.canUseId2(id);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("canUse", canUse);
		
		return map;
		}

	@Override
	public ModelAndView getData(String id) {
		
		UsersDto dto=usersDao.getData(id);
		ModelAndView mView=new ModelAndView();
		mView.addObject("dto",dto);
	
		return mView;
	}

}









