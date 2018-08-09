<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:import url="/header.do"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Area</title>
<link href="resources/css/festival.css" rel="stylesheet">
</head>
<body>
<div class="outer">
	<c:url var="searchResult" value="/festivalList.do"></c:url>
	<form id="searchArea" method="get" action="${searchResult}">
		<!-- <div id="typeList"></div><br> -->
		<!-- <div id="serviceList"></div><br> -->
		<div class="searchRow">
			<div id="areaList">
				<select name="areaCode" id="areaSelect"></select>
			</div>
			<div id="sigunguList">
				<select name="sigunguCode" id="sigunguSelect">
					<option>(시군구 선택)</option>
				</select>
			</div>
			<button id="submitSearchBtn">검색</button>
		</div>
		<br>
		<div class="searchRow">
			<!-- 달력 1 -->
			<!-- 달력 2 -->
		</div>
		<br>
		<div class="searchRow">
			<div id="resultAmount"></div>
			<div id="arrangeList">
				<select id="arrange" name="arrange">
					<option value="D">등록일</option>				
					<option value="C">수정일</option>
					<option value="B">조회수</option>
				</select>
			</div>
		</div>
	</form>		
</div>
<script>
	function areaCodeList(){
		$.ajax({        
	        url: 'areaCodeList.do',
	        type: 'get',
	        dataType: 'json',
	        success: function(data){
	        	//console.log(data);
	        	printAreaList(data.response.body.items.item);
	        }
	        , error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });
	}
	
	function sigunguCodeList(areaCode){
		$.ajax({        
	        url: 'areaCodeList.do',
	        type: 'get',
	        data: { areaCode : areaCode },
	        dataType: 'json',
	        success: function(data){
	        	//console.log(data);
	        	//console.log(data.response);
	        	printSigunguList(areaCode, data.response.body.items.item);
	        }
	        , error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });
	}
	
	function printAreaList(list){
		var $select = $("#areaSelect");
		var option = $("<option>");
		option.val(undefined);
		option.text("(지역 선택)");
		$select.append(option);
		//console.log(list);
		list.forEach(function(v, i) {
			//console.log(area);
			option = $("<option>");
			option.val(v.code);
			option.text(v.name);
			if(option.val() == "${areaCode}") {
				option.prop("selected", true);
				sigunguCodeList(option.val());
			}
			//console.log(option);
			$select.append(option);
		});
		$select.on("change", function(){
			sigunguCodeList($(this).val());
		}).appendTo($("#areaList"));
	}
	
	function printSigunguList(areaCode, list){
		//console.log(areaCode);
		var $select = $("#sigunguSelect");
		$select.html("");
		var option = $("<option>");
		option.val(undefined);
		option.text("(시군구 선택)");
		$select.append(option);
		//console.log(list);
		if(areaCode != ""){
			list.forEach(function(v, i) {
				//console.log(area);
				option = $("<option>");
				option.val(v.code);
				option.text(v.name);
				if(option.val() == "${sigunguCode}") {
					option.prop("selected", true);
				}
				//console.log(option);
				$select.append(option);
			});
		}
		$select.appendTo($("#sigunguList"));
	}

	$(function(){
		$("#submitSearchBtn").click(function(){$("#searchArea").submit();});
		areaCodeList(); // 지역 출력
		// 정렬순 선택 여부 추가
	});
</script>
</body>
</html>