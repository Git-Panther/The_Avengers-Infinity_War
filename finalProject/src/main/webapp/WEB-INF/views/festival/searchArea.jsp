<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Area</title>
<link href="resources/css/festival.css" rel="stylesheet">
</head>
<div class="outer">
	<form id="searchArea" method="post">
		<div id="typeList"></div>
		<br>
		<div id="serviceList"></div>
		<br>
		<div id="areaList"></div>
		<br>
		<div id="resultAmount"></div>
		<div id="arrangeList">
			<select id="arrange" name="arrange">
				<option value="D">작성일</option>
				<option value="C">수정일</option>
				<option value="B">조회수</option>
			</select>
		</div>
	</form>		
</div>
<body>
</body>
</html>