<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8" name="viewport" 
content="width=device-width, initial-scale=1, 
minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>views/cafe/private/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<!-- SmartEditor 관련 javascript 로딩 -->
<script src="${pageContext.request.contextPath }/
	SmartEditor/js/HuskyEZCreator.js"></script>
</head>
<style>
     body{  
    	background-image: url(../../resources/images/bg3.jpg);
    	
    }
     h3 {
       color :#ffffff;
    }
    th{
        color :#ffffff;
    }
    
    td{
       color :#ffffff;
    }
</style>

<body>
<div class="container">
<h3>이미지 게시판 입력 페이지 입니다.</h3>
<form action="insert.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="writer" value="${id }" />
	
	<input type="hidden" id="writer" 
		value="${id }" disabled="disabled"/><br/>
	<label style="
    color: #ffffff;" for="title">제목</label>
	<input type="text" name="title" id="title"/><br/><br />
    <label  for="file" style="color: #ffffff;">첨부파일</label>
	<!--input type="file" name 속성의 value 는 FileDto 의 
	MultipartFile Type 의 필드명과 같아야 한다.  -->
	<input  style="color: #ffffff;" type="file" name="file" id="file" /><br/>
	<button class="btn btn-info" id="id5" type="submit">업로드</button>
</form>
</div>	  
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
$("#id5").click(function(){
	if($("#title").val() == ""){
		 alert("제목을 입력하세요.");
		
	  }else if($("#file").val() == ""){
		 alert("사진을 선택하세요.");
	  
      }else{
		  return true;
	  }
	return false;
});
</script>
</body>
</html>








