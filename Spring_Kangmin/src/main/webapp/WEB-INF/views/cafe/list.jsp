<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style>
    #dovBox{
         background: initial;
             width: 300px;
     }
     #dovBox2{
          background: initial;
             width: 400px;  
     }
     
     
     #block0{  
        display: none;
     }
     #block{
		display: none;
	 }
	  #block2{
		display: none;
	 }
	  #block4{
		display: none;
	 }

	.page_display a{
		text-decoration: none;
		color: #000;
	}
	.page_display a.active{
		font-weight: bold;
		color: red;
		text-decoration: underline;
	}
	
	.page_display a.muted{
		color: #cecece;
	}
	#imgi1{
	   
	   float: left;
	   width: 150px;
       height: 70px;
       margin-top: -27px;
	}
	a img{
	  max-width: 100%;
	      width: 350px;  
	      height: 370px;  
	  
	}
	#com1{
	  position: relative;
      left: 38%;
      padding: 15px;
	}
	#col1{
	padding-right: 5px;
    padding-left: 5px;
    margin-bottom: -20px;
    }
    
    body{  
    background-image: url(../resources/images/bg3.jpg);
    }
    
    
   
</style>
</head>
<body >      
<hr />
<!-- 검색어 관련 form -->
 <div class="container" style="width: 27%;">
<form action="list.do" method="post" id="keywordForm" class="input-group">
	<div class="input-group-btn">
	<select name="condition" id="condition" class="btn btn-default" style="
    height: 34px;">
		<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
		<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
		<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
	</select>  
	<input class="btn btn-default" type="text" name="keyword" placeholder="검색어" 
		value="${keyword }"/>
	
	<button type="submit" class="btn btn-default">
	    <span class="sr-only">검색</span>
        <span class="glyphicon glyphicon-search"></span>
	</button>
	</div>  
</form>

     
     
     
     
     
     
    
     
     
     
	 <c:choose>
	              <c:when test="${not empty id }">
	                   <div style="color:#ffffff;">  
	                     <strong style=color:#ffffff><a href="" data-toggle="modal" data-target="#myModal2">${id }</a>
	                     </strong> 님 로그인중... 
		                 <a href="cafe/private/insertimg.do"></a>
		                 <a href="signout.do">로그아웃</a>
		               </div> 
	              </c:when>
	              </c:choose>
                 
                  <c:choose>
	              <c:when test="${ empty id }">
			           <a href="" data-toggle="modal" data-target="#myModal"> 로그인</a>
			           <a href="" data-toggle="modal" data-target="#myModal3"> 회원가입</a>
			            </c:when>
	              </c:choose>    
			         
  
  
  </div> 

     
<hr />  
<div class="container">

<a href="private/insertform.do">새글쓰기</a>
<hr />
<div class="row">
    <c:forEach var="tmp" items="${list }"> 
    <div id="col1" class="col-xs-4 col-sm-4 col-md-3">  
			<a id="a1" href="detail.do?num=${tmp.num }">${tmp.content}</a>
	</div>
	</c:forEach>
</div>
</div>

<!-- 로그인 Modal -->  
<div id="myModal" class="modal fade">
    <div class="modal-dialog">
       
		    	
		   <div class="container">
		     
		
		  
		   <div class="">
			   	 <button class="close" data-dismiss="modal">&times;</button>
				<div class="login-box well" id="dovBox" style="color:#ffffff;">
			
                    
					<form action="signin.do?uri=${param.uri }" method="post"
						name="sForm" novalidate id="myform">
						<div class="form-group has-feedback">
							<label class="control-label" for="id">아이디</label> 
							<input class="form-control" type="text" name="id" id="id" >
							<p  id="block0" class="help-block">아이디 또는 비밀번호를 다시 확인하세요.</p>
			                <span class="glyphicon form-control-feedback"></span>
                        </div>
						<div class="form-group">
							<label for="pwd">비밀번호</label> <input class="form-control"
							type="password" name="pwd" id="pwd" />
						</div>
						<div class="form-group">
						
							<button id="id2"  type="submit" class="btn btn-default btn-block m-t-md">로그인</button>
						
						</div>
					</form>
				</div>

		</div>
	</div>
	  
	</div>
</div> 

<!-- 동적으로 띄울 Modal 준비 -->  
<div id="myModal3" class="modal">

	<div class="modal-dialog">

		<div class="modal-content" id="dovBox2">
		<button class="close" data-dismiss="modal">&times;</button>
		<h3>회원가입 폼 입니다.</h3>
        <hr />

<div class="login-box well">

		
		   
					<form action="signup.do?uri=${param.uri }" method="post"
						name="sForm" novalidate id="myform">
						<div class="form-group has-feedback">
							<label class="control-label" for="id3">아이디</label> 
							<input class="form-control" type="text" name="id" id="id3" >
							<p id="block" class="help-block">이미 사용중인 아이디 입니다.</p>
							<p id="block2" class="help-block">사용가능한 아이디 입니다.</p>
			                <span class="glyphicon form-control-feedback"></span>
                        </div>
						<div class="form-group">
							<label for="pwd">비밀번호</label> <input class="form-control"
							type="password" name="pwd" id="pwd" />
						</div>
						
						
						    <label class="control-label" for="id4"></label> 
							<input type="hidden" id="senderName" name="senderName" value="김강민회사">
							<input type="hidden" id="senderMail" name="senderMail" value="fjqngodys2@gmail.com"/>
							<label for="email">이메일</label>
							<input name="email" id="email" class="form-control"/>
							<input type="hidden" id="subject" name="subject" value="인증번호 입니다."/>
							<input  type="hidden" id="message" name="message"  />
							<p id="block4" class="help-block">인증번호가 전송됬습니다.</p>
							 <span class="glyphicon form-control-feedback"></span>
							
							
							<button id="checkBtn10">인증전송</button><br />
					        <span style="color:red;">${message }</span>  
							<label for="">인증</label> <input class="form-control"
							type="text" id="message2" name="message2" />
							<button id="checkBtn12"  type="submit" >인증확인</button>
							<button id="id2"  type="submit" class="btn btn-default btn-block m-t-md">로그인</button>
						
						
						
						
		 </form>
     </div> 
   </div> 
