<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, 
minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>/views/cafe/list.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
body {
	background-image: url(../resources/images/bg3.jpg);
}

a img {
	max-width: 100%;
	width: 100%;
	height: 360px !important;
}

#M_img {
	border-radius: 50%;
	position: relative;
	max-width: 100%;
	padding: 4px;
	background-color: #fff;
	width: 181px;
	height: 186px;
	margin-top: 60px;
}

#M_img3 {
	border-radius: 50%;
	position: relative;
	max-width: 100%;
	padding: 4px;
	background-color: #fff;
	width: 181px;
	height: 186px;
	text-align: center;
	margin-top: 60px;
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

.filebox {
	position: relative;
	top: -21px;
	height: 70px;
}

.filebox2 {
	position: relative;
	height: 70px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

#fileBtn {
	width: 100%;
	background-color: #fdfdfd;
	padding: .5em .75em;
	border: 1px solid #ebebeb;
	font-size: 15pt;
	font-weight: bold;
	border-radius: 4px;
}

#fileBtn2 {
	width: 100%;
	background-color: #fdfdfd;
	padding: .5em .75em;
	border: 1px solid #ebebeb;
	font-size: 15pt;
	font-weight: bold;
}

h2 {
	color: rgba(255, 255, 255, 0.65);
	margin-bottom: 20px;
	margin-top: 60px;
	font-size: x-large;
}

#icon {
	color: rgba(255, 255, 255, 0.65);
	font-size: 25px;
	border: solid 1px rgba(255, 255, 255, 0.25);
	background-color: rgba(255, 255, 255, 0.075);
	border-radius: 50%;
	padding: 0.5em;
	margin-left: 15px;
	margin-right: 15px;
	margin-bottom: 15px;
	margin-top: 15px;
}

ul a {
	color: #000000 !important;
	font-size: -25px !important;
}

.dropdown-menu {
	position: absolute;
	left: 688px;
	top: 450px;
}

@media ( max-width : 992px) {
	p {
		margin: -12px -15px -8px;
	}
	a img {
		max-width: 100%;
		width: 100%;
		height: 175px !important;
	}
	.img-thumbnail {
		padding: 0px;
		border-radius: 0px;
		background-color: #fff;
		border: 0.5px solid #fff;
	}
	#M_img {
		border-radius: 50%;
		position: relative;
		max-width: 100%;
		padding: 2px;
		background-color: #fff;
		width: 150px;
		height: 150px;
		margin-top: 60px;
	}
	h2 {
		color: rgba(255, 255, 255, 0.65);
		margin-bottom: 20px;
		margin-top: 50px;
		/* font-size: x-small; */
		/* font-size: large; */
		font-size: larger;
	}
	#icon {
		color: rgba(255, 255, 255, 0.65);
		font-size: 25px;
		border: solid 1px rgba(255, 255, 255, 0.25);
		background-color: rgba(255, 255, 255, 0.075);
		border-radius: 50%;
		padding: 0.3em;
		margin-left: 10px;
		margin-right: 10px;
		margin-bottom: 10px;
		margin-top: 10px;
	}
}
</style>
</head>
<body>




	<div class="container" style="text-align: center;">
		<c:choose>




			<c:when test="${id eq dto.writer }">
				<c:if test="${not empty dto.saveFileName}">
					<img data-toggle="modal" data-target="#myModal2" id="M_img"
						src="${pageContext.request.contextPath }/upload/${dto.saveFileName}" />
				</c:if>
			</c:when>
			<c:when test="${empty dto.saveFileName }">

				<img data-toggle="modal" data-target="#myModal2" id="M_img3"
					src="${pageContext.request.contextPath }/resources/images/kkk.jpg" />

			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${id ne dto.writer }">
				<c:if test="${not empty dto.saveFileName}">
					<img id="M_img"
						src="${pageContext.request.contextPath }/upload/${dto.saveFileName}" />
				</c:if>
			</c:when>
			<c:when test="${id ne dto.writer }">
				<c:if test="${ empty dto.saveFileName}">
					<img id="M_img3"
						src="${pageContext.request.contextPath }/resources/images/kkk.jpg" />
				</c:if>
			</c:when>
		</c:choose>
		<h2>Hello Welcome to Kim Kang-min's personal portfolio instagram
			First upload your profile photo and write i t to let your friends
			know your nearest point.</h2>
		<c:if test="${id eq dto.writer }">
			<div>

				<a id="icon" class="glyphicon glyphicon-pencil"
					href="private/insertform.do"></a> <a id="icon"
					class="glyphicon glyphicon-home" href="list.do?writer=${ id}"></a>
				<a id="icon" class="glyphicon glyphicon-option-vertical"
					data-toggle="modal" data-target="#myModal5"></a> <a id="icon"
					class="glyphicon glyphicon-envelope" href="#"></a>

			</div>
		</c:if>
		<c:if test="${id != dto.writer }">
			<div>

				<a id="icon" class="glyphicon glyphicon-heart" href="#"></a> <a
					id="icon" class="glyphicon glyphicon-home"
					href="list.do?writer=${ id}"></a> <a id="icon"
					class="glyphicon glyphicon-user" href="#"></a> <a id="icon"
					class="glyphicon glyphicon-envelope" href="list.do?writer=${ id}"></a>

			</div>
		</c:if>
		<hr />

		<div class="row">
			<c:forEach var="tmp" items="${list2 }">
				<div id="col1" class="col-xs-4 col-sm-4 col-md-3 col-lg-3">
					<a id="a1" href="detail.do?num=${tmp.num }&writer=${tmp.writer}">${tmp.content}</a>
				</div>
			</c:forEach>
		</div>
	</div>


	<!-- 프로필  Modal 준비 -->
	<div id="myModal5" class="modal fade" style="top: 238px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="filebox2">
					<button id="fileBtn" class="singoutBtn2" style="width: 100%;"
						type="submit">프로필편집</button>
					<button id="fileBtn" class="singoutBtn1" style="width: 100%;"
						type="submit">로그아웃</button>
					<button id="fileBtn" data-dismiss="modal"
						style="width: 100%; margin-top: -4px;" type="submit">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 프로필  Modal 준비 -->
	<div id="myModal2" class="modal fade" style="top: 238px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="filebox">
					<form action="insert3.do" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="writer" value="${id }" /> <input
							type="hidden" name="title" id="title" value="zzz" /><br /> <label
							for="ex_file">사진 선택</label> <input type="file" name="file"
							id="ex_file" />
						<button id="fileBtn" style="width: 100%; margin-top: -6px;"
							type="submit">업로드</button>
					</form>
				</div>
			</div>
		</div>
	</div>



	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>

	<script>
		$("p").find('img').addClass("img-thumbnail");

		$(".singoutBtn1").click(function() {

			location.href = "signout.do";

		});

		$(".singoutBtn2").click(function() {

			location.href = "../users/private/updateform.do";

		});
	</script>
</body>
</html>







