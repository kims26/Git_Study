<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to my shop</title>
   <link href="../css/index.css?after" rel="stylesheet" />


   
   <!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>


  <section class="mainBanner">
    <h1 class="text">
     E-Car-SHOP
    </h1>
  </section>

  <div class="container">
    <section class="wrapper">
      <div class="sidebar">
        <nav class="mainMenu">
          <ul>
            <li><a href="">All Items</a></li>
            <li><a href="">Best Items</a></li>
            <li><a href="">A-Type</a></li>
            <li><a href="">B-Type</a></li>
            <li><a href="">C-Type</a></li>
            <li><a href="">세일 상품</a></li>
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
                  <button class="writeBtn" onclick="location.href='insert_form.do'">상품 등록 <span class="arrow">></span></button>
                </div>
                <div class="writeBtnBox">
                  <button class="writeBtn" onclick="location.href='../owner/my_product_list.do?o_idx=${user.o_idx}'">판매 관리 <span class="arrow">></span></button>
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

        <c:forEach var="vo"  items="${ list }">
         <div class="item">
           <div class="imgBox">
            <img src="../upload/${ vo.p_image_l }" onclick="">
           </div>

           <div class="textBox">
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
