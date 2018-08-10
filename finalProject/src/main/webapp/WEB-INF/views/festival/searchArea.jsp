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
<script>
	function areaCodeList(){
		$.ajax({        
	        url: 'areaCodeList.do',
	        type: 'post',
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
	        type: 'post',
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
		// 항목 선택 이벤트 추가
		$select.on("change", function(){
			sigunguCodeList($(this).val());
			// 장소가 바뀌었기에 두 번째 선택은 해제되어야 함
			$("#sigunguSelect option").each(function(){
				$(this).prop("selected", false);
			}); 
		});//.appendTo($("#areaList"));
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
			list.forEach(function(v) {
				//console.log(area);
				option = $("<option>");
				option.val(v.code);
				option.text(v.name);
				// 지역, 시군구 전부 일치해야 함
				if($("#areaSelect").val() == '<c:out value="${areaCode}"/>' && option.val() == '<c:out value="${sigunguCode}"/>') {
					option.prop("selected", true);
				}
				//console.log(option);
				$select.append(option);
			});
		}
		$select.appendTo($("#sigunguList"));
	}
	
	function printArrange(){
		$("#arrange option").each(function(){
			//console.log($(this));
			if($(this).val() == "${arrange}") {
				$(this).prop("selected", true);
			}
		});
	}
	
	function printDate(){
		//console.log($("#eventStartDate"));
		$("#eventStartDate").val("${eventStartDate}");
		$("#eventEndDate").val("${eventEndDate}");
	}
</script>
</head>
<body>
<div class="outer">
	<c:url var="searchResult" value="/festivalList.do"></c:url>
	<form id="searchArea" method="get" action="${searchResult}">
		<!-- <div id="typeList"></div><br> -->
		<!-- <div id="serviceList"></div><br> -->
		<table class="search">
			<tr class="searchRow">
				<td class="searchHead">
					<label>지역 : </label>
				</td>
				<td>
					<div id="areaList">
						<select name="areaCode" id="areaSelect"></select>
					</div>
					<div id="sigunguList">
						<select name="sigunguCode" id="sigunguSelect">
							<option value="">(시군구 선택)</option>
						</select>
					</div>
				</td>
				<td colspan="4"></td>
			</tr>
			<tr class="searchRow">
				<td class="searchHead">
					<label>기간 : </label>
				</td>
				<td>
					<!-- 달력 1 -->
					<input type="date" name="eventStartDate" id="eventStartDate"/>
					<label> - </label>
					<!-- 달력 2 -->
					<input type="date" name="eventEndDate" id="eventEndDate"/>
				</td>
				<td colspan="3"></td>
				<td>
					<button id="submitSearchBtn">검색</button>
				</td>
			</tr>
			<tr class="searchRow">
				<td class="searchHead">
					<div id="resultAmount"></div>
				</td>
				<td colspan="4"></td>
				<td>
					<div id="arrangeList">
						<select id="arrange" name="arrange">
							<option value="D">등록일</option>				
							<option value="C">수정일</option>
							<option value="B">조회수</option>
						</select>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<hr>		
</div>
<script>
	$(function(){
		$("#submitSearchBtn").click(function(){$("#searchArea").submit();});
		areaCodeList(); // 지역 출력 + 시군구 출력
		// 시군구 자동 선택
		/*
		$("#sigunguSelect option").each(function(){
			console.log($(this));
			if($(this).val() == '<c:out value="${sigunguCode}"/>') {
				$(this).prop("selected", true);
			}
		});
		*/
		printArrange(); // 정렬순 선택 여부 추가
		printDate(); // 기간 반영
	});
</script>
</body>
</html>