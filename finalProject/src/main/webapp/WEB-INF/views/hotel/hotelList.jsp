<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<link href="resources/css/hotelList.css" rel="stylesheet">

<script>
	$(function() {
		var areaCode = 1;
		var sigunguCode = 1;

		/* $.ajax({
			url : 'hotelList.do',
			type : 'get',
			data : {
				"areaCode" : areaCode,
				"sigunguCode" : sigunguCode
			}, //contentid, contentTypeid 서버로 전송
			dataType : 'json',
			success : function(data) {
				console.log(data.response.body.totalCount);
				console.log(data.response.body.items.item);
				var item = data.response.body.items.item; //이 경로 내부에 데이터가 들어있음
				var output = '';

				for (var i = 0; i < item.length; i++) {
				}

				$(".list").html(""); 
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		}); */
		
		
		
		
		
		<div class="box" id="123726">
		<img
			src="http://pix3.agoda.net/hotelimages/666/666224/666224_14070609160020162903.jpg?s=312x"
			alt="" class="ht_img"
			onclick="go_link(123726,'https://www.agoda.com/partners/partnersearch.aspx?hid=666224&amp;cid=1607809');"
			onerror="this.src='/res/img/common/no_img/hotel.png';"
			data-srl="123726" onload="check_blankimg(123726,'ht_img')">
		<div class="box_right">
			<div class="btn_clip" data-yn="n" data-srl="123726"
				onclick="set_clip(123726,'0','btn_clip','2');">
				<img src="/res/img/city/spot_list/clip_ico.png" alt="">
			</div>
			<div class="btn_addplan"
				onclick="et_modal('365px','380px','1','0','/ko/member','2','1')">
				<img src="/res/img/city/spot_list/addplan_ico.png" alt="">
			</div>
			<a
				href="javascript:go_link(123726,'https://www.agoda.com/partners/partnersearch.aspx?hid=666224&amp;cid=1607809');"
				class="ht_title">투어인 하루미 게스트하우스</a>
			<div class="ht_title_en">Tourinn Harumi Guesthouse</div>
			<div class="ht_info">
				<img src="/res/img/common/web/hotel_star_1.5.png" alt=""
					class="ht_rate_img">
				<div class="ht_line"></div>
				<div class="ht_rate">
					<span>9.9</span> 강력추천
				</div>
				<a class="ht_review"
					href="javascript:go_link(123726,'http://www.agoda.com/ko-kr/asia/south_korea/seoul/tourinn_harumi_guesthouse.html?cid=1607809#HotelReviewHeader');">이용후기
					보기</a>
				<div class="clear"></div>
			</div>
			<div class="ht_addr">
				20, Seonyudong 1-ro, Yeongdeungpo-gu<a class="map_link"
					href="javascript:et_modal('1144px','816px','1','0','/ko/modal/spot_map?srl=123726&amp;type=2','2','1');">지도보기</a>
			</div>
			<div class="ht_desc">투어인 하루미 게스트하우스에서 숙박하며 서울의 아름다움을
				즐겨보세요. 다양한 시설과 서비스를 제공하는 호텔에서 편하게 주무실 수 있...</div>
			<div class="ht_bottom">
				<a class="ht_view"
					href="javascript:go_link(123726,'https://www.agoda.com/partners/partnersearch.aspx?hid=666224&amp;cid=1607809');">자세히
					보기</a><a class="ht_price"
						href="javascript:go_link(123726, 'https://www.agoda.com/partners/partnersearch.aspx?hid=666224&amp;cid=1607809');">￦38,559</a>
					output += '<div class="price_desc">1박 평균/</div>'
				output += '</div>'
			output += '</div>'
		output += '	<div class="clear"></div>'
	output += '</div>';

	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="clear"></div>
	<div class="area_bg top silver">

		<div class="wrap">

			<div class="area_nav">
				<a href="/ko/area" class="nav_btn">여행지</a> &gt; <a
					href="/ko/area/republic-of-korea" class="nav_btn cu">대한민국</a> &gt;
				<a href="/ko/city/seoul_310" class="nav_btn"> 서울 </a> &gt; 호텔
			</div>


			<div class="area_title">
				<b>서울</b> <span>Seoul</span>
			</div>


			<div class="common_menu">
				<a href="/ko/city/seoul_310"> 홈 </a> <a
					href="/ko/city/seoul_310/hotel#1" class="on"> 호텔 </a> <a
					href="/ko/city/seoul_310/attraction#1"> 관광명소 </a> <a
					href="/ko/city/seoul_310/restaurant#1"> 음식점 </a> <a
					href="/ko/city/seoul_310/shopping#1"> 쇼핑 </a> <a
					href="/ko/plan?ci=310" target="_blank"> 여행일정 </a> <a
					href="/ko/city/seoul_310/map"> 지도보기 </a>
				<div class="clear"></div>
			</div>


			<script type="text/javascript"
				src="/res/js/mobile/noui_slider/jquery.nouislider.all.min.js"></script>
			<link rel="stylesheet"
				href="/res/js/mobile/noui_slider/jquery.nouislider.css">
			<link rel="stylesheet" href="/res/css/web/date_picker.css">
			<script type="text/javascript" src="/res/js/web/jui/jquery-ui.js"></script>
			<script type="text/javascript"
				src="/jslang?lang=ko&amp;lang_file=city"></script>

			<script type="text/javascript"
				src="http://earthtory.com/res/js/jquery.tipsy.js"></script>

			<script type="text/javascript" src="/res/js/web/common_w.js"></script>
			<link rel="stylesheet" href="/res/css/city/spot_list.css">
			<link rel="stylesheet" href="/res/css/city/hotel_list.css">
			<script
				src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;key=AIzaSyCl637FhRA2W2lb2sQ776t96OML_-LOVdw"></script>
			<script type="text/javascript"
				src="/res/js/web/dhistory/dhtmlHistory.js"></script>
			<form id="historyStorageForm" method="GET"
				style="position: absolute; top: -1000px; left: -1000px;">
				<textarea id="historyStorageField"
					style="position: absolute; top: -1000px; left: -1000px;" left:=""
					-1000px;'="" name="historyStorageField"></textarea>
			</form>

			<link rel="stylesheet" href="/res/css/web/date_picker.css">
			<script type="text/javascript" src="/res/js/web/jui/jquery-ui.js"></script>
			<style type="text/css">
#SearchBox {
	position: fixed;
	left: 0px;
	top: 0px;
	z-index: -1;
	display: none;
	width: 1px;
	height: 1px;
}
</style>
			<div id="SearchBox">
				<iframe src="/ko/modal/hotel_hidden" frameborder="0"
					class="ht_search_box_frame"></iframe>
			</div>



			<div class="wrap">
				<div class="filter_box">
					<div class="filter_top">
						<div class="cicu_names">대한민국, 서울</div>

						<div class="search_area">
							<input type="text" placeholder="지역을 검색하세요." class="hotel_search">


							<div class="ht_search">검색</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>

				</div>
			</div>
		</div>
		<div class="list_bg">
			<div class="wrap">
				<div class="list_left">

					<div class="list_top" style="display: block;">
						<div class="list_cnt">
							총 1,193개의 호텔 <a href="javascript:reset_filter();"
								style="display: none;">필터 초기화</a>
						</div>
						<div class="list_sort">
							<select name="" id="" class="sort" data-height="25">
								<option value="pl_clip_cnt">인기순</option>
								<option value="name">이름순</option>

								<option value="price_asc">가격 낮은순</option>
								<option value="price_desc">가격 높은순</option>
								<option value="rate_asc">등급 낮은순</option>
								<option value="rate_desc">등급 높은순</option>
								<option value="distance">거리순</option>
							</select>
						</div>
					</div>
					<div class="list">
						<div class="box" id="123726">
							<img
								src="http://pix3.agoda.net/hotelimages/666/666224/666224_14070609160020162903.jpg?s=312x"
								alt="" class="ht_img"
								onclick="go_link(123726,'https://www.agoda.com/partners/partnersearch.aspx?hid=666224&amp;cid=1607809');"
								onerror="this.src='/res/img/common/no_img/hotel.png';"
								data-srl="123726" onload="check_blankimg(123726,'ht_img')">
							<div class="box_right">
								<div class="btn_clip" data-yn="n" data-srl="123726"
									onclick="set_clip(123726,'0','btn_clip','2');">
									<img src="/res/img/city/spot_list/clip_ico.png" alt="">
								</div>
								<div class="btn_addplan"
									onclick="et_modal('365px','380px','1','0','/ko/member','2','1')">
									<img src="/res/img/city/spot_list/addplan_ico.png" alt="">
								</div>
								<a
									href="javascript:go_link(123726,'https://www.agoda.com/partners/partnersearch.aspx?hid=666224&amp;cid=1607809');"
									class="ht_title">투어인 하루미 게스트하우스</a>
								<div class="ht_title_en">Tourinn Harumi Guesthouse</div>
								<div class="ht_info">
									<img src="/res/img/common/web/hotel_star_1.5.png" alt=""
										class="ht_rate_img">
									<div class="ht_line"></div>
									<div class="ht_rate">
										<span>9.9</span> 강력추천
									</div>
									<a class="ht_review"
										href="javascript:go_link(123726,'http://www.agoda.com/ko-kr/asia/south_korea/seoul/tourinn_harumi_guesthouse.html?cid=1607809#HotelReviewHeader');">이용후기
										보기</a>
									<div class="clear"></div>
								</div>
								<div class="ht_addr">
									20, Seonyudong 1-ro, Yeongdeungpo-gu<a class="map_link"
										href="javascript:et_modal('1144px','816px','1','0','/ko/modal/spot_map?srl=123726&amp;type=2','2','1');">지도보기</a>
								</div>
								<div class="ht_desc">투어인 하루미 게스트하우스에서 숙박하며 서울의 아름다움을
									즐겨보세요. 다양한 시설과 서비스를 제공하는 호텔에서 편하게 주무실 수 있...</div>
								<div class="ht_bottom">
									<a class="ht_view"
										href="javascript:go_link(123726,'https://www.agoda.com/partners/partnersearch.aspx?hid=666224&amp;cid=1607809');">자세히
										보기</a><a class="ht_price"
										href="javascript:go_link(123726,'https://www.agoda.com/partners/partnersearch.aspx?hid=666224&amp;cid=1607809');">￦38,559</a>
									<div class="price_desc">1박 평균/</div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div id="paging">
						<span class="nv"></span>
						<button type="button" class="on" onclick="get_ht_list(1,1)">1</button>
						<button type="button" onclick="get_ht_list(1,2)">2</button>
						<button type="button" onclick="get_ht_list(1,3)">3</button>
						<button type="button" onclick="get_ht_list(1,4)">4</button>
						<button type="button" onclick="get_ht_list(1,5)">5</button>
						<button type="button" onclick="get_ht_list(1,6)">6</button>
						<button type="button" onclick="get_ht_list(1,7)">7</button>
						<button type="button" onclick="get_ht_list(1,8)">8</button>
						<button type="button" onclick="get_ht_list(1,9)">9</button>
						<button type="button" onclick="get_ht_list(1,10)">10</button>
						<span class="nv"><button type="button" class="pgn-nx2"
								onclick="get_ht_list(1,11)">다음</button>
							<button type="button" class="pgn-nx1" onclick="get_ht_list(1,60)">맨뒤로</button></span>
					</div>
				</div>
				<div class="list_right"></div>
				<div class="clear"></div>
			</div>
		</div>

	</div>
	<c:import url="../footer.jsp" />
</body>
</html>