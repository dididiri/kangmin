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
   
</style>
</head>
<body >      
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


<!-- 프로필  Modal 준비 -->
<div id="myModal2" class="modal fade" style="top: 350px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="filebox">
				<form action="insert3.do" method="post" enctype="multipart/form-data">
	            <input type="hidden" name="writer" value="${id }"/>
	            <input type="hidden" name="title" id="title" value="zzz"/><br/>
				<label for="ex_file">프로필 선택</label>
				<input type="file" name="file" id="ex_file" />
				<button id="fileBtn" style="width: 100%;" type="submit">업로드</button>
                </form>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

<script>
$("p").find('img').addClass("img-thumbnail");	
</script>
</body>
</html>







