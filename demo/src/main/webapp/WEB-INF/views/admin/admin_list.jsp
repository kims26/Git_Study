<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
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
     width: 1100px;
     margin: auto;
     margin-top: 30px;
     /* display: none; */
    
  }
  
  #title{
     text-align: center;
     font-size: 28px;
     font-weight: bold;
     
     color: green;
     text-shadow: 1px 1px 3px black;
  }
  
  #empty_message{
     text-align: center;
     margin-top: 200px;
     color : red;
     font-weight: bold;
     font-size: 26px;
  }

</style>




<script type="text/javascript">
   
   
  function del(admin_idx){
	  
	  
	  if(confirm("정말삭제하시겠습니까?")==false)return;
	  
	  location.href="delete.do?admin_idx=" + admin_idx
	  
  }
  
  function del_mem(mem_idx){
	  
	  
	  if(confirm("정말삭제하시겠습니까?")==false)return;
	  
	  location.href="../member/delete.do?mem_idx=" + mem_idx

     return "admin/admin_list";
	  
  }
    
  function del_o(o_idx){
	  
	  
	  if(confirm("정말삭제하시겠습니까?")==false)return;
	  
	  location.href="../owner/delete.do?o_idx=" + o_idx

     return "admin/admin_list";
	  
  }
  
 
  

</script>


</head>
<body>

   <c:if test="${ not empty sessionScope.user.admin_idx }">
<div id="box" >
   <h1 id="title">::::관리자페이지::::</h1>
   
   <!-- 로그인/로그아웃  -->
   <div style="text-align: right;">
       <!-- 로그인 안된경우 -->
       <c:if test="${ empty sessionScope.user }">
           <input class="btn btn-primary" type="button"  value="로그인" 
                  onclick="location.href='login_form.do'">
       </c:if>
       
       <!-- 로그인 된경우 -->
       <c:if test="${ not empty sessionScope.user }">
           <b>${ user.admin_name }</b>님 환영합니다
           <input class="btn btn-primary" type="button" value="로그아웃" 
                  onclick="location.href='logout.do'">
       </c:if>
   </div>
   
   <div style="margin-bottom: 10px;">
       <input class="btn btn-primary"  type="button"  value="관리자추가"
              onclick="location.href='insert_form.do'">
   </div>
   
  
   
   
   <table class="table">
   
   <!-- title  -->
   <tr class="success">
      <th>회원번호</th>
      <th>회원명</th>
      <th>아이디</th>
      <th>비밀번호</th>
      <th>주소</th>
      <th>충전타입</th>
      <th>우편번호</th>

      <th>전화번호</th>

      <th>회원유형</th>
      <th>편집</th>
   </tr>
 
   <c:if test="${ empty list }">
     <tr>
        <td colspan="10">
        <div id="empty_message">가입된 회원정보가 없습니다</div>
        </td>
     </tr> 
   </c:if>
   
   <!-- for(MemberVo vo : list)      -->
   <c:forEach var="vo"  items="${ mem_list }">
      <tr>
      
         <td>${ vo.mem_idx }</td>
         <td>${ vo.mem_name }</td>
         <td>${ vo.mem_id }</td>
         <td>${ vo.mem_pwd }</td>
         <td>${ vo.mem_addr }</td>
         <td>${ vo.mem_type }</td>
         <td>${ vo.mem_zipcode }</td>
      
         <td>${ vo.mem_tel }</td>
   
         <th>일반</th>
         
         <td>
	         <!-- 관리자이거나 -->
	        
	             <input class="btn btn-success" type="button"  value="수정"
	                    onclick="location.href='../member/modify_form.do?mem_idx=${ vo.mem_idx }'">
	                    
                       <input class="btn btn-danger"  type="button"  value="삭제"
                       onclick="del_mem('${ vo.mem_idx }');" >
                       
	                    
	      
         </td>

         
         
      </tr> 
   </c:forEach>
   
   
   </table>
   
   <table class="table">
   
      <!-- title  -->
      <tr class="success">
         <th>회원번호</th>
         <th>회원명</th>
         <th>아이디</th>
         <th>비밀번호</th>
      
         <th>전화번호</th>
         <th>주소</th>
   

    
         <th>회원유형</th>
         <th>편집</th>
      </tr>
    
      <c:if test="${ empty list }">
        <tr>
           <td colspan="10">
           <div id="empty_message">가입된 회원정보가 없습니다</div>
           </td>
        </tr> 
      </c:if>
      
   
      <c:forEach var="vo"  items="${ o_list }">
         <tr>
         
            <td>${ vo.o_idx }</td>
            <td>${ vo.o_name }</td>
            <td>${ vo.o_id }</td>
            <td>${ vo.o_pwd }</td>
            <td>${ vo.o_tel }</td>
            <td>${ vo.o_addr }</td>
          
    
            <th>판매자</th>
            
            <td>
             
              
                   <input class="btn btn-success" type="button"  value="수정"
                          onclick="location.href='../owner/modify_form.do?o_idx=${ vo.o_idx }'">
                          
                          <input class="btn btn-danger"  type="button"  value="삭제"
                          onclick="del_o('${ vo.o_idx }');" >
            
            </td>
   
            
            
         </tr> 
      </c:forEach>
      
      
      </table>
      
     
   <table class="table">
   
      <!-- title  -->
      <tr class="success">
         <th>회원번호</th>
         <th>회원명</th>
         <th>아이디</th>
         <th>비밀번호</th>
         <th>회원유형</th>
 
     
         <th>편집</th>
      </tr>
    
      <c:if test="${ empty list }">
        <tr>
           <td colspan="10">
           <div id="empty_message">가입된 회원정보가 없습니다</div>
           </td>
        </tr> 
      </c:if>
      
      <!-- for(MemberVo vo : list)      -->
      <c:forEach var="vo"  items="${ list }">
         <tr>
         
            <td>${ vo.admin_idx }</td>
            <td>${ vo.admin_name }</td>
            <td>${ vo.admin_id }</td>
            <td>${ vo.admin_pwd }</td>
            <td>관리자</td>
         
      
            
            
            <td>
               <!-- 관리자이거나 -->
              
                   <input class="btn btn-success" type="button"  value="수정"
                          onclick="location.href='admin_modify_form.do?admin_idx=${ vo.admin_idx }'">
                          
                   <input class="btn btn-danger"  type="button"  value="삭제"
                          onclick="del('${ vo.admin_idx }');" >
                          
            
            </td>
   
            
            
         </tr> 
      </c:forEach>
      
      
      </table>
</div>
</c:if>
<c:if test="${empty sessionScope.user.admin_idx }">
   <script>

      $(document).ready(function service(){
   
         alert("로그인 후 이용가능한 페이지입니다.");
            location.href="${cpath}/admin/login_form.do";
            
      })
   </script>
   
</c:if>
</body>
<script>
   
</script>

</html>