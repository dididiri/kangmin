<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset=" UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, 
minimum-scale=1, maximum-scale=1, user-scalable=no">


<title>/views/cafe/detail.jsp</title>
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
	
}

textarea {
	background: initial;
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
	text-decoration: none;
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

a:hover{
    color: #ffffff;
 }
 #fileBtn2 {
		width: 100%;
		background-color: #fdfdfd;
		padding: .5em .75em;
		border: 1px solid #ebebeb;
		font-size: 15pt;
		font-weight: bold;
	}

</style>
</head>
<body>
   
	<div class="container">
	 <br />
	     
	
		<%-- <h3></h3>
		로그인한 회원이 작성한 글이라면 수정 링크를 제공해준다.
		<c:if test="${id eq dto.writer }">
			<a style="text-decoration: none;" href="private/updateform.do?num=${dto.num }">수정</a>
			<a style="text-decoration: none;">삭제</a>
		</c:if> --%>


		<div class="imgbox" style="padding-top: 10px;height: 67px; padding-left: 12px;">
			<a style="text-decoration: none;" href="list2.do?writer=${dto.writer }">
			<img data-toggle="modal"
				data-target="#myModal2" id="M_img2"
				src="${pageContext.request.contextPath }/upload/${dto1.saveFileName}" />${dto.writer }
			      
                            <c:if test="${dto.regdate < 59}">
                             <c:if test="${dto.regdate > -1}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">${dto.regdate }분</div>    
                             </c:if>
                            </c:if>
                            <c:if test="${59 < dto.regdate}">
                                   <c:if test="${119> dto.regdate  }">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">1시간</div>    
                                   </c:if>   
                            </c:if>
                             <c:if test="${120< dto.regdate  }">
                                <c:if test="${179> dto.regdate  }">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">2시간</div>    
                                </c:if>
                             </c:if>
                             <c:if test="${180 <dto.regdate}">
                                <c:if test="${239> dto .regdate  }"> 
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">3시간</div>    
                                </c:if> 
                            </c:if>
                             <c:if test="${240 <dto.regdate}">
                                 <c:if test="${299 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">4시간</div>    
                                 </c:if>
                            </c:if>
                             <c:if test="${300 <dto.regdate}">
                                   <c:if test="${359 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">6시간</div>    
                                   </c:if>
                            </c:if>
                              <c:if test="${360 <dto.regdate}">
                                    <c:if test="${419 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">7시간</div>    
                                    </c:if>
                            </c:if>
                              <c:if test="${420 <dto.regdate}">
                                     <c:if test="${479 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">8시간</div>    
                                     </c:if>
                            </c:if>
                              <c:if test="${480 <dto.regdate}">
                                     <c:if test="${539 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">9시간</div>    
                                     </c:if>
                            </c:if>
                              <c:if test="${540 <dto.regdate}">
                                      <c:if test="${599 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">10시간</div>    
                                      </c:if>
                            </c:if>
                              <c:if test="${600 <dto.regdate}">
                                      <c:if test="${659 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">11시간</div>    
                                      </c:if>
                            </c:if>
                              <c:if test="${660 <dto.regdate}">
                                       <c:if test="${719 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">12시간</div>    
                                        </c:if>
                            </c:if>
                              <c:if test="${720 <dto.regdate}">
                                        <c:if test="${879 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">13시간</div>    
                                         </c:if>
                            </c:if>
                              <c:if test="${880 <dto.regdate}">
                                         <c:if test="${939 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">14시간</div>    
                                          </c:if>
                            </c:if>
                              <c:if test="${940 <dto.regdate}">
                                          <c:if test="${999 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">15시간</div>    
                                          </c:if>
                            </c:if>
                              <c:if test="${1000 <dto.regdate}">
                                          <c:if test="${1059 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">16시간</div>    
                                          </c:if>
                            </c:if>
                             <c:if test="${1060 <dto.regdate}">
                                          <c:if test="${1119 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">17시간</div>    
                                          </c:if>
                            </c:if>
                             <c:if test="${1120 <dto.regdate}">
                                          <c:if test="${1179 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">18시간</div>    
                                          </c:if>  
                            </c:if>
                             <c:if test="${1180 <dto.regdate}">
                                          <c:if test="${1239 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">19시간</div>    
                                          </c:if>
                            </c:if>
                             <c:if test="${1240 <dto.regdate}">
                                          <c:if test="${1299 >dto.regdate}"> 
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">20시간</div>    
                                          </c:if>
                            </c:if>
                             <c:if test="${1300 <dto.regdate}">
                                          <c:if test="${1359 >dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">21시간</div>    
                                          </c:if>
                            </c:if>
                             <c:if test="${1360 <dto.regdate}">
                                          <c:if test="${1419 > dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">22시간</div>    
                                          </c:if>
                            </c:if>
                             <c:if test="${1420 <dto.regdate}">
                                          <c:if test="${1489 > dto.regdate}">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">23시간</div>    
                                           </c:if>
                            </c:if>
                           
                          
                          <c:if test="${-2 > dto.regdate   }">
                             <div style="text-align: end; position: relative; top: -34px; padding-right: 12px; font-size: 15px;">1일</div>    
                            </c:if>			
			</a>
			
		</div>

		<img src="${pageContext.request.contextPath }/upload/${dto.content}" alt="" />

		<div class="titlebox">
			<p id="result" style="margin-top: 15px; margin-bottom: 10px;">좋아요
				${dto.viewCount }개</p>
			<a style="text-decoration: none;" href="list2.do?writer=${dto.writer }">${dto.writer }</a>
			${dto.title }

			<div class="comments">
				<c:forEach var="tmp" items="${commentList }">
					<div class="comment"
						<c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:20px"</c:if>>
						<c:if test="${tmp.num ne tmp.comment_group }">
							<div class="reply_icon"></div>
						</c:if>
						<div>
							<a style="text-decoration: none;" href="list2.do?writer=${tmp.writer}"
								style="float: left; margin-right:0.5em;">${tmp.writer }</a>
                            <span style="margin-bottom: 7px; margin-top: 7px;">${tmp.content }</span>   
						</div>
						
						<form action="comment_insert.do" method="post">
							<!-- 덧글 작성자 -->
							<input type="hidden" name="writer" value="${id }" />
							<!-- 덧글 그룹 -->
							<input type="hidden" name="ref_group" value="${dto.num }" />
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<input type="hidden" name="comment_group"
								value="${tmp.comment_group }" />
							<textarea name="content"></textarea>
							<button id="btn1" type="submit">등록</button>
						</form>
					</div>

				</c:forEach>
			</div>
			<div class="comment_form">
				<form action="comment_insert.do" method="post"
					style="margin-right: 1.5em;">
					<!-- 덧글 작성자 -->
					<input type="hidden" name="writer" value="${id }" />
					<!-- 덧글 그룹 -->
					<input type="hidden" name="ref_group" value="${dto.num }" />
					<!-- 덧글 대상 -->
					<input type="hidden" name="target_id" value="${dto.writer }" />
					<hr />
					<span><a  onclick="count()" class="glyphicon glyphicon-heart"
						id="heart" style="text-decoration: none; font-size: 22px;"></a></span> <input
						style="margin-bottom: 18px; font-size: 20px; margin-left: 0.5em;"
						id="inputText" type="text" name="content" placeholder="댓글 달기..."></input>
                        <c:if test="${id eq dto.writer }">
                        <a data-toggle="modal" data-target="#myModal2" 
                        href="#" class="glyphicon glyphicon-option-horizontal" 
                        style="text-decoration: none; font-size: 25px; float: right;"></a>
                        </c:if>
					<button id="btn1" type="submit" style="display: none;">등록</button>
				</form>
			</div>
		</div>
	</div>
	<br />
	
	
	<div id="myModal2" class="modal fade" style="top: 238px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="filebox">
					
						<button id="fileBtn2" style="width: 100%; margin-top: -6px;"
							type="submit">수정</button>
						<button class="deleteBtn"  id="fileBtn2" style="width: 100%; margin-top: -6px;"
							>삭제</button>
					
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<script>
		var num = 0;
		function count() {
			num++;

			if (num <= 2) {
				heart.style.color = "red";
				location.href = "likeup.do?num=${dto.num}&writer=${dto.writer}";
			} else {
				return false;
			}
		}
	
		

		$(".deleteBtn").click(function() {
			var isDelete = confirm("글을 삭제 하시겠습니까?");
			if (isDelete) {
				location.href = "private/delete.do?num=${dto.num}&writer=${dto.writer}";
			}
  
		});
	</script>
</body>
</html>









