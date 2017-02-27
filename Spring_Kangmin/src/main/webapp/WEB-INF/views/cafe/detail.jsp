<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/detail.jsp</title>
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
     
    @media (min-width: 992px ){
        .container{
                width: 620px;        
        }
    }
    #M_img2{
       width: 37px;
       height: 35px;
       border-radius: 50%;
    }
</style>
</head>
<body>
<div class="container">
<h1>상세글 내용 페이지</h1>
<%-- 로그인한 회원이 작성한 글이라면 수정 링크를 제공해준다. --%>
<c:if test="${id eq dto.writer }">
	<a href="private/updateform.do?num=${dto.num }">수정</a>
	<a href="javascript:deleteCheck()">삭제</a>
</c:if>
<table>
	<tr>
		<th>글번호</th>
		<td>${dto.num }</td>
	</tr>
	<tr>
		
		<td><img data-toggle="modal" data-target="#myModal2" id="M_img2"  src="${pageContext.request.contextPath }/upload/${dto1.saveFileName}"/>${dto.writer }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.title }</td>
	</tr>
</table>
  
<div class="content">${dto.content }</div>

<div class="comments">
	<c:forEach var="tmp" items="${commentList }">
		<div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:100px"</c:if> >	
			<c:if test="${tmp.num ne tmp.comment_group }">
				<div class="reply_icon"></div>
			</c:if>
			<div>		
				<strong>from ${tmp.writer }</strong>
				${tmp.regdate }<br/>
				<strong>to ${tmp.target_id }</strong>
				<a href="javascript:">답글</a>
			</div>
			<textarea rows="3" disabled>${tmp.content }</textarea><br/>
			<form action="comment_insert.do" method="post">
				<!-- 덧글 작성자 -->
				<input type="hidden" name="writer" value="${id }"/>
				<!-- 덧글 그룹 -->
				<input type="hidden" name="ref_group" value="${dto.num }" />
				<!-- 덧글 대상 -->
				<input type="hidden" name="target_id" value="${tmp.writer }" />
				<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
				<textarea name="content"></textarea>
				<button id="btn1" type="submit">등록</button>
			</form>
		</div>
		
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
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
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
</script>
</body>
</html>









