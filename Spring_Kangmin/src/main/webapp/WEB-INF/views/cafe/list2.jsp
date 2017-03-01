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
   
     body{  
    	background-image: url(../resources/images/bg3.jpg);
    }
    a img{
	    max-width: 100%;
	    width: 280px;  
	    height: 360px !important;  
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
    #M_img3{
        border-radius: 50%;
	    position: relative;
	    max-width: 100%;
	    padding: 4px;
	    background-color: #fff;
	    width: 181px;
	    height: 186px;
	    text-align: center;
    }
   
</style>
</head>
<body >      
<hr />

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
    <c:forEach var="tmp" items="${list2 }"> 
    <div id="col1" class="col-xs-4 col-sm-4 col-md-3">  
			<a id="a1" href="detail.do?num=${tmp.num }&writer=${tmp.writer}">${tmp.content}</a>
	</div>
	</c:forEach>
</div>
</div>


<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

<script>
$("p").find('img').addClass("img-thumbnail");	
</script>
</body>
</html>







