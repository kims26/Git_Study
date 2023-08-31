<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>

<%@ taglib prefix='c'    	uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  	uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'		uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../css/index.css?after" rel="stylesheet" />


       <!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script type="text/javascript">
  var global_p_idx;//전역변수
  var global_p_filename;
  function show_popup(p_idx){
	  
	  global_p_idx = p_idx;
	  
	  var window_width = $(window).width();   //browser폭
	  var popup_width  = $("#popup").width(); //popup폭
	  //alert(window_width + " / " + popup_width );
	  
	  //팝업윈도우가 중앙에 올수 있도록 left위치 계산
	  var left = window_width/2 - popup_width/2;
	  $("#popup").css("left", left);
	  $("#popup").show();
	  
	  
	  //alert(p_idx+"에 대한 자료를 Ajax통해서 요청");
	  
	  $.ajax({
		  url		:	"../product/product_one.do",      //PhotoOneAction
		  data		:	{"p_idx" : p_idx },
		  dataType	: "json",
		  success	: function(res_data){
			  
			  //res_data = {"p_idx":20, "p_subject": "제목" , "p_filename":"a.jpg" ,.... }
			  
			  //download할 화일명
			  
			  //이미지 출력
			  //  <img src="">
			  $("#popup > img").attr("src", "../upload/" + res_data.p_filename);

			  $("#content").html(res_data.p_content);
			  			  
			  var date = "최초 : " + res_data.p_regdate + 
			             "<br>수정 : " + res_data.p_modifydate;
			  $("#regdate").html(date);
			  
			  $("#o_idx").html("회원번호:" + res_data.o_idx);
			  
			  
			  //로그인 여부에따라서 다운로드 버튼 사용여부 결정
			 
			  
			  //수정/삭제버튼의 사용여부 결정(본인 또는 관리자일 경우)
			  if(
			     "${ (user.o_grade eq '관리자') }"=="true" 
			     ||
			     ( "${ user.o_idx}" == res_data.o_idx )
					  
			    )
			  {
				  
				  $("#div_job").show();
				  
			  }else{
				  
				  $("#div_job").hide();
			  }
				   
			  
		  },
		  error		: function(err){
			  
			  alert(err.responseText);
			  
		  }
		  
	  });
	  
  }//end:show_popup()

  function del_product(){
	  
	  if(confirm("정말 삭제하시겠습니까?")==false)return;
	  
	  // PhotoDeleteAction
	  location.href="../product/delete.do?p_idx=" + global_p_idx ;
	  
  }

  function modify_form(){
	  
	  // PhotoModifyFormAction
	  location.href="../product/modify_form.do?p_idx=" + global_p_idx;
	  
  }

</script>

</head>


<body>

  <%@include file="product_popup.jsp" %>

    <section class="mainBanner">
        <h1 class="text">
         판매 관리 
        </h1>
      </section>

      <div class="container">
        <section class="wrapper">
          <div class="sidebar">
            <nav class="mainMenu">
              <ul>
                <li><a href="">판매 현황</a></li>
                <li><a href="">인기순</a></li>
                <li><a href="">A-Type</a></li>
                <li><a href="">B-Type</a></li>
                <li><a href="">C-Type</a></li>
              </ul>
            </nav>
    
      <div id="box">
    
             <!-- 로그인/로그아웃  -->
             <div style="text-align: right;">
                 <!-- 로그인 안된경우 -->
                 <c:if test="${ empty sessionScope.user }">
                    <div class="writeBtnBox">
                    <button class="writeBtn" onclick="location.href='../owner/login_form.do'">로그인 <span class="arrow">></span></button>
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../owner/insert_form.do'">회원가입 <span class="arrow">></span></button>
                    </div>
                  </div>
                 </c:if>
    
                 <!-- 로그인 된경우 -->
                 <c:if test="${ not empty sessionScope.user }">
    
                    <div class="writeBtnBox">
                    <button class="writeBtn" onclick="location.href='../owner/logout.do'">로그아웃 <span class="arrow">></span></button>
    
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../product/insert_form.do'">상품 등록 <span class="arrow">></span></button>
                    </div>
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../owner/my_product_list.do?o_idx=${user.o_idx}'">판매 관리 <span class="arrow">></span></button>
                    </div>
                    
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../product/list.do'">메인으로 <span class="arrow">></span></button>
                    </div>
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../owner/modify_form.do?o_idx=${user.o_idx}'">마이페이지 <span class="arrow">></span></button>
                    </div>
                    
                  </div>
                  <b>${ user.o_name }</b>판매자님 환영합니다
                 </c:if>
             </div>
             </div>
            </div>
    
    
            <div class="itemWrap">
    
               <!-- Data가 없는경우 -->
             <c:if test="${ empty list }">
              <div id="empty_message">판매 등록 해주세요</div>
          </c:if>
  
          

          
          <%-- <c:forEach begin="1"  end="20"> --%>
            
              
            <c:forEach var="vo"  items="${ list }" >

             <div class="item">
               <div class="imgBox">
                <a href="../product/product_modify_form.jsp">
                       <img src="../upload/${ vo.p_image_l }" 
                      
                      </a>
                </div>
               <div class="textBox">
                <p class="textBox__del"></p> 
                 <p class="textBox__name">${vo.p_name}</p>
                 <p class="textBox__price">${vo.p_price}</p>
                

               </div>
             </div>
            </c:forEach>
          

          </div>
          </section>
       </div>
    
      

</body>
</html>
