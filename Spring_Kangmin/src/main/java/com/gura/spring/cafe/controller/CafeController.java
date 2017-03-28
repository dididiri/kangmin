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

	@Autowired
	private FileService fileService;

	@RequestMapping("/cafe/list")
	public ModelAndView list(HttpServletRequest request, @RequestParam(defaultValue = "1") int pageNum) {

		ModelAndView mView = cafeService.getList(request, pageNum);
		String writer = request.getParameter("writer");

		if (writer != null) {

			mView.addObject("dto", fileService.getData(writer));

		}
		mView.setViewName("cafe/list");

		return mView;
	}

	@RequestMapping("/cafe/list2")
	public ModelAndView list(HttpServletRequest request) {

		String writer = request.getParameter("writer");
		List<CafeDto> list2 = cafeService.getList2(writer);

		ModelAndView mView = new ModelAndView();
		if (writer != null) {

			mView.addObject("dto", fileService.getData(writer));

		}
		mView.addObject("list2", list2);
		mView.setViewName("cafe/list2");

		return mView;
	}

	@RequestMapping("/cafe/private/insertform")
	public ModelAndView authInsertForm() {

		return new ModelAndView("cafe/private/insertform");
	}

	@RequestMapping("/cafe/private/insert")
	public ModelAndView authInsert(HttpServletRequest request,@ModelAttribute CafeDto dto) {
		cafeService.insert(request,dto);
		dto.getWriter();
		return new ModelAndView("redirect:/cafe/list2.do?writer=" + dto.getWriter());
	}

	@RequestMapping("/cafe/private/delete")
	public ModelAndView authDelete(@RequestParam int num, @ModelAttribute CafeDto dto) {
		dto.getWriter();
		cafeService.delete(num);
		return new ModelAndView("redirect:/cafe/list2.do?writer=" + dto.getWriter());
	}

	@RequestMapping("/cafe/detail")
	public ModelAndView detail(@RequestParam String writer, @RequestParam int num, HttpSession session) {

		ModelAndView mView = cafeService.getData(num);

		mView.addObject("commentList", commentService.getList(num));
		mView.addObject("dto1", fileService.getData(writer));
		mView.setViewName("cafe/detail");
		return mView;
	}

	@RequestMapping("/cafe/likeup")
	public ModelAndView likeup(@RequestParam String writer, @RequestParam int num) {
		CafeDto dto = new CafeDto();
		dto.setNum(num);
		dto.setWriter(writer);

		cafeService.likeUp(num);

		return new ModelAndView("redirect:/cafe/detail.do?num=" + dto.getNum() + "&writer=" + dto.getWriter());
	}

	@RequestMapping("/cafe/likeup2")
	public ModelAndView likeup2(@RequestParam String writer, @RequestParam int num) {
		CafeDto dto = new CafeDto();
		dto.setNum(num);
		dto.setWriter(writer);

		cafeService.likeUp(num);

		return new ModelAndView("redirect:/cafe/detail2.do?num=" + dto.getNum() + "&writer=" + dto.getWriter());
	}

	@RequestMapping("/cafe/detail2")
	public ModelAndView detail2(@RequestParam String writer, HttpSession session, @RequestParam int num) {

		List<CafeDto> list3 = cafeService.getData2();
		ModelAndView mView = new ModelAndView();
		CafeDto dto = new CafeDto();

		mView.addObject("num", num);
		mView.addObject("list3", list3);
		mView.addObject("dto", dto.getNum());
		mView.addObject("dto", dto.getWriter());
		mView.addObject("list5", fileService.getData2());
		mView.addObject("commentList", commentService.getList2());

		mView.setViewName("cafe/detail2");
		return mView;
	}

	@RequestMapping("/cafe/private/updateform")
	public ModelAndView authUpdateform(@RequestParam int num) {
		ModelAndView mView = cafeService.updateForm(num);
		mView.setViewName("cafe/private/updateform");
		return mView;
	}

	@RequestMapping("/cafe/private/update")
	public ModelAndView authUpdate(@ModelAttribute CafeDto dto) {
		cafeService.update(dto);
		dto.getWriter();
		return new ModelAndView("redirect:/cafe/list2.do?writer=" + dto.getWriter());
	}

	@RequestMapping("/cafe/comment_insert")
	public ModelAndView authCommentInsert(@ModelAttribute CommentDto dto) {
		int seq = commentService.getSequence();
		dto.setNum(seq);
		if (dto.getComment_group() == 0) {

			dto.setComment_group(seq);
		} else {
			dto.setComment_group(dto.getComment_group());
		}

		commentService.insert(dto);

		return new ModelAndView(
				"redirect:/cafe/detail." + "do?num=" + dto.getRef_group() + "&writer=" + dto.getTarget_id());
	}

	@RequestMapping("/cafe/comment_insert2")
	public ModelAndView authCommentInsert2(@ModelAttribute CommentDto dto) {
		int seq = commentService.getSequence();
		dto.setNum(seq);
		if (dto.getComment_group() == 0) {
			dto.setComment_group(seq);
		} else {
			dto.setComment_group(dto.getComment_group());
		}
		commentService.insert(dto);

		return new ModelAndView(
				"redirect:/cafe/detail2." + "do?num=" + dto.getRef_group() + "&writer=" + dto.getTarget_id());
	}

}
