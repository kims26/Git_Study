<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
  
  #box{
     width: 550px;
     margin: auto;
     margin-top: 60px;
  }
  
  label{
     margin-left: 10px;
     display: inline-block;
     width: 80px;
     text-align: right;
     
  }
  
  #id_message{
     display: inline-block;
     width: 200px;
     color : red;
     margin-left: 5px;
  }
  
  .seperator{
    margin-bottom: 10px;
  }

  

</style>

<script type="text/javascript">

 function check_id(){
	 //           document.getElementById("mem_id").value 
	 var admin_id = $("#admin_id").val();
	 
	 if(admin_id.length<3){
		 
		 $("#id_message").html("아이디는 3자리이상 입력")
		                 .css("color","red");
		 
		 //회원가입버튼 비활성화
		 $("#btn_register").attr("disabled",true);//비활성화
		 
		 return;
	 }
	 
	 
	 //서버 : 아이디 중복체크
	 $.ajax({
		 
		 url		:	"check_id.do",  		//MemberCheckIdAction
		 data		:	{"admin_id" : admin_id },	//parameter=>check_id.do?mem_id=hong
		 dataType	:	"json",
		 success	:	function(res_data){
			 //res_data = {"result" : true } or {"result" : false } 
			 if(res_data.result==true){
				
				 $("#id_message").html("사용가능한 아이디 입니다")
                                 .css("color","blue");
				 
				 //회원가입버튼 활성화
				 $("#btn_register").attr("disabled",false);//활성화
				 
			 }else{
				 
				 $("#id_message").html("이미 사용중인 아이디 입니다")
                                 .css("color","red");
				 //회원가입버튼 비활성화
				 $("#btn_register").attr("disabled",true);//비활성화
			 }
			 
			 
		 },
		 error		:	function(err){
			 
			 alert(err.responseText);
			 
		 }
	 });
	 
 }//end:check_id()
 
 
 

 
 function send(f){
	 
	 //입력항목 체크(이름/비번/우편번호/주소)
	 var admin_name 		= f.admin_name.value.trim();
	 var admin_pwd 		= f.admin_pwd.value.trim();

	 
	 if(admin_name==''){
		 alert('이름을 입력하세요!!');
		 f.admin_name.value='';
		 f.admin_name.focus();
		 return;
	 }
	 
	 if(admin_pwd==''){
		 alert('비밀번호를 입력하세요!!');
		 f.admin_pwd.value='';
		 f.admin_pwd.focus();
		 return;
	 }

     
	 
	 
	 
	 
	 f.action = "insert.do";
	 f.submit(); //전송(제출)
	 
 }
 
 
 
 
 


</script>





</head>
<body>
<form class="form-inline">
  <div id="box">
  	<div class="panel panel-primary">
      <div class="panel-heading"><h4>관리자추가</h4></div>
      <div class="panel-body">
        
	        <div class="seperator">
	           <label>이름 : </label>
	           <input class="form-control" name="admin_name">
	        </div>
	        
	        <div class="seperator">
	           <label>아이디 : </label>
	           <input class="form-control" name="admin_id"  id="admin_id"
	                  onkeyup="check_id();"> 
	           <span id="id_message"></span> 
	        </div>
	        
	        <div class="seperator">
	           <label>비밀번호 : </label>
	           <input class="form-control" type="password" name="admin_pwd">
	        </div>

	        <hr>


	        
	        <div style="text-align: center">
	           <input class="btn  btn-primary" type="button" value="관리자 추가"
	                  id="btn_register" 
	                  onclick="send(this.form);">
	           <input class="btn  btn-success" type="button" value="목록보기"
	                  onclick="location.href='list.do'">
	        </div>
	        
      </div>
  	</div>
  	
  </div>
  
</form>

</body>
</html>