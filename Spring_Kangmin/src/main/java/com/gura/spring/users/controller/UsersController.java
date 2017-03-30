package com.gura.spring.users.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.service.FileService;
import com.gura.spring.model.email.EmailVo;
import com.gura.spring.service.email.EmailService;
import com.gura.spring.users.dto.UsersDto;
import com.gura.spring.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	@Autowired
	private FileService fileService;
	
	@Inject
    EmailService emailService;
	
	@RequestMapping("cafe/delete")
	public ModelAndView authDelete(HttpSession session){
		
	    String id=(String)session.getAttribute("id");
	    usersService.delete(id);
	    session.invalidate();
	    ModelAndView mView=new ModelAndView();
	    mView.addObject("msg", "회원 탈퇴 처리 하였습니다.");
	    mView.addObject("redirectUri", session.getServletContext().getContextPath());
	    mView.setViewName("users/alert");
		return mView;
	}
	  
	@RequestMapping("/users/private/update")
	public ModelAndView authUpdate(@ModelAttribute UsersDto dto,HttpServletRequest request){
		usersService.update(dto);
		
		return new ModelAndView("redirect:/cafe/list2.do?writer="+dto.getId());
	}
	
	
	@RequestMapping("/users/private/updateform")
	public ModelAndView updateFrom(HttpSession session){
	
		String id=(String)session.getAttribute("id");
		
		ModelAndView mView=usersService.getData(id);
		mView.addObject("dto2", fileService.getData(id));
		mView.setViewName("users/private/updateform");
		
		return mView;
	}
	

	  
	
	@RequestMapping("cafe/signout")
	public ModelAndView signout(HttpSession session){
	
		session.removeAttribute("id");
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "로그 아웃 되었습니다.");
		mView.addObject("redirectUri", 
		session.getServletContext().getContextPath());
		mView.setViewName("users/alert");
		return mView;
	}
	
	
	
	@RequestMapping("cafe/signup")
	public ModelAndView signup(HttpServletRequest request,
			@ModelAttribute UsersDto dto){
		usersService.insert(dto);
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", dto.getId()+" 회원님 가입되었습니다.");
		mView.addObject("redirectUri", request.getContextPath());
		mView.setViewName("users/alert");
		
		return mView;
	}
	
	
	
	@RequestMapping("cafe/signin")
	public ModelAndView signin(@ModelAttribute UsersDto dto,
			@RequestParam String uri, HttpSession session){
		
		
		boolean isValid=usersService.isValid(dto);
		ModelAndView mView=new ModelAndView();
		if(isValid){ 
			session.setAttribute("id", dto.getId());
		}
		String id = (String)session.getAttribute("id");
		mView=usersService.getData(id);
		mView.setViewName("redirect:/cafe/list.do?writer="+dto.getId());
		
		return mView;
	}
	
	
	@RequestMapping("cafe/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId,@RequestParam String inputPwd){
		boolean canUse = false;
		UsersDto dto=new UsersDto();
		dto.setId(inputId);
		dto.setPwd(inputPwd);
		
		boolean getId=usersService.isValid(dto);
		 if(getId){
			canUse=true;
		}else{
			canUse=false;
		}
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("canUse", canUse);
	
		return map;
	}
	@RequestMapping("users/private/checkid3")
	@ResponseBody
	public Map<String, Object> checkid31(@RequestParam String inputId,@RequestParam String inputPwd){
		boolean canUse = false;
		UsersDto dto=new UsersDto();
		dto.setId(inputId);
		dto.setPwd(inputPwd);
		
		boolean getId=usersService.isValid(dto);
		 if(getId){
			canUse=true;
		}else{
			canUse=false;
		}
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("canUse", canUse);
	
		return map;
	}
	
	
	@RequestMapping("cafe/checkid2")
	@ResponseBody
	public Map<String, Object> checkid2(@RequestParam String inputId2){
		Map<String, Object> map=usersService.canUseId2(inputId2);
			
		return map;
	}
	
	
	@RequestMapping("/mail/write")
	public String signupForm(){
		
		return "mail/write";
	}
	

	
	  
	@RequestMapping("cafe/send")
	@ResponseBody
	public String send(@RequestParam String senderName,@RequestParam String senderMail,
			@RequestParam String email,@RequestParam String subject,
			@RequestParam String message){
		EmailVo vo=new EmailVo();
		vo.setMessage2(message);
	    vo.setSenderName(senderName);
		vo.setSenderMail(senderMail);
		vo.setEmail(email);
		vo.setSubject(subject);
		vo.setMessage(message);
		System.out.println(message+":1234");
		try {
			emailService.sendMail(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "list";
	}
	
	@RequestMapping("cafe/ident")
	@ResponseBody
	public Map<String, Object> checkid3(@RequestParam String message2
			,@RequestParam String message){
		boolean canUse = false;
		EmailVo vo=new EmailVo(message);
		
		
		String getId=vo.getMessage2();
		System.out.println(vo+"vo~~~~");
		System.out.println(getId+"getId~~~~~~");
		System.out.println(message2+"message2~~~~~~~~~~");
		 if(message2.equals(getId)){
			canUse=true;
		}else{  
			canUse=false;  
		}
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("canUse", canUse);
		
		return map;  
	}
}





















