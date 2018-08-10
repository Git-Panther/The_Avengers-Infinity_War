<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="searchArea.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Festival Detail</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=339906b6f4278bdec7e4ff5ae52df3cc&libraries=services,clusterer,drawing"></script>
<script>
	function festivalDetailCommon(){
		$.ajax({        
	        url: 'festivalDetailCommon.do',
	        type: 'post',
	        data: { contentid : ${contentid} },
	        dataType: 'json',
	        success: function(data){
	        	console.log(data);
	        	printFestivalCommon(data.response.body.items.item);
	        }
	        , error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });	
	}
	
	function festivalDetailIntro(){
		$.ajax({        
	        url: 'festivalDetailIntro.do',
	        type: 'post',
	        data: { contentid : ${contentid} },
	        dataType: 'json',
	        success: function(data){
	        	console.log(data);
	        	printFestivalDetail(data.response.body.items.item);
	        }
	        , error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });	
	}
	
	function festivalDetailInfo(){
		$.ajax({        
	        url: 'festivalDetailInfo.do',
	        type: 'post',
	        data: { contentid : ${contentid} },
	        dataType: 'json',
	        success: function(data){
	        	console.log(data);
	        }
	        , error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });	
	}
	
	function locationBasedList(mapx, mapy, contenttypeid){
		$.ajax({        
	        url: 'locationBasedList.do',
	        type: 'post',
	        data: { mapx : mapx, mapy : mapy, contenttypeid : contenttypeid},
	        dataType: 'json',
	        success: function(data){
	        	console.log(data);
	        }
	        , error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });	
	}
	
	function checkUserFavorite(){
		
	}
	
	function printFestivalCommon(common){
		$("#festivalTitle p").text(common.title); // 행사명
		
		var src;
		if(undefined != common.firstimage) src = common.firstimage;
		else src = "/planner/resources/images/festival/no_image.png";
		
		$("#festivalPicture").attr("src", src);// 이미지
		$("#favorite").click(function(){
			
		});
		
		var $festivalCommonInfo = $("#festivalCommonInfo"); // 기본 정보(개요)
		
		var table = $("<table class='infoTable'>");
		var tr = $("<tr>");
		var th = $("<th>");
		var td = $("<td>");
		
		var address = common.addr1;
		if(common.addr2 != undefined) address += common.addr2;
		th.text("주소").appendTo(tr);
		td.text(address).appendTo(tr);
		tr.appendTo(table);
		
		// 초기화
		tr = $("<tr>");
		th = $("<th>");
		td = $("<td>");	
		th.text("홈페이지").appendTo(tr);
		td.html(common.homepage).appendTo(tr);
		tr.appendTo(table);
		
		tr = $("<tr>");
		th = $("<th>");
		td = $("<td>");	
		th.text("전화").appendTo(tr);
		td.html(common.telname + "<br>" + common.tel).appendTo(tr);
		tr.appendTo(table);
		
		table.appendTo($festivalCommonInfo);
		
		$("#festivalIntro").html(common.overview); // 상세한 설명
		
		locationBasedList(common.mapx, common.mapy, 32); // 숙박
		locationBasedList(common.mapx, common.mapy, 39); // 음식점
		
		// 지도 표시를 해준다 ㅇㅇ.
		printMark(new daum.maps.LatLng(common.mapy, common.mapx));
	}
	
	function printFestivalDetail(detail){
		//console.log(detail);		
		var $commonTable = $("#festivalCommonInfo table");
		var tr = $("<tr>");
		var th = $("<th>");
		var td = $("<td>");
		th.text("연령대").appendTo(tr); // 연령대 추가
		td.html(detail.agelimit).appendTo(tr);
		tr.appendTo($commonTable);
		
		$("#festivalCommonInfo table td").eq(0).append(" " + detail.eventplace); // 장소 추가
		
		tr = $("<tr>");
		th = $("<th>");
		td = $("<td>");	
		th.text("기간").appendTo(tr); // 기간 추가
		td.html(detail.playtime).appendTo(tr);
		tr.appendTo($commonTable);
		
		tr = $("<tr>");
		th = $("<th>");
		td = $("<td>");	
		th.text("프로그램").appendTo(tr); // 행사내용 추가
		td.html(detail.program).appendTo(tr);
		tr.appendTo($commonTable);
		
		tr = $("<tr>");
		th = $("<th>");
		td = $("<td>");	
		th.text("입장 권한").appendTo(tr); // 입장권한 추가
		td.html(detail.spendtimefestival).appendTo(tr);
		tr.appendTo($commonTable);
		
		tr = $("<tr>");
		th = $("<th>");
		td = $("<td>");	
		th.text("후원").appendTo(tr); // 후원 추가
		td.html(detail.sponsor1 + " : " + detail.sponsor1tel + "<br>" + detail.sponsor2 + " : " + detail.sponsor2tel).appendTo(tr);
		tr.appendTo($commonTable);
		
		tr = $("<tr>");
		th = $("<th>");
		td = $("<td>");	
		th.text("참가비").appendTo(tr); // 비용 추가
		td.html(detail.usetimefestival).appendTo(tr);
		tr.appendTo($commonTable);
		
		tr = $("<tr>");
		th = $("<th>");
		td = $("<td>");	
		th.text("추가 이벤트").appendTo(tr); // 추가 이벤트 추가
		td.html(detail.subevent).appendTo(tr);
		tr.appendTo($commonTable);
	}
	
	function festivalTapEvent(){
		$("#festivalTap td").each(function(){
			$(this).click(function(){
				$("#festivalTap td").removeClass("showing");
				$(this).addClass("showing");
				showInfo($(this).text());
			});
		});
	}
	
	function showInfo(content){
		console.log(content);
		switch(content){
		case "개요":
			$("#festivalDetailInfo").hide();
			$("#map").hide();
			$("#festivalIntro").show();
			$("#festivalCommonInfo").show();
			break;
		case "안내":
			$("#festivalCommonInfo").hide();
			$("#map").hide();
			$("#festivalIntro").show();
			$("#festivalDetailInfo").show();
			break;
		case "지도":
			$("#festivalCommonInfo").hide();
			$("#festivalDetailInfo").hide();
			$("#festivalIntro").show();
			$("#map").show();
			break;
		}
	}
