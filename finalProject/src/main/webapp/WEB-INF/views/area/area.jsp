<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header.do" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/common/component.js"></script>
<script type="text/javascript"
	src="resources/js/common/common_script.js"></script>
<script type="text/javascript" src="resources/js/area/area_common.js"></script>
<link href="resources/css/area/area.css" rel="stylesheet" />
<link href="resources/css/city/main.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>페스티벌 플래너</title>
<script>
var sidoName = '${sidoName}';
var sidoCode = '${sidoCode}';
var sigunguName = '${sigunguName}';
var sigunguCode = '${sigunguCode}';
var contenttypeid = '${contenttypeid}';

$(document).ready(function(){
	get_city();
	popList(sidoCode, sigunguCode, 12);
	$(document).on('click','.travel_city',function(){
		var _this_show = $(this).attr('data-show');
		var _this_code = $(this).attr('code');
		$('.travel_city').each(function(){
			if($(this).attr('data-show') != _this_show){
				$(this).removeClass('on');
				$('.city_arrow',this).attr('src',$('.city_arrow').attr('src').replace('_on.gif','.gif'));				
				$(this).attr('data-on','off');
				$('.travel_hide[data-id='+$(this).attr('data-show')+']').slideUp('fast');
			}
		});

		if($(this).attr('data-on') == 'off'){
			var object = $('.travel_hide[data-id='+$(this).attr('data-show')+']');
			$(this).addClass('on');
			$('.city_arrow',this).attr('src',$('.city_arrow').attr('src').replace('.gif','_on.gif'));
			$(this).attr('data-on','on');
			object.attr('style', 'height:' + (Math.ceil(object.children().length/5)) * 55 + 'px');
			object.slideDown();
			console.log(Math.ceil(object.children().length/5));
		}else{
			var object = $('.travel_hide[data-id='+$(this).attr('data-show')+']');
			$('.travel_city').removeClass('on');
			$('.city_arrow',this).attr('src',$('.city_arrow').attr('src').replace('_on.gif','.gif'));
			$(this).attr('data-on','off');
			object.attr('style', 'height:' + (Math.ceil(object.children().length/5)) * 55 + 'px');
			object.slideUp();
			console.log(Math.ceil(object.children().length/5));
		}
	});
});

