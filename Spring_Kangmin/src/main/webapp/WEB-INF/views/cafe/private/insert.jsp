<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/
	SmartEditor/js/HuskyEZCreator.js"></script>
</head>
<body>

<form action="insertimg.do" method="post">
	<input type="hidden" name="writer" value="${id }" />
	<textarea name="img" id="ir1" style="width:766px;height:412px;display:none"></textarea>
	<div>
		<input type="button" onclick="submitContents(this);" value="작성" />
	</div>	
</form>

</body>
</html>