<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" UTF-8" name="viewport" 
content="width=device-width, initial-scale=1, 
minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>views/cafe/private/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css"/>
<!-- SmartEditor 관련 javascript 로딩 -->
<script src="${pageContext.request.contextPath }/
	SmartEditor/js/HuskyEZCreator.js"></script>
</head>
<style>
     body{  
    	background-image: url(../../resources/images/bg3.jpg);
    	
    }
     h3 {
       color :#ffffff;
    }
    th{
        color :#ffffff;
    }
    
    td{
       color :#ffffff;
    }
    body {margin: 10px;}
	.where {
	  display: block;
	  margin: 25px 15px;
	  font-size: 11px;
	  color: #000;
	  text-decoration: none;
	  font-family: verdana;
	  font-style: italic;
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
	
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
	    padding: .5em .75em;
	    font-size: inherit;
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #f5f5f5;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	  -webkit-appearance: none; 
	  -moz-appearance: none;
	  appearance: none;
	}
	
	/* imaged preview */
	.filebox .upload-display {
	    margin-bottom: 5px;
	}
	
	@media(min-width: 768px) {
	    .filebox .upload-display {
	        display: inline-block;
	        margin-right: 5px;
	        margin-bottom: 0;
	    }
	}
	
	.filebox .upload-thumb-wrap {
	    display: inline-block;
	    
	    vertical-align: middle;
	    border: 1px solid #ddd;
	    
	    background-color: #fff;
	}
	
	.filebox .upload-display img {
	    display: block;
	    max-width: 100%;
	    width: 433px;
	    height: 460px;
	}
	
	.filebox.bs3-primary label {
	  color: #fff;
	  background-color: #337ab7;
	    border-color: #2e6da4;
	}
	  #M_img2{
       width: 42px;
       height: 42px;
       border-radius: 50%;
       margin-top:6px;
       
    }  
    #di1{
      display: none;
    }
    #di2{
      display: none;
    }
    #id5{
      display:none;
    }
      
    
</style>

<body>
<div class="container">
<h3>이미지 게시판 입력 페이지 입니다.</h3>
<br />

<form action="insert.do" method="post" enctype="multipart/form-data">
<div id="di1" style="
    border: 1px solid #fff;
    height: 55px;
    width: 435px;  
    position: relative;
    border-bottom: 0px;">  
    <img  id="M_img2"  src="${pageContext.request.contextPath }/upload/${dto2.saveFileName}"/>
    <a style="color:#ffffff;position: relative;top: 3px;">${id }</a>   
   </div>
<div  class="filebox bs3-primary preview-image">
<div  id="di2" style="
    border: 1px solid #fff;
    height: 48px;
    width: 435px;      
    position: relative;
    top: -6px;
    border-top: 0px;">
     
    <a style="color:#ffffff;position: relative;top: 11px;left: 11px;">${id }#</a>
    <input type="text" name="title" id="title" placeholder="제목 입력.." style=" width: 65%;
    position: relative;top: 11px;left: 14px;  background-color: initial;
    border: 0px; color:#ffffff;"/>
</div>    
	<input type="hidden" name="writer" value="${id }" />
	
	<input type="hidden" id="writer" 
		value="${id }" disabled="disabled"/><br/>
	
    <label   id="a" for="file" style="  color: #ffffff; position: relative;top: -23px;">이미지파일</label>
	<br />
	<input class="upload-hidden"  style="color: #ffffff;" type="file" name="file" id="file" /><br/>
	<button class="btn btn-info" id="id5" type="submit" style="
    position: relative;
    text-align: left;
    left: 363px;
    bottom: 123px;
">업로드</button>
    </div>	
</form>
</div>	  
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.1.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
$("#id5").click(function(){
	if($("#title").val() == ""){
		 alert("제목을 입력하세요.");
		
	  }else if($("#file").val() == ""){
		 alert("사진을 선택하세요.");
	     
      }else{
		  return true;
	  }
	return false;
});


$("#a").click(function(){
	 var b= document.getElementById("a");
	 var c= document.getElementById("id5");
	 var di1=document.getElementById("di1");
	 var di2=document.getElementById("di2");
	 var id5=document.getElementById("id5");
	 
	 if(b.style.display=='block'){
	        b.style.display = 'block';
	       
        }else{
	        b.style.display = 'none';
	        di1.style.display = 'block';
	        di2.style.display = 'block';
	        id5.style.display = 'block';
	        c.style.bottom = '104px';
	        
	    }
});



$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});

</script>
</body>
</html>








