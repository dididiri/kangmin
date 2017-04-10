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
       left: 20px;
    }
    
     #M_img2{
       width: 100px;
       height: 100px;
       border-radius: 50%;
       
    }  
     #block{
		display: none;
	}
	#block2{
		display: none;
	}
</style>
</head>
<body>

<div class="container">

<h3>프로필 수정 페이지 입니다.</h3>  
<br />  
<form action="update.do" method="post" id="updateForm">
    <div>
	    <img style="float: left;margin-top: -35px;"  id="M_img2"  src="${pageContext.request.contextPath }/upload/${dto2.saveFileName}"/>
		<h3 id="h3Id">${dto.id }</h3>
		</div>
		<div style="
	    margin-top: 40px;">
		<input type="hidden" name="id" id="id" value="${dto.id }"/>
		<label style="margin-top: 1.5em; font-size: 20px;" for="pwd5">이전 비밀번호 입력</label>
		<input style="width: 250px; height: 32px;" type="password" name="pwd2" id="pwd5"/>
		<span id="block" class="help-block">이전 비밀번호가 틀립니다.</span>
		<span id="block2" class="help-block">OK!</span>
		<span class="glyphicon form-control-feedback"></span>	
		<br />
		<label style="margin-top: 0.5em; font-size: 20px;" for="pwd">새 비밀번호 입력</label>
		<input style="width: 250px; height: 32px;" type="password" name="pwd" id="pwd"
			/><br/>
		<label style="margin-top: 0.5em; margin-bottom: 1.5em; font-size: 20px;" for="pwd2">새 비밀번호 확인</label>
		<input style="width: 250px; height: 32px;" type="password" id="pwd2" /><br/>
		<input type="hidden" name="email" id="email" 
			value="${dto.email }"/><br/>
		<button class="btn btn-info" id="upBtn" type="submit">비밀번호 변경</button>
	</div>
</form>
</div >
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
	document.querySelector("#updateForm")
	.addEventListener("submit", function(event){
		var inputPwd=document.querySelector("#pwd").value;
		var inputPwd2=document.querySelector("#pwd2").value;
		if(inputPwd != inputPwd2){
			alert("비밀번호가 일치하지 않습니다.");
			event.preventDefault();//폼전송 막기 
		}else{
			alert("비밀번호 변경이 됬습니다.");
		}
	});
	
	$("#upBtn").click(function(){
		 if($("#pwd5").val() == ""){
			 alert("이전 비밀번호를 입력하세요.");
		  
	     }else if($("#pwd").val() == ""){
	    	 alert("비밀번호를 입력하세요.");
	     }
	     else if($("#pwd2").val() == ""){
	    	 alert("비밀번호를 입력하세요.");
	     }else{  
			  return true;
		  }
		return false;
	});
	
	$("#pwd5").on("keyup", function(){
		
				//입력한 아이디 읽어오기
				var inputId=$("#id").val();
				var inputPwd=$("#pwd5").val();
				//ajax 요청을 이용해서 서버에 전송
				
				$.ajax({
					url:"checkid3.do",
					method:"get",
					data:{"inputId":inputId,"inputPwd":inputPwd},
					success:function(data){
						console.log(data);
						$("#pwd5").parent()
						.removeClass("has-success has-error")
						.find(".help-block")
					    .hide();
						if(data.canUse){
							$("#pwd5")
							.parent()
							.addClass("has-success")
							.find("#block2")
							.show()
							.parent();
							
							
							
							
						}else{
							$("#pwd5")
							.parent()
							.addClass("has-error")
							.find("#block")
							.show()
						    .parent();
							
						}
		 			}
		 		});
		 		
		 		
		 	});
</script>
</body>
</html>