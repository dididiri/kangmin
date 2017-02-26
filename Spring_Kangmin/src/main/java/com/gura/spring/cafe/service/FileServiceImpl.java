package com.gura.spring.cafe.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.cafe.dao.FileDao;
import com.gura.spring.cafe.dto.FileDto;



@Component //bean 으로 만들기위한 어노테이션 
public class FileServiceImpl implements FileService{
	
	//의존객체
	@Autowired // 의존 객체를 주입 받기 위한 어노테이션 
	private FileDao fileDao;
	
	@Override
	public void insert(HttpServletRequest request, FileDto dto) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession()
				.getServletContext().getRealPath("/upload");
		System.out.println(realPath);
		
		//MultipartFile 객체의 참조값 얻어오기
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile=dto.getFile();
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//파일 사이즈
		long fileSize=mFile.getSize();
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String saveFileName=System.currentTimeMillis()+orgFileName;
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		//FileDto 객체에 추가 정보를 담는다.
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		//FileDao 객체를 이용해서 DB 에 저장하기
		fileDao.insert(dto);
	}

	@Override
	public ModelAndView list() {
		//FileDao 객체를 이용해서 파일 목록을 얻어온다. 
		List<FileDto> list=fileDao.getList();
		//ModelAndView 객체에 담아서 리턴해준다.
		ModelAndView mView=new ModelAndView();
		mView.addObject("list", list);
		
		return mView;
	}

	

	@Override
	public FileDto getData(String writer) {
		//다운로드 시켜줄 파일의 정보를 읽어온다.
		FileDto dto=fileDao.getData(writer);
		// 파일의 정보를 ModelAndView 객체에 담아서
		ModelAndView mView=new ModelAndView();
		mView.addObject("dto", dto);
		//리턴해준다. 
		return dto;
	}

	@Override
	public void delete(HttpServletRequest request, int num) {
		// TODO Auto-generated method stub
		
	}
	
}












