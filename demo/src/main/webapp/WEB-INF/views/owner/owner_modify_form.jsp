<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이게 왜 안되노</title>

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 우편번호검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="../css/index.css?after" rel="stylesheet" />


<script type="text/javascript">

 function send(f){
	 
	 var o_name 		= f.o_name.value.trim();
	 var o_pwd		    = f.o_pwd.value.trim();
	 var o_addr 		= f.o_addr.value.trim();
	 
	 if(o_name==''){
		 alert('이름을 입력하세요!!');
		 f.o_name.value='';
		 f.o_name.focus();
		 return;
	 }

	 
	 if(o_pwd==''){
		 alert('비밀번호를 입력하세요!!');
		 f.o_pwd.value='';
		 f.o_pwd.focus();
		 return;
	 }
	 
	 if(o_addr==''){
		 alert('주소를 입력하세요!!');
		 f.o_addr.value='';
		 f.o_addr.focus();
		 return;
	 }	 
	 f.action = "modify.do";//MemberInsertAction
	 f.submit(); //전송(제출)
	 
 }

 function find_addr(){
	 
	 new daum.Postcode({
	        oncomplete: function(data) {
	  
	          $("#o_addr").val(data.address);
	            
	            
	        }
	    }).open();
	 
 }
 
</script>

</head>
<body>
	<section class="mainBanner">
        <h1 class="text">
         수정
        </h1>
      </section>


<form class="form-inline">

	<input type="hidden" name="o_idx"  value="${ vo.o_idx }"> 

  <div id="box">
  	<div class="panel panel-primary">
      <div class="panel-heading"><h4>회원수정</h4></div>
      <div class="panel-body">
        
	        <div class="seperator">
	           <label>판매자 : </label>
	           <input class="form-control" name="o_name" placeholder="이름을 입력해 주세요.">
	        </div>
	        
	        <div class="seperator">
	           <label>비밀번호 : </label>
	           <input class="form-control" type="password" name="o_pwd"  placeholder="비밀번호를 입력해 주세요.">
	        </div>
	        
	        <div class="seperator">
	           <label>우편번호 : </label>

	           <input class="form-control" 
	                  name="o_addr" id="o_addr" placeholder="주소를 입력해 주세요.">

	           <input class="btn  btn-info" type="button"  value="검색"
	                  onclick="find_addr();" >
	        </div>
	        <hr>
	        <div style="text-align: center">
	           <input class="btn  btn-primary" type="button" value="회원수정"
	                  onclick="send(this.form);">
	                  
	           <input class="btn  btn-success" type="button" value="목록보기"
	                  onclick="location.href='../product/list.do'">
	        </div>
	        
      </div>
  	</div>
  	
  </div>
  
</form>

</body>
</html>