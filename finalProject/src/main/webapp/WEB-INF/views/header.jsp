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
<link href="resources/css/header.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Header</title>
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
				<a href="/area" class="fl"><li>여행지</li></a>
				<a href="/plan" class="fl"><li>일정만들기</li></a>
				<a href="/hotel" class="fl"><li>호텔</li></a>
				<a href="/intro" class="fl"><li>이용방법</li></a>
			</ul>

			<div class="fr gnb_box">
				<div class="fl gnb_search_box">
					<input type="text" id="gnb_search" placeholder="축제/도시를 찾아보세요.">
					<div class="gnb_search_btn" style="display: none;"></div>
				</div>
				<div id="gnb_search_autocomplete"></div>

				<a href="javascript:void(0)" class="fr"
					onclick="et_modal('365px','499px','1','0','/ko/member/join','2','1')"><div
						class="fl gnb_join_btn">회원가입</div></a> <a href="javascript:void(0)"
					class="fr"
					onclick="et_modal('365px','380px','1','0','/ko/member','2','1')"><div
						class="fl gnb_login_btn">로그인</div></a> <a href="javascript:void(0);"
					class="fr" style="display: none;"> </a>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>