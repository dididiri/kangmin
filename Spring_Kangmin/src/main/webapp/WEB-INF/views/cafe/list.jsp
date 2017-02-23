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
	#imgi1{
	   
	   float: left;
	   width: 150px;
       height: 70px;
       margin-top: -27px;
	}
	a img{
	  max-width: 100%;
	      width: 350px;  
	  
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
    background-image: url(../resources/images/bg.jpg);
    }
   
</style>
</head>
<body style="background-image: ">   
<hr />
<div class="com1" id="com1">
    
    <!-- <img id="imgi1" src="../resources/images/12345.png" alt="" /> -->
    <div class="con1">
     <form action="list.do" method="post" id="keywordForm">
	
	<select name="condition" id="condition">
		<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
		<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
		<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
	</select>
	<input type="text" name="keyword" placeholder="검색어" 
		value="${keyword }"/>
	<button type="submit">검색</button>
  </form>
  </div>
  
</div>
<hr />
<div class="container">

<a href="private/insertform.do">새글쓰기</a>
<hr />
<div class="row">
    <c:forEach var="tmp" items="${list }"> 
    <div id="col1" class="col-xs-12 col-sm-4 col-md-4">
			<a id="a1" href="detail.do?num=${tmp.num }">${tmp.content}</a>
	</div>
	</c:forEach>
</div>
</div>



<!-- 검색어 관련 form -->

</body>
</html>