function get_city() {
	console.log("get_city");
	$.ajax({
		type:'get',
		url:'areaList.do',
		dataType : 'json',
		success:function(data) {
			var object = data.response.body.items.item;
			_html = "";

			$.each(object ,function(index,item){
				console.log("get_city::index: ", index);
				console.log("get_city::item: ", item);
				console.log("get_city::sidoName: ", sidoName);
				console.log("get_city::sidoCode: ", sidoCode);
				if(index != 7) {
					if(index < 10) {
					_html += '<div class="travel_city" data-on="off" data-show="00' + index + '" code="' + item.code + '">';
					} else {
					_html += '<div class="travel_city" data-on="off" data-show="0' + index + '" code="' + item.code + '">';
					}
				_html += '<div>';
				_html += '<span>' + item.name + '</span> <img src="/planner/resources/images/area/area_arrow.gif" alt=""';
				_html += 'class="city_arrow">';
				_html += '<div class="clear"></div>';
				_html += '</div>';
				_html += '</div>';
				get_sigungu(index, object[index].code, object[index].name);
				}
				if(index == 8) {
					_html += '<div class="clear"></div>';
					$('.pa10').html(_html);
					_html = "";
										} 
					if(index == 16){
					_html += '<div class="clear"></div>';
					$('.pa20').html(_html);
	}
										});
					}
				});
	}

	function get_sigungu(id, sidoCode, sidoName) {
		console.log("get_sugungu");
		$
				.ajax({
					type : 'get',
					url : 'sigunguCount.do',
					data : {
						sidoCode : sidoCode
					},
					dataType : 'json',
					success : function(data) {
						var count = data.response.body.totalCount;
						$.ajax({
									type : 'get',
									url : 'sigunguList.do',
									data : {
										sidoCode : sidoCode,
										numOfSigungu : count
									},
									dataType : 'json',
									success : function(data) {
										var object = data.response.body.items.item;
										console.log("get_sigungu::sidoCode: ",sidoCode);
										console.log("get_sigungu::object: ",object);
										_html = "";
										if (id < 10) {
											_html += '<div class="travel_hide" data-id="00' + id + '" style="">';
										} else {
											_html += '<div class="travel_hide" data-id="0' + id + '" style="">';
										}
										_html += ('<a href="javascript:moveAreaMain('
												+ "'"
												+ sidoName
												+ "', '"
												+ sidoCode
												+ "'"
												+ ')" class="travel_ar">'
												+ sidoName + ' </a>');
										$.each(object,	function(index, item) {
												_html += ('<a href="javascript:moveAreaMain('
														+ "'"
														+ sidoName
														+ "', '"
														+ sidoCode
														+ "', '"
														+ object[index].name
														+ "', '"
														+ object[index].code
														+ "'"
														+ ')" class="travel_ar">'
														+ object[index].name + ' </a>');
														});
										_html += '</div>';
										if (id < 9) {
											$('.pa10').after(_html);
										} else {
											$('.pa20').after(_html);
										}
									}
								});
					}
				});
	}

	/*function get_reco_city() { 
		console.log('aaaa');
		_ct_code = $('.po_city_area.on').attr('data');
		console.log(_ct_code);
		$
				.ajax({
					type : 'POST',
					url : '/api/city/get_reco_city',
					data : {
						'ct_code' : _ct_code
					},
					success : function(data) {
						console.log('nnnnnn');
						console.log(data);
						_html = '';

						$
								.each(
										data.response_data,
										function(key, val) {
											_html += '<a href="/ko/city/'+val.ci_name_url+'" class="po_city"><div class="po_city_name">'
													+ val.ci_name + '</div>';
											_html += '<img src="'
													+ val.ci_image
													+ '" alt="" <a href="/ko/city/</a>';
										});

						_html += '<div class="clear"></div>';

						$('.po_city_box').html(_html);
					}
				});
	} */

	function moveContent(contenttypeid, contentid, title) {
		<c:url var="contents" value="/contentDetail.do"></c:url>
		var contenttypename = '-1';
		var form = $("<form>");
		form.attr("id", "contentDetail");
		form.attr("method", "post");
		form.attr("action", "${contents}");
		
		switch(contenttypeid) {
		case 15 :
			contenttypename = '축제/행사';
			break;
		case 12 :
			contenttypename = '관광지';
			break;
		case 14 :
			contenttypename = '문화시설';
			break;
		case 32 :
			contenttypename = '숙박';
			break;
		case 38 :
			contenttypename = '쇼핑';
			break;
		case 39 :
			contenttypename = '음식';
		}

		$("<input type='hidden'>").attr("name", "contenttypeid").val(
				contenttypeid).appendTo(form);
		$("<input type='hidden'>").attr("name", "contenttypename").val(
				contenttypename).appendTo(form);
		$("<input type='hidden'>").attr("name", "contentid").val(contentid)
				.appendTo(form);
		$("<input type='hidden'>").attr("name", "title").val(title).appendTo(
				form);

		form.appendTo($("#header"));
		form.submit();
	}
	
</script>
</head>
<body>
	<div class="clear"></div>
	<div class="area_top">
		<div class="wrap">
			<div class="area_top_title">어디로 행사를 가시나요?</div>

			<div class="search_area">
				<input class="search_input" id="city_search" placeholder="지역명으로 검색">
				<div id="city_autocomplete"></div>
				<div class="latest_search">
					추천도시 : <a href="#" class="latest_a">제주도</a>
				</div>
				<a class="go_map" href="javascript:void(0)"
					onclick="et_full_modal('/modal/world_map')">지도에서 검색 ></a>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<div class="area_silver">
		<div class="wrap">
			<div class="area_title">국내 여행지</div>
			<div class="travel_box">
				<!-- <div class="travel_section">
				<div class="travel_left">
					주요도시				</div>
				<div class="clear"></div>
			</div> -->
				<div class="travel_section pa10">
					<div class="clear"></div>
				</div>
				<div class="travel_section pa20">
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="area_white">
		<div class="wrap">
			<div class="area_title">국내 인기 여행지</div>
			<div class="area_bg line spot_list silver">
				<div class="wrap">
					<div class="pospot_tab_box">
						<div class="pospot_tab on" data-cate="12">관광지</div>
						<div class="pospot_tab" data-cate="14">문화시설</div>
						<div class="pospot_tab" data-cate="32">숙박</div>
						<div class="pospot_tab" data-cate="38">쇼핑</div>
						<div class="pospot_tab last" data-cate="39">음식</div>
						<div class="pospot_tab_blank">&nbsp;</div>
						<div class="clear"></div>
					</div>
					<div class="pospot_content"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<c:import url="/footer.do"></c:import>
</body>
</html>