</div> 
</div> 


<!-- 동적으로 띄울 Modal 준비 -->
<div id="myModal2" class="modal">

	<div class="modal-dialog">

		<div class="modal-content">
		<button class="close" data-dismiss="modal">&times;</button>
			<h3>  ${id }님에 회원 정보 </h3>

<form action="">

<div class="login-box well">

<table class="table table-striped table-bordered table-hover">
	<thead>
		<tr class="">  
			<th>항목</th>
			<th>정보</th>
		</tr>
	</thead>
	<tbody>
		<tr class="">
			<th>아이디</th>
			<td>${dto.id }</td>
		</tr>
		<tr class="">
			<th>이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr class="">
		    <th>가입일</th>
		    <td>${dto.regdate }</td>
		</tr>
	</tbody>
</table>
<a href="users/private/updateform.do">가입정보 수정폼</a>
<a href="javascript:userConfirm()">회원 탈퇴</a>
</div>
</form>
		</div>
	</div>  
</div>
<!-- 검색어 관련 form -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

<script>
	
	
	document.getElementById("message").value=Math.floor(Math.random()*800+1111);


     var a=false;
        
		$("#modalBtn").click(function(){
			$("#myModal").modal("show");
		});
		
		$("#modalBtn").click(function(){
			$("#myModal2").modal("show");
		});
		
		$("#modalBtn").click(function(){
			$("#myModal3").modal("show");
		});
		
		
	 	 $("#myform").submit(function(){
			//입력한 아이디 읽어오기
			var inputId=$("#id").val();
			var inputPwd=$("#pwd").val();
			//ajax 요청을 이용해서 서버에 전송
			
			$.ajax({
				url:"checkid.do",
				method:"get",
				data:{"inputId":inputId,"inputPwd":inputPwd},
				success:function(data){
					console.log(data);
					$("#id").parent()
					.removeClass("has-success has-error");
					if(data.canUse){
						 a=true;
						$("#id")
						.parent()
						.find(".help-block")
						.hide()
						.parent()
						.find(".glyphicon")
						.removeClass("glyphicon-remove")
						
						
						
					}else{
				  		$("#id")
						.parent()
						.addClass("has-error")
						.find("#block0")
						.show()
						.parent()
						.find(".glyphicon")
						.removeClass("glyphicon-ok")
						.addClass("glyphicon-remove");
						
						 a=false;
					}
					
				}
				
			});
			  
			 
			if(a==false){
				return false;
			}
		});
		
	 	//중복 확인 버튼을 눌렀을때 실행할 함수 등록 
	 	$("#id3").on("keyup", function(){
	 		//입력한 id 읽어오기
	 		var inputId2=$("#id3").val();
	 		//ajax 를 이용해서 서버에 전송하고 사용가능 여부 응답받기
	 		$.ajax({
	 			url:"checkid2.do",
	 			method:"get",
	 			data:{"inputId2":inputId2},
	 			success:function(data){
	 				console.log(data);
	 				$("#id3").parent()
					.removeClass("has-success has-error")
					.find(".help-block")
				    .hide();
	 				if(data.canUse){
	 					$("#id3")
						.parent()
						.addClass("has-success")
						.find("#block2")
						.show()
						.parent()
						.find(".glyphicon")
						.removeClass("glyphicon-remove")
						.addClass("glyphicon-ok");
	 				}else{
	 					$("#id3")
						.parent()
						.addClass("has-error")
						.find("#block")
						.show()
					    .parent()
						.find(".glyphicon")
						.removeClass("glyphicon-ok")
						.addClass("glyphicon-remove");
	 				}
	 			}
	 		});
	 		
	 		return false; //폼전송 막기 
	 	});
        
	 	
	 
	 	
		$("#checkBtn10").click(function(){
			//입력한 id 읽어오기
			var count=1;
			var senderName=$("#senderName").val();
			var senderMail=$("#senderMail").val();
			var email=$("#email").val();
			var subject=$("#subject").val();
			var message=$("#message").val();
			
			//ajax 를 이용해서 서버에 전송하고 사용가능 여부 응답받기
			$.ajax({
				url:"send.do",
				method:"post",
				data:{"senderName":senderName,"senderMail":senderMail,
					"email":email,"subject":subject,"message":message},
				success:function(data){
					
				}
			});
			alert("인증번호가 전송됬습니다.");
			return false; //폼전송 막기 
		});
        
		$("#checkBtn12").click(function(){
			//입력한 id 읽어오기
			var message2=$("#message2").val();
			var message=$("#message").val();
			//ajax 를 이용해서 서버에 전송하고 사용가능 여부 응답받기
			$.ajax({
				url:"ident.do",
				method:"post",
				data:{"message2":message2,"message":message},
				success:function(data){
				console.log(data);
				if(data.canUse){
					alert("인증번호가 확인되었습니다.");
				}else{
					alert("인증번호 일치하지 않습니다.");
				   }
					
				}
			});
		
			return false; //폼전송 막기 
		});
		
</script>
</body>
</html>







