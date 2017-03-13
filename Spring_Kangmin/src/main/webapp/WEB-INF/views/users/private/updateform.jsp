<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/private/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style>
    body{  
    background-image: url(../../resources/images/bg3.jpg);
        
    }
    label{
       color: #ffffff;
    }   
    h3{
       color: #ffffff;    
      
    }    
    #h3Id{
        color: #ffffff;
        position: relative;
       left: 40px;
    }
    
     #M_img2{
       width: 40px;
       height: 35px;
       border-radius: 50%;
       
    }  
</style>
</head>
<body>

<div class="container">

<h3>프로필 수정 페이지 입니다.</h3>  
<br />  
<form action="update.do" method="post" id="updateForm">
    <div>
    <img style="float: left;"  id="M_img2"  src="${pageContext.request.contextPath }/upload/${dto2.saveFileName}"/>
	<h3 id="h3Id">${dto.id }</h3>
	</div>
	<div>
	<input type="hidden" name="id" value="${dto.id }"/>
	
	<label style="margin-top: 3.5em; font-size: 20px;" for="pwd">새 비밀번호 입력</label>
	<input style="width: 250px; height: 32px;" type="password" name="pwd" id="pwd"
		/><br/>
	<label style="margin-top: 0.5em; margin-bottom: 1.5em; font-size: 20px;" for="pwd2">새 비밀번호 확인</label>
	<input style="width: 250px; height: 32px;" type="password" id="pwd2" /><br/>
	
	<input type="hidden" name="email" id="email" 
		value="${dto.email }"/><br/>
	<button type="submit">비밀번호 변경</button>
	
	</div>
</form>
</div >
<script>
	document.querySelector("#updateForm")
	.addEventListener("submit", function(event){
		var inputPwd=document.querySelector("#pwd").value;
		var inputPwd2=document.querySelector("#pwd2").value;
		if(inputPwd != inputPwd2){
			alert("비밀번호를 확인 하세요");
			event.preventDefault();//폼전송 막기 
		}
	});
</script>
</body>
</html>