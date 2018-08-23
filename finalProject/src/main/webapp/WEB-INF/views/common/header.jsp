<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="resources/css/header.css" rel="stylesheet" />
<meta charset="UTF-8">
<style>
.gnb_mn_drop a{
	line-height:300%;
	text-decoration:none;
	color:grey;
	padding-left:15px;
}

</style>
<title>Header</title>
<script>

function joinPage(){
	location.href="joinPage.do";
}
function loginPage(){
	location.href="loginPage.do";
}
function logout(){
	location.href="logout.do";
}
$(function(){
	$(".header_profile").hover(function(){
	    $(".gnb_mn_drop").css("display", "block");
	}, function(){
	$(".gnb_mn_drop").css("display", "none");
	});
})
</script>
</head>
<body>
	<div id="header">
		<div class="wrap">
			<h1 class="logo fl" alt="여행의 시작! 어스토리">
				<a href="/planner/index.do"><img
					src="/planner/resources/images/common/gnb/logo.png" alt="여행의 시작! 어스토리"></a>
			</h1>
			<ul class="gnb fl">
				<c:url var="festivalList" value="/festivalList.do"></c:url>
				<a href="${festivalList}" class="fl"><li>축제/행사</li></a>
				<c:url var="area" value="/area.do"></c:url>
				<a href="${area}" class="fl"><li>여행지</li></a>
				<a href="/plan.do" class="fl"><li>일정만들기</li></a>
				<a href="/hotel.do" class="fl"><li>호텔</li></a>
				<a href="/intro.do" class="fl"><li>이용방법</li></a>
			</ul>

			<div class="fr gnb_box">
				<div class="fl gnb_search_box">
					<input type="text" id="gnb_search" placeholder="축제/도시를 찾아보세요.">
					<div class="gnb_search_btn" style="display: none;"></div>
				</div>
				<div id="gnb_search_autocomplete"></div>
				<c:if test="${empty sessionScope.user}">
					<a href="javascript:void(0)" class="fr" onclick="joinPage();">
						<div class="fl gnb_join_btn">회원가입</div></a>
					<a href="javascript:void(0)" class="fr" onclick="loginPage();">
						<div class="fl gnb_login_btn">로그인</div></a>
					<a href="javascript:void(0);" class="fr" style="display: none;"> </a>
					<div class="clear"></div>
				</c:if>
				<c:if test="${!empty sessionScope.user}">
					<div class="header_profile fr"><img src="resources/upload/${user.getProfilePic()}"/>
						<div class="gnb_mn_drop" style="display:none;">
							<a href="" class="item">찜 목록</a><br/>
							<a href="" class="item">내 일정</a><br/>
							<a href="" class="item">리뷰</a><br/>
							<a href="/planner/memberInfo.do" class="item">내 정보</a><br/>
							<a href="/planner/logout.do" class="item">로그아웃</a>
						</div>
					</div>
					<div class="clear"></div>
				</c:if>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>