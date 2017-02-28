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
        background-image: url(../resources/images/bg3.jpg);
        width: 300px;
        color: #ffffff;
        position: relative;
	    left: 123px;
	    bottom: -127px;
    }
    #dovBox2{
        background-image: url(../resources/images/bg3.jpg);
        width: 400px;  
    }
    #upbox{
        background-image: url(../resources/images/bg3.jpg);
        color: #ffffff;
        width: 400px;
        position: relative;
	    left: 86px;
	    bottom: -127px;
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
	    width: 280px;  
	    height: 360px !important;  
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
    
    #M_img{
       border-radius:50%;
       
       position: relative;
       max-width: 100%;
       padding: 4px;
       background-color: #fff; 
       width: 181px;
	   height: 186px;
    }  
    #M_img2{
       width: 37px;
       height: 35px;
       border-radius: 50%;
       
    }
    #M_img3{
        border-radius: 50%;
	    position: relative;
	    max-width: 100%;
	    padding: 4px;
	    background-color: #fff;
	    width: 181px;
	    height: 186px;
    }
    

	.filebox label { 
		display: inline-block; 
		padding: .5em .75em; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
		width: 100%;
		text-align: center;
		font-size: 15pt;
        font-weight: bold;
       
		
     }             
     .filebox{
        position: relative;
	    bottom: 20px;
	    height: 70px;
     } 
	.filebox input[type="file"] { 
		 position: absolute; 
		 width: 1px; 
		 height: 1px; 
		 padding: 0; 
		 margin: -1px; 
		 overflow: hidden; 
		 clip:rect(0,0,0,0); 
		 border: 0; 
		 
    }

    #fileBtn{
         width: 100%;
	     background-color: #fdfdfd;
	     padding: .5em .75em;
	     border: 1px solid #ebebeb;  
	     font-size: 15pt;
         font-weight: bold;
         border-radius: 4px;
    }
    @media (max-width: 768px){

	     a img{
	        height: 240px !important; 
	     }
	}          
    
    @media (max-width: 992px){

	     .container {
	        width: 100%;
         }
         a img{
		    
		    width: 180%;
		    
		   
	     }
    }        
    
    
   
</style>
</head>
<body >      
<hr />
<!-- 검색어 관련 form -->
 <div class="container" style=" text-align: center;">   
<form action="list.do?writer=${id }" method="post" id="keywordForm" class="input-group">
	
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
	              <c:when test="${not empty dto.saveFileName }">
	                   <div style="color:#ffffff;">    
	                     <strong style=color:#ffffff><img data-toggle="modal" data-target="#myModal2" id="M_img2"  src="${pageContext.request.contextPath }/upload/${dto.saveFileName}"/>
	                     </strong> 님 로그인중... 
		                 <a href="cafe/private/insertimg.do"></a>
		                 <a href="signout.do">SignOut</a>
		                </div> 
	                  
	              </c:when>
	             
	              <c:when test="${not empty id }">
	                   <c:if test="${empty dto.saveFileName}">
	                   <div style="color:#ffffff; ">    
	                     <strong style=color:#ffffff><img data-toggle=
	                     "modal" data-target="#myModal2" id="M_img2" src=
	                     "${pageContext.request.contextPath }/resources/images/kkk.jpg" />
	                     </strong> 님 로그인중... 
		                 <a href="cafe/private/insertimg.do"></a>
		                 <a href="signout.do">SignOut</a>
		                </div>    
	                     </c:if>
	              </c:when>
	               </c:choose>
                 
                  <c:choose>
	              <c:when test="${ empty id }">
	              <div >
			           <a href="" data-toggle="modal" data-target="#myModal">SignIn</a><strong style="
                       color: #ffffff;"> or </strong>
			           <a href="" data-toggle="modal" data-target="#myModal3">SignUp</a>
			      </div>      
			      </c:when>
	              </c:choose>       
			           <c:choose>
	              <c:when test="${not empty id }">
                    <a class="glyphicon glyphicon-pencil" href="private/insertform.do">새글쓰기</a>
                         </c:when>
	              </c:choose>    
  </div> 

     
<hr />  
<div class="container" style="text-align: center;">    



