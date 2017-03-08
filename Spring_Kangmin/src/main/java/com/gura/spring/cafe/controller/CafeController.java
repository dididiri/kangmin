package com.gura.spring.cafe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.asm.IElementHandleProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.dto.CafeDto;
import com.gura.spring.cafe.dto.CommentDto;
import com.gura.spring.cafe.service.CafeService;
import com.gura.spring.cafe.service.CommentService;
import com.gura.spring.cafe.service.FileService;



@Controller
public class CafeController {
	
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired //의존 객체를 주입 받기위한 어노 테이션 
	private FileService fileService;
	//파라미터로 페이지 번호가 넘어올수도 있고 안넘어 올수도 있다.
	//만일 안넘어 오면 default 값으로 1 을 넣어준다. 
	@RequestMapping("/cafe/list")
	public ModelAndView list(HttpServletRequest request, 
			@RequestParam(defaultValue="1") int pageNum){
		
		

		ModelAndView mView=cafeService.getList(request, pageNum);
		String writer= request.getParameter("writer");
		
		if(writer !=null){
			
			
		mView.addObject("dto", fileService.getData(writer));
		  
		}
		mView.setViewName("cafe/list");
		//리턴해준다.
		return mView;
	}
	@RequestMapping("/cafe/list2")
	public ModelAndView list(HttpServletRequest request){
		
		
		String writer= request.getParameter("writer");
		List<CafeDto> list2=cafeService.getList2(writer);
		
		ModelAndView mView=new ModelAndView();
		if(writer !=null){
			
			
			mView.addObject("dto", fileService.getData(writer));
			  
	    }
		mView.addObject("list2", list2);
		mView.setViewName("cafe/list2");
		//리턴해준다.
		return mView;
	}
	//새글 입력 폼 요청 처리 
	@RequestMapping("/cafe/private/insertform")
	public ModelAndView authInsertForm(){
		
		return new ModelAndView("cafe/private/insertform");
	}
	
	//새글 저장 요청 처리 
	@RequestMapping("/cafe/private/insert")
	public ModelAndView authInsert(@ModelAttribute CafeDto dto){
		cafeService.insert(dto);
		dto.getWriter();
		return new ModelAndView("redirect:/cafe/list2.do?writer="+dto.getWriter());
	}
	
	
	//글 삭제 요청 처리 
	@RequestMapping("/cafe/private/delete")
	public ModelAndView authDelete(@RequestParam int num,@ModelAttribute CafeDto dto){
		dto.getWriter();
		cafeService.delete(num);
		return new ModelAndView("redirect:/cafe/list2.do?writer="+dto.getWriter());
	}
	
	@RequestMapping("/cafe/detail")
	public ModelAndView detail(@RequestParam String writer, 
			@RequestParam int num,HttpSession session){
		
		ModelAndView mView=cafeService.getData(num);
		
		mView.addObject("commentList", commentService.getList(num));
	    mView.addObject("dto1", fileService.getData(writer));
		mView.setViewName("cafe/detail");
		return mView;
	}
	
	
	
	@RequestMapping("/cafe/detail2")
	public ModelAndView detail2(@RequestParam String writer, 
			HttpSession session,@RequestParam int num){
		
		List<CafeDto> list3=cafeService.getData2();
		ModelAndView mView=new ModelAndView();
		
		mView.addObject("num", num);
		mView.addObject("list3", list3);	
		
		mView.addObject("list5", fileService.getData2());
		mView.addObject("commentList", commentService.getList2());
	      
		
		mView.setViewName("cafe/detail2");
		return mView;
	}
	//글 수정폼 요청 처리
	@RequestMapping("/cafe/private/updateform")
	public ModelAndView authUpdateform(@RequestParam int num){
		//수정할 글 정보가 담긴 ModelAndView 객체를 리턴 받는다. 
		ModelAndView mView=cafeService.updateForm(num);
		//view 페이지의 정보 설정하고  
		mView.setViewName("cafe/private/updateform");
		//리턴해주기
		return mView;
	}
	@RequestMapping("/cafe/private/update")
	public ModelAndView authUpdate(@ModelAttribute CafeDto dto){
		
		cafeService.update(dto);
		dto.getWriter();
		return new ModelAndView("redirect:/cafe/list2.do?writer="+dto.getWriter());
	}
	
	@RequestMapping("/cafe/comment_insert")
	public ModelAndView authCommentInsert(@ModelAttribute CommentDto dto 
			){
		int seq=commentService.getSequence();
		dto.setNum(seq);
		if(dto.getComment_group()==0){//원글에 대한 덧글인 경우
			//덧글의 그룹번호를 덧글의 글번호와 같게 설정한다.
			dto.setComment_group(seq);
		}else{//덧글의 덧글인 경우   
			//파라미터로 넘어온 덧글의 그룹번호를 넣어준다.
			dto.setComment_group(dto.getComment_group());
		}
		
		commentService.insert(dto);
		
		return new ModelAndView("redirect:/cafe/detail."
				+ "do?num="+dto.getRef_group()+"&writer="+dto.getTarget_id());
	}
	
	@RequestMapping("/cafe/comment_insert2")
	public ModelAndView authCommentInsert2(@ModelAttribute CommentDto dto 
			){
		int seq=commentService.getSequence();
		dto.setNum(seq);
		if(dto.getComment_group()==0){//원글에 대한 덧글인 경우
			//덧글의 그룹번호를 덧글의 글번호와 같게 설정한다.
			dto.setComment_group(seq);
		}else{//덧글의 덧글인 경우   
			//파라미터로 넘어온 덧글의 그룹번호를 넣어준다.
			dto.setComment_group(dto.getComment_group());
		}
		
		commentService.insert(dto);
		
		return new ModelAndView("redirect:/cafe/detail2."
				+ "do?num="+dto.getRef_group()+"&writer="+dto.getTarget_id());
	}
	
	
	
	
	
}
































