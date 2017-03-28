<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset=" UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, 
minimum-scale=1, maximum-scale=1, user-scalable=no">


<title>/views/cafe/detail2.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
.content {
	border: 0.5px solid #cecece;
	height: 602px;
}

textarea {
	width: 100%;
}

.comment form {
	display: none;
}

.comment {
	position: relative;
}

.comment .reply_icon {
	position: absolute;
	width: 20px;
	height: 20px;
	top: 0;
	left: -20px;
	border-left: 2px solid green;
	border-bottom: 2px solid green;
}

img {
	width: 100%;
	height: 600px;
}

body {
	background-image: url(../resources/images/bg3.jpg);
	color: #ffffff;
}

textarea {
	background: initial;
}

.comment form {
	display: none;
}

.comment {
	position: relative;
}

.comment .reply_icon {
	position: absolute;
	width: 20px;
	height: 20px;
	top: 0;
	left: -20px;
	border-left: 2px solid green;
	border-bottom: 2px solid green;
}

#btn1 {
	color: #000000;
}

@media ( min-width : 620px) {
	.container {
		width: 620px;
	}
	#M_img2 {
		width: 37px;
		height: 35px;
		border-radius: 50%;
	}
}

@media ( min-width : 992px ) {
	.container {
		width: 620px;
	}
}

#M_img2 {
	width: 45px;
	height: 45px;
	border-radius: 50%;
}

.titlebox {
	width: 100%;
	padding-left: 20px;
	border: 1px solid #cecece;
	color: #ffffff;
}

.imgbox {
	width: 100%;
	border: 1px solid #cecece;
}

a {
	color: #ffffff;
}

@media ( max-width : 768px) {
	.content {
		border: 0.5px solid #cecece;
		height: 381px;
	}
	img {
		width: 100%;
		height: 380px;
	}
}

#inputText {
	background: initial;
	border: none;
}

#heart {
	font-size: 20px;
}

 a:hover{
    color: #ffffff;
 }
</style>
</head>
<body>
	<div class="container">
		<h3></h3>
		<%-- 로그인한 회원이 작성한 글이라면 수정 링크를 제공해준다. --%>
		<%-- <c:if test="${id eq dto.writer }">
	<a href="private/updateform.do?num=${dto.num }">수정</a>
	<a href="javascript:deleteCheck()">삭제</a>
</c:if> --%>

		<c:forEach var="tmp" items="${list3}">
			<br />
			<br />
			<div class="imgbox" style="padding-top: 10px; height: 67px; padding-left: 12px;">
				<a style="text-decoration: none;" href="list2.do?writer=${tmp.writer }"> <c:forEach var="img"
						items="${list5}">
						<c:if test="${tmp.writer eq img.writer }">
							<img class="${tmp.num }" data-toggle="modal"
								data-target="#myModal2" id="M_img2"
								src="${pageContext.request.contextPath }/upload/${img.saveFileName}" />${tmp.writer }
                            
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">${tmp.regdate }분</div>    
                    </c:if>
					</c:forEach>
   
				</a>
			</div>


			<div class="content"
				<c:if test="${tmp.num eq param.num }">id="clickedImg"</c:if>><img src="${pageContext.request.contextPath }/upload/${tmp.content}" alt="" /></div>
			<div class="titlebox">
				<p id="result" style="margin-top: 15px; margin-bottom: 10px;">
					<a style="text-decoration: none;" href=""></a>좋아요 ${tmp.viewCount }개
				</p>
				<a style="text-decoration: none;" href="list2.do?writer=${tmp.writer }">${tmp.writer }</a>
				${tmp.title }
				
                
				<div class="comments">
					<c:forEach var="ip" items="${commentList }">
						<c:choose>
							<c:when test="${ ip.ref_group eq tmp.num}">
								<div class="comment"
									<c:if test="${ip.num ne ip.comment_group }">style="margin-left:20px"</c:if>>
									<c:if test="${ip.num ne ip.comment_group }">
										<div class="reply_icon"></div>
									</c:if>
									<div>
										<a style="text-decoration: none;" href="list2.do?writer=${ip.writer}"
											style="float: left; margin-right: 0.5em;">${ip.writer }</a>
									</div>
									<div style="margin-bottom: 7px; margin-top: 7px;">${ip.content }</div>
									<form action="comment_insert2.do" method="post">
										<!-- 덧글 작성자 -->
										<input type="hidden" name="writer" value="${id }" />
										<!-- 덧글 그룹 -->
										<input type="hidden" name="ref_group" value="${ip.ref_group }" />
										<!-- 덧글 대상 -->
										<input type="hidden" name="target_id" value="${ip.writer }" />
										<input type="hidden" name="comment_group"
											value="${ip.comment_group }" />
										<textarea name="content"></textarea>
										<button id="btn1" type="submit">등록</button>
									</form>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>

					<div class="comment_form">
						<form action="comment_insert2.do" method="post"
							style="margin-right: 1.5em;">
							<!-- 덧글 작성자 -->
							<input type="hidden" name="writer" value="${id }" />
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${tmp.num }" />
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<hr />
							<span><a style="text-decoration: none;"
								href="likeup2.do?num=${tmp.num}&writer=${tmp.writer}"
								class="glyphicon glyphicon-heart" id="heart"></a></span> <input
								style="margin-bottom: 18px; font-size: 20px; margin-left: 0.5em;"
								id="inputText" type="text" name="content" placeholder="댓글 달기..."></input>
							<button id="btn1" type="submit" style="display: none;">등록</button>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>

	<input type="text" id="getFocus" value="${num }">
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<script>
		window.onload = function() {
			var selectImg = $("#getFocus").val();

		}

		var inputId = $("#id10").val();

		function deleteCheck() {
			var isDelete = confirm("글을 삭제 하시겠습니까?");
			if (isDelete) {
				location.href = "private/delete.do?num=${dto.num}";
			}
		}

		var a = $("#clickedImg").offset().top;
		$("body").scrollTop(a + 100);
	</script>
</body>
</html>









