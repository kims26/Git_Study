<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../../../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../../css/search.css">
    <link rel="stylesheet" type="text/css" href="../../../css/search_responsive.css">
    <link rel="stylesheet" type="text/css" href="../../../css/responsive.css">
</head>
<body>
	<div class="keyword_info_box">
        <div class="search_keyword">
            <div class="inner">
                 <div class="keyword_search_bg">
                     <form class="form-control" id="search" name="search_form" action="" onsubmit="return false;">
                        <div class="keyword_search">
                            <input type="search" id="search_box" name="keyword"  value="${ param.search_text }" placeholder="찾으시는 메뉴를 입력해주세요." >
                            <button type="button" id="top_search_btn" value="검색"
                            onclick="find();"><img src="../images/search.png" alt="찾기 아이콘"></button>
                         </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    
// 검색창 드롭다운
//const searchBtn = document.querySelectorAll(".header .search_btn")[0];
//const searchBtnMo = document.querySelectorAll(".header .search_btn")[1];
const searchBtn = document.getElementById("search_btn_pc");
const searchBtnMo = document.getElementById("search_btn_mo");
const keywordBox = document.querySelector(".keyword_info_box");
const searchBtnAll = document.querySelectorAll(".header .search_btn");
const header = document.getElementById("header");
const topSearchBtn = document.getElementById("top_search_btn");

searchBtn.onclick = function(){
    if(keywordBox.classList.contains("on")) {
        keywordBox.classList.remove("on");
    }else {
        keywordBox.classList.add("on");
    }
}

searchBtnMo.onclick = function(){
    if(keywordBox.classList.contains("on")) {
        keywordBox.classList.remove("on");
    }else {
        keywordBox.classList.add("on");
    }
}

// 외부 영역클릭시 드롭박스 삭제
document.addEventListener('click',function(e){
    if(keywordBox.classList.contains("on")) {
        if(e.target.parentElement.classList[0] != 'search_btn') {
            let tgEl = e.target;
            let header2 = tgEl.closest("#header");

            if(!header2) {
                keywordBox.classList.remove("on");
            }
        }
    }
});


function fn_across_adn_shop_search(k){
	var across_adn_search_chk=false;
	var across_adn_search_info="";
	var across_last_adn_search="";
	try {
		var across_adn_search_val=localStorage.getItem('adn_shop_search');
		if(typeof(across_adn_search_val)!="undefined" && across_adn_search_val!=null){
			var adn_search_arr=across_adn_search_val.split("^@^");
			for (var i=0; i < adn_search_arr.length; i++){
				if(adn_search_arr[i]!=""){
					if(adn_search_arr[i]==k){
						across_last_adn_search=k;
						across_adn_search_chk=true
					} else across_adn_search_chk=false;
					if(!across_adn_search_chk){
						if(across_adn_search_info!="") across_adn_search_info+="^@^"+adn_search_arr[i];
						else across_adn_search_info+=adn_search_arr[i]
					}
				}
				if(i > 10) break
			}
		}
		if(across_last_adn_search!=""){
			if(across_adn_search_info!="") across_adn_search_info=across_last_adn_search+"^@^"+across_adn_search_info;
			else across_adn_search_info=across_last_adn_search
		} else {
			if(across_adn_search_info!="") across_adn_search_info=k+"^@^"+across_adn_search_info;
			else across_adn_search_info=k
		}
		localStorage.setItem('adn_shop_search', across_adn_search_info)
	} catch (exception){}
}

function fn_across_adn_search_find_txt(){
	if(location.pathname=="/shop/shopbrand.html"){
		try {
			var across_adn_searh_txt="";
			var frm=document.getElementsByName('form_search');
			if(frm.length > 0){
				across_adn_searh_txt=frm[0].prize1.value
			}
			if($(".item-wrap > .item-cont").length > 0){
				fn_across_adn_shop_search(across_adn_searh_txt)
			}
			else if($(".prd-thumb").length > 0){
				fn_across_adn_shop_search(across_adn_searh_txt)
			}
		} catch (exception){}
	} else if(location.pathname=="/m/search.html"){
		try {
			var across_adn_searh_txt="";
			var frm=document.getElementsByName('search');
			if(frm.length > 0){
				across_adn_searh_txt=frm[0].s.value
			}
			if($(".listPic").length > 0){
				fn_across_adn_shop_search(across_adn_searh_txt)
			}
		} catch (exception){}
	} else if(location.pathname=="/product/search.html"){
		try {
			var across_adn_searh_txt="";
			across_adn_searh_txt=fn_across_adn_getParameterByName("keyword", document.location.href);
			if($(".prdImg").length > 0){
				fn_across_adn_shop_search(across_adn_searh_txt)
			}
			if($(".thumbnail").length > 0){
				fn_across_adn_shop_search(across_adn_searh_txt)
			}
		} catch (exception){}
	} else if(location.pathname=="/goods/goods_search.php"){
		try {
			var across_adn_searh_txt="";
			var frm=document.getElementsByName('frmSearch');
			if(frm.length > 0){
				across_adn_searh_txt=fn_across_adn_getParameterByName("keyword", document.location.href)
			}
			if($(".item_cont").length > 0){
				fn_across_adn_shop_search(across_adn_searh_txt)
			}
		} catch (exception){}
	} else if(location.pathname=="/searchResult.do"){
		try {
			var across_adn_searh_txt="";
			var frm=document.getElementsByName('fm');
			if(frm.length > 0){
				across_adn_searh_txt=fn_across_adn_getParameterByName("searchStr", document.location.href)
			}
			if($(".pimg").length > 0){
				fn_across_adn_shop_search(across_adn_searh_txt)
			}else if($(".img_box1").length > 0){
				fn_across_adn_shop_search(across_adn_searh_txt)
			}
		} catch (exception){}
	} else {
		try {
			if(fn_across_adn_getParameterByName("mod", document.location.href)=="search")
			{
				across_adn_searh_txt=fn_across_adn_getParameterByName("keyword", document.location.href);
				if($(".wrap1").length > 0){
					fn_across_adn_shop_search(across_adn_searh_txt)
				}
			}
		}catch(e){}
	}
}
</script>
</html>