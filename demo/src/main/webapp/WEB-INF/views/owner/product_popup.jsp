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
  #popup{
     width: 300px;
     height: auto;
     border: 2px solid black;
     padding: 5px;
     
     background: rgba(120,120,120,0.9);
     color: white;
     
     position: absolute;
     left: 400px;
     top: 100px;
     
     display: none;
     
  }
  
  #popup > img{
     width: 288px;
     height: 280px;
     border: 1px solid #cccccc;
     outline: 1px solid black;
     margin-top: 10px;
     margin-bottom: 10px;
  }
  
  #popup > p{
    
    border: 1px solid #cccccc;
    padding: 5px;
  }
  
  #content{
    min-height: 60px;
  }


</style>

<script type="text/javascript">

  function hide_popup(){
	  
	  $("#popup").hide();
	  
  }

</script>


</head>
<body>

  <div id="popup">
     <div style="text-align: right;">
        
        <label id="o_idx">등록자</label>
        <input class="btn btn-danger"  type="button"  value="x"
               onclick="hide_popup();">
     </div>
     <img src="../upload/뿌까.jpg">
     
     
     <p id="p_content">내용</p>
     <p id="p_regdate">등록일자</p>
     <div  id="div_job"  style="text-align: center; display:none; ">
        <input class="btn btn-info"   type="button" value="수정"
               onclick="product_modify_form();"> 
        <input class="btn btn-danger" type="button" value="삭제" 
               onclick="del_product();"> 
     </div>
  </div>

</body>
</html>