</script>
</head>
<body>
<div class="outer">
	<div>
		<table id="festivalTap">
			<tr>
				<td>개요</td>
				<td>안내</td>
				<td>지도</td>
				<td>숙박</td>
				<td>식당</td>
				<td>일기예보</td>
				<td>교통상황</td>
			</tr>
		</table>
	</div>
	<br>
	<div id="festivalDetail">
		<div id="festivalTitle"><p></p></div>
		<div>
			<table id="festivalInfo">
				<tr>
					<td>
						<div><img id="festivalPicture" /></div>
					</td>
					<td>
						<div id="festivalCommonInfo"></div>
						<div id="festivalDetailInfo"></div>
						<div id="map"></div>
					</td>
				</tr>
			</table>
			<div><p id="favorite" class="link">???</p></div>
		</div>
		<div id="festivalIntro"></div>
		<br>
		<script type="text/javascript">		
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 3,
				// marker: markers // 이미지 지도에 표시할 마커 
			};
			
			var map = new daum.maps.Map(container, options);
	
			var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(0, 0)
		    }); // 마커 
		    
			marker.setMap(map);
		   
		    var infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		 	// 주소-좌표 변환 객체를 생성합니다
		    var geocoder = new daum.maps.services.Geocoder();
		    
		    function printMark(position){
				map.setCenter(position);
				searchDetailAddrFromCoords(position, function(result, status) {
			        if (status === daum.maps.services.Status.OK) {
			            var detailAddr = !!result[0].road_address ? '<div>도로명주소 <br>' + result[0].road_address.address_name + '</div><br>' : '';
			            detailAddr += '<div>지번 주소<br>' + result[0].address.address_name + '</div><br>';
			            
			            var content = '<div class="bAddr">' +
			                            //'<span class="title">법정동 주소정보</span>' + 
			                            detailAddr + 
			                        '</div>';
			
			            // 마커를 클릭한 위치에 표시합니다 
			            marker.setPosition(position);
			            // marker.setMap(map);
			
			            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
			            infowindow.setContent(content);
			            infowindow.open(map, marker);
			        }   
			    });
			}
			
			function searchDetailAddrFromCoords(coords, callback) {
		        // 좌표로 법정동 상세 주소 정보를 요청합니다
		        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		    }
		    
		    $(function(){
		    	festivalDetailCommon(); // 기본정보 표시
		    	festivalDetailIntro(); // 상세 정보 표시
		    	festivalDetailInfo(); // 반복 정보 표시
		    	festivalTapEvent(); // 탭 이벤트 추가
		    	checkUserFavorite(); // 찜 여부 체크
		    	$("#festivalTap td").eq(0).click(); // 기본 정보부터 표시
			});
		</script>
	</div>
	<div id="festivalComment">코멘트 부분</div>
</div>
</body>
<c:import url="/footer.do"/>
</html>