<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset=" UTF-8" name="viewport" 
content="width=device-width, initial-scale=1, 
minimum-scale=1, maximum-scale=1, user-scalable=no">


<title>/views/cafe/detail2.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style>
	.content{ 
		border: 0.5px solid #cecece;
		height: 602px;
	}
	textarea{
		    width: 100%;
		
	}     
	.comment form{
		display: none;
	}
	.comment{
		position: relative;
	}
	.comment .reply_icon{
		position: absolute;
		width: 20px;
		height: 20px;
		top:0;
		left:-20px;
		border-left: 2px solid green;
		border-bottom: 2px solid green;
	}
	 img{
	   width: 100%;
       height: 600px; 
	  
	}
	 body{  
    background-image: url(../resources/images/bg3.jpg);
        color: #ffffff;
    }
    
    textarea{
     background: initial;
    }
    #btn1{
     color: #000000;
    }
    
    @media (min-width: 620px){

    .container{
      width: 620px;
      }
      #M_img2{
       width: 37px;
       height: 35px;
       border-radius: 50%;
       
      }         
    }                     
     
    @media (min-width: 992px ){
        .container{
                width: 620px;        
        }
    }
    #M_img2{
       width: 45px;
       height: 45px;
       border-radius: 50%;
       
    }
    .titlebox{
    width: 100%;
   
    border: 1px solid #cecece;
    color: #ffffff;
   
    
    }
    .imgbox{
          width: 100%;
    border: 1px solid #cecece;
    }
    a{
      color: #ffffff;
     
    }
    @media (max-width: 768px){
	  .content {
	    border: 0.5px solid #cecece;
	    height: 381px;
	}
	img {
    width: 100%;
    height: 380px;
     }
    
   }
   
    
</style>
</head>
<body>
<div class="container">
<h3></h3>
<%-- 로그인한 회원이 작성한 글이라면 수정 링크를 제공해준다. --%>
<c:if test="${id eq dto.writer }">
	<a href="private/updateform.do?num=${dto.num }">수정</a>
	<a href="javascript:deleteCheck()">삭제</a>
</c:if>

<c:forEach var="tmp" items="${list3}">	

	<div class="imgbox"><a href="list2.do?writer=${tmp.writer }">
	
	<c:forEach var="img" items="${list5}">	
	<c:if test="${tmp.writer eq img.writer }">
	<img class="${tmp.num }" data-toggle="modal" data-target="#myModal2" id="M_img2" src="${pageContext.request.contextPath }/upload/${img.saveFileName}"/>${tmp.writer }
    </c:if>
    </c:forEach>
   
    </a></div>

    
<div class="content" <c:if test="${tmp.num eq param.num }">id="clickedImg"</c:if>>${tmp.content }</div>
<div class="titlebox">${tmp.title }</div>

<div class="comments">
	<c:forEach var="ip" items="${commentList }">
	<c:choose>
	   <c:when test="${ ip.ref_group eq tmp.num}"> 
		<div class="comment" <c:if test="${ip.num ne ip.comment_group }">style="margin-left:100px"</c:if> >	
			<c:if test="${ip.num ne ip.comment_group }">
				<div class="reply_icon"></div>
			</c:if>
			<div>		
				<strong>from ${ip.writer }</strong>
				${ip.regdate }<br/>
				<strong>to ${ip.target_id }</strong>
				<a href="javascript:">답글</a>
				
			</div>
			<textarea rows="3" disabled>${ip.content }</textarea><br/>
			<form action="comment_insert.do" method="post">
				<!-- 덧글 작성자 -->
				<input type="hidden" name="writer" value="${id }"/>
				<!-- 덧글 그룹 -->
				<input type="hidden" name="ref_group" value="${dto.num }" />
				<!-- 덧글 대상 -->
				<input type="hidden" name="target_id" value="${ip.writer }" />
				<input type="hidden" name="comment_group" value="${ip.comment_group }" />
				<textarea name="content"></textarea>
				<button id="btn1" type="submit">등록</button>
			</form>
		</div>
	  </c:when>
	</c:choose> 
	</c:forEach>

	<div class="comment_form">
		<form action="comment_insert.do" method="post">
			<!-- 덧글 작성자 -->
			<input type="hidden" name="writer" value="${id }"/>
			<!-- 덧글 그룹 -->
			<input type="hidden" name="ref_group" value="${dto.num }" />
			<!-- 덧글 대상 -->
			<input type="hidden" name="target_id" value="${dto.writer }" />
			<textarea rows="2" name="content"></textarea>
			<button  id="btn1" type="submit">등록</button>
		</form>
	</div>
</div>

</c:forEach>
</div>

<input type="text" id="getFocus" value="${num }">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
	window.onload = function(){
		var selectImg = $("#getFocus").val();
		
		
	}
	var inputId=$("#id10").val();
	
	
	function deleteCheck(){
		var isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.do?num=${dto.num}";
		}
	}

	
	//덧글 달기 혹은 취소 버튼을 눌렀을때 실행할 함수 등록 
	$(".comment a").click(function(){
		if($(this).text()=="답글"){
			$(this)
			.text("취소")
			.parent()
			.parent()
			.find("form")
			.slideToggle();	
		}else{
			$(this)
			.text("답글")
			.parent()
			.parent()
			.find("form")
			.slideToggle();
		}
	});
	
	function deleteCheck(){
		var isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.do?num=${dto.num}";
		}
	}
	
	var a=$("#clickedImg").offset().top;
	$("body").scrollTop(a-150);
</script>
</body>
</html>









