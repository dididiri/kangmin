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
	img{
	  max-width: 100%;
	 
	}
	
</style>
</head>
<body>
<h3>카페 글 목록입니다.</h3>
<a href="private/insertform.do">새글쓰기</a>
<div class="container">
<div class="row">
    <c:forEach var="tmp" items="${list }"> 
    <div class="col-xs-4 col-sm-6 col-md-3">
			<a href="detail.do?num=${tmp.num }">${tmp.content}</a>
	</div>
	</c:forEach>
</div>
</div>



<!-- 검색어 관련 form -->
<form action="list.do" method="post" id="keywordForm">
	<label for="condition">검색 조건</label>
	<select name="condition" id="condition">
		<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
		<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
		<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
	</select>
	<input type="text" name="keyword" placeholder="검색어" 
		value="${keyword }"/>
	<button type="submit">검색</button>
</form>
</body>
</html>