<c:choose>
	
	<c:when test="${not empty dto.saveFileName}">  
	  
	     <img data-toggle="modal" data-target="#myModal2" id="M_img"  src="${pageContext.request.contextPath }/upload/${dto.saveFileName}"/>
       
    </c:when>
    <c:when test="${not empty id }">
      <c:if test="${empty dto.saveFileName}">
         <img data-toggle="modal" data-target="#myModal2" id="M_img3" src="${pageContext.request.contextPath }/resources/images/kkk.jpg" />
    </c:if>
     </c:when>
</c:choose>

<hr />
<div class="row">  
    <c:forEach var="tmp" items="${list }"> 
    <div id="col1" class="col-xs-4 col-sm-4 col-md-3">  
			<a id="a1" href="detail.do?num=${tmp.num }&writer=${tmp.writer}">${tmp.content}</a>
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
				<div  class="login-box well" id="dovBox">
			
                    
					<form action="signin.do?uri=${param.uri }" method="post"
						name="sForm" novalidate id="myform">
						<div class="form-group has-feedback">
							<label class="control-label" for="id">ID</label> 
							<input class="form-control" type="text" name="id" id="id" >
							<p  id="block0" class="help-block">아이디 또는 비밀번호를 다시 확인하세요.</p>
			                <span class="glyphicon form-control-feedback"></span>
                        </div>
						<div class="form-group">
							<label for="pwd">password</label> <input class="form-control"
							type="password" name="pwd" id="pwd" />
						</div>
						<div class="form-group">
						
							<button id="id2"  type="submit" class="btn btn-default btn-block m-t-md">SingIn</button>
						
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
		
		

<div class="login-box well" id="upbox">

		          
		   
					<form action="signup.do?uri=${param.uri }" method="post"
						name="sForm" novalidate id="myform">
						<div class="form-group has-feedback">
							<label class="control-label" for="id3">ID</label> 
							<input class="form-control" type="text" name="id" id="id3" >
							<p id="block" class="help-block">이미 사용중인 아이디 입니다.</p>
							<p id="block2" class="help-block">사용가능한 아이디 입니다.</p>
			                <span class="glyphicon form-control-feedback"></span>
                        </div>
						<div class="form-group">
							<label for="pwd">password</label> <input class="form-control"
							type="password" name="pwd" id="pwd" />
						</div>
						
						
						    <label class="control-label" for="id4"></label> 
							<input type="hidden" id="senderName" name="senderName" value="김강민회사">
							<input type="hidden" id="senderMail" name="senderMail" value="fjqngodys2@gmail.com"/>
							<label for="email">email</label>
							<input name="email" id="email" class="form-control"/>
							<input type="hidden" id="subject" name="subject" value="인증번호 입니다."/>
							<input  type="hidden" id="message" name="message"  />
							<p id="block4" class="help-block">인증번호가 전송됬습니다.</p>
							 <span class="glyphicon form-control-feedback"></span>
							
							
							<button style="color: #000000;" id="checkBtn10">인증전송</button><br />
					        <span style="color:red;">${message }</span>  
							<label for="">인증</label> <input class="form-control"
							type="text" id="message2" name="message2" />
							<button style="color: #000000;" id="checkBtn12"  type="submit" >인증확인</button>
							<button id="id2"  type="submit" class="btn btn-default btn-block m-t-md">SingUp</button>
						
						
						
						
		 </form>
     </div> 
   </div> 
</div> 



<!-- 동적으로 띄울 Modal 준비 -->
<div id="myModal2" class="modal fade" style="top: 350px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="filebox">
				<form action="insert2.do" method="post" enctype="multipart/form-data">
	            <input type="hidden" name="writer" value="${id }"/>
	            <input type="hidden" name="title" id="title" value="zzz"/><br/>
				<label for="ex_file">사진 업로드</label>
				<input type="file" name="file" id="ex_file" />
				<button id="fileBtn" style="width: 100%;" type="submit">업로드</button>
                </form>
			  
			</div>
		</div>
	</div>
</div>
<!-- 검색어 관련 form -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

<script>
	$("p").find('img').addClass("img-thumbnail").removeAttr('height:auto');
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







