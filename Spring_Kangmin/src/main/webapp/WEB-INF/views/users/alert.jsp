<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/alert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<style>
      body{  
    	background-image: url(../resources/images/bg3.jpg);
    }
    a{
      color: #ffffff;
    }
    
    h3{
      color: #ffffff;
    }
</style>
</head>
<body>
<div class="container">
<h3>${msg }</h3>
   <a href="${redirectUri }">확인</a>
</div>
</body>
</html>