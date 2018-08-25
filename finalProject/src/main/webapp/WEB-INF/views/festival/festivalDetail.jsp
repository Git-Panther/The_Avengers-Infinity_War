<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="searchArea.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Festival Detail</title>
<link href="resources/css/festival/festivalDetail.css" rel="stylesheet">
<link href="resources/css/festival/festivalMap.css" rel="stylesheet">
<link href="resources/css/review.css" rel="stylesheet">
</head>
<body>
				<!--  댓글  -->
   		<div class="spot_info_box community" style="width : 760px;">
				<div class="community_tab on line" data-id="review">리뷰</div>
				<div class="community_tab" data-id="qa"></div>
				<div class="clear"></div>

				<div class="cmmt_tab_content review">
				<c:forEach items="${rlist }" var="review">
				
					<div class="cmmt_content_box">
						<a class="cmmt_c_user"
							href="내정보보기 호출 url" style= "width: 750px;">
							<img
							<c:if test="${empty user.profilePic}">
								src="/planner/resources/images/common/profile/img_profile.png"
							</c:if>
							<c:if test="${!empty user.profilePic}">
								src="/planner/resources/images/common/profile/${review.profilePic}"
							</c:if>
							class="cmmt_content_uimg"
							onerror="this.src='/planner/resources/images/common/profile/img_profile.png';">
							</a>
							<div class="review_opbtn">
							<div class="rv_op_btn rop_delete" data-srl="5353" onclick="reviewDelete(${review.cno})">삭제</div>
							<div class="rv_op_btn line rop_edit" onclick="reviewModify(${review.cno}, this, '${review.content}');">수정</div>
							<div class="rv_op_btn line rop_cancel" onclick="slideUpComment();">취소</div></div>
						<div class="cmmt_c_user_txt">
								<div class="cmmt_c_user_name">
									${review.writerNm }<span>&nbsp;&nbsp;${review.reg_date}</span>
									<div class="clear"></div>
								</div>
								<div class="cmmt_c_user_level">
									<div class="rv_cnt" style="margin-left: 1px;">${review.reviewCnt}개의 평가</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="clear"></div>
						<div class="clear"></div>
						<div class="cmmt_content" style="padding-left :13px;">
							<div class="cmmt_content_info">
								<span>
									<c:choose>
										<c:when test="${review.grade eq 1 }">
											별로에요!
										</c:when>
										<c:when test="${review.grade eq 3 }">
											괜찮아요!
										</c:when>
										<c:otherwise>
											좋아요!
										</c:otherwise>
									</c:choose>
								</span>
							</div>
							${review.content}
						
						</div>
					</div>
				</c:forEach>
				</div>
			

				<div class="page review" style="display: none;"></div>
				<div class="page qa" id="paging"></div>

				<div class="write_area">
				
					<div class="write_review">
						<div class="write_title r">
							<span>경복궁</span> 리뷰 남기기
						</div>

						<div class="review_box">
							<!-- <div class="write_left">
																						  <img src="/planner/resources/images/common/mobile/img_profile.png" onerror="this.src='/planner/resources/images/common/mobile/img_profile.png';" class="cmmt_content_uimg">
														<div class="clear"></div>
						</div> -->
							<div class="write_center">
								<div class="rate_box">
									<div class="rate_btn bad" data-val="1" data="1">별로에요!</div>
									<div class="rate_btn normal" data-val="3" data="3">괜찮아요!
									</div>
									<div class="rate_btn good on" data-val="5" data="5">좋아요!</div>
									<div class="clear"></div>
								</div>
								<textarea class="review_area" id="content" placeholder="장소에 대한 리뷰를 입력하세요."></textarea>
							</div>
							<div class="write_right">
								<div class="btn_review_write" id="si_review_form_submit" style="margin-top: 155px;"
									data="new" onclick="writeComment();">등록</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
			</div>
 	



		<!--댓글  -->
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
				<!-- <td>교통상황</td>  -->
			</tr>
		</table>
	</div>
	<div id="festivalDetail">
		<div id="festivalTitle"><p></p></div>
		<div>
			<table id="festivalInfo">
				<tr>
					<td>
						<div><img id="festivalPicture" /></div>
					</td>
					<td>
						<div id="festivalCommonInfo" class="tapGroup1"></div>
						<div id="festivalMap" class="tapGroup1">
							<div id="map"></div>
							 <div class="markerCategory">
							 	<div id="festivalMarkers" class="markerMenu">
							 		<img class="ico_comm ico_festival"></img>
									축제/행사
							 	</div>
							 	<div id="hotelMarkers" class="markerMenu">
							 		<img class="ico_comm ico_hotels"></img>
									숙박
							 	</div>
							 	<div id="restaurantMarkers" class="markerMenu">
							 		<img class="ico_comm ico_restaurants"></img>
									식당
							 	</div>
						    </div>
						</div>
						<div id="festivalForecast" class="tapGroup1"></div>
						<!-- <div id="festivalTraffic" class="tapGroup1"></div> 교통정보는 지도에 표시하는걸로 -->
					</td>
				</tr>
			</table>
			<div id="favorite" class="link"></div>
		</div>
		<!-- <div id="festivalIntro"></div> -->
		<!-- <br> -->
		<div id="festivalDetailInfo" class="tapGroup2"></div>
		<div id="festivalHotels" class="tapGroup2"></div>
		<div id="festivalRestaurants" class="tapGroup2"></div>
		<br>
		<!--  <div id="festivalComment">코멘트 부분</div> -->
	</div>	
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=339906b6f4278bdec7e4ff5ae52df3cc&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="resources/js/festival/forecast.js"></script>
<script type="text/javascript" src="resources/js/festival/printFestival.js"></script>
<script type="text/javascript" src="resources/js/festival/festivalMap.js"></script>
<script>
	var eventstartdate = <c:out value='${eventstartdate}'/>; // 전역 변수로 만들어 사용해야 외부 js 파일과 쓸 수 있다. 아마?
	var eventenddate = <c:out value='${eventenddate}'/>;
	//var festivalx, festivaly; // x, y축 저장용
	var contentid = ${contentid}, contenttypeid = 15; // 행사의 contentid, contenttypeid
	var userNo;
	var isUser = false;
	<c:if test="${!empty sessionScope.user}">
		isUser = true;
		userNo = <c:out value="${sessionScope.user.userNo}"/>;
	</c:if>
	
	var festivalMarkers = [];
	var hotelMarkers = [], restaurantMarkers = [];
	
	var container = document.getElementById('map');			
	var options = {
		center: new daum.maps.LatLng(33.450701, 126.570667),
		level: 6
		// ,marker: markers // 이미지 지도에 표시할 마커 
	};			
	var map = new daum.maps.Map(container, options);

	function setFestivalEvent(){
		festivalTapEvent(); // 탭 이벤트 추가	
		festivalDetailCommon(${contentid}); // 기본정보 표시	
		festivalDetailInfo(${contentid}); // 반복 정보 표시
		map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC); // 지도에 교통체증 표시
		
		$("#festivalTap td").eq(1).click(); // 기본 정보부터 표시
		$("#festivalTap td").eq(0).click(); // 기본 정보부터 표시
		
		markerCategoryEvent(); // 마커 표시 이벤트 추가
		changeMarker("festivalMarkers"); // 행사 먼저 누르기
	}

    $(function(){
    	setFestivalEvent();
	});
    
    /*댓글  */
    $(function(){
    	//$(".write_area").hide();	
    	//$(".rv_op_btn.rop_cancel").hide();
    	
    	console.log('${user.reviewyn}');
    	<c:if test="${user.reviewyn eq 'N'}">
	    	$(".review_opbtn").hide();
    		$(".write_area").hide();	
    	</c:if>
    	
		$(".rate_btn").click(function(){
			var clickBtn = $(this).data("val");
			$(".rate_btn").each(function(index){
				var forBtn = $(this).data("val");
				if(clickBtn  == forBtn){
					$(this).addClass("on");
				}else{
					$(this).removeClass("on");
				}
				
			});
		});
	});
	
    function writeComment(){
    	var writer = 0;
    	<c:if test="${!empty sessionScope.user}">
    		writer = <c:out value="${sessionScope.user.userNo}"/>;
    	</c:if>
    	if(0 != writer){
    		$.ajax({        
    	        url: 'writeReview.do',
    	        type: 'post',
    	        data: { contenttypeid : ${contenttypeid}, contentid : ${contentid}, content : $("#content").val(), writer:writer, grade:$(".rate_btn.on").data("val") },
    	        success: function(data){
    	        	console.log(data);
    	        	//1. 댓글 작성 성공 여부 화면 출력
    	        	if(data.result == 1){
    	        		alert("댓글 작성 성공 하였습니다.");
    	        	}else{
    	        		alert("댓글 작성 실패 하였습니다.");
    	        	}
    	        	//2. 댓글 리스트 화면에 출력
    	        	setReviewList(data.list);
    	        }, error: function(XMLHttpRequest, textStatus, errorThrown) { 
    	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
    	    	} 
    	    });	
    	}else{
    		alert("로그인 후 이용하세요!");	
    	}
    }
    
    function slideDownComment(){
		$(".rv_op_btn.rop_cancel").show();
		$(".write_area").slideDown(500);
	}

	function slideUpComment(){
		$(".rv_op_btn.rop_cancel").hide();
		$(".write_area").slideUp(500);
	}
    
	function setReviewList(list){
		function pad(num) {
		        num = num + '';
		        return num.length < 2 ? '0' + num : num;
		}
		 
		var reviewDiv = $(".cmmt_tab_content.review");
		reviewDiv.empty();
		
		var reviewHtml = "";
		for(var i in list){
			var writeDate = new Date(list[i].reg_date);
			reviewHtml += '<div class="cmmt_content_box">';
			reviewHtml += 	'<a class="cmmt_c_user" href="내정보보기 호출 url" style= "width: 750px;">';
			reviewHtml += 		'<img ';
			if(list[i].profilePic == ''){
				reviewHtml += 	'src="/planner/resources/images/common/profile/img_profile.png"';
			}else{
				reviewHtml += 	'src="/planner/resources/images/common/profile/' + list[i].profilePic + '" ';
			}
			reviewHtml += 		'class="cmmt_content_uimg" onerror="this.src=\'/planner/resources/images/common/profile/img_profile.png\';">';
			reviewHtml += 	'</a>';
			reviewHtml +=	'<div class="review_opbtn">';
			reviewHtml +=	'<div class="rv_op_btn rop_delete" data-srl="5353" onclick="reviewDelete(' + list[i].cno+ ')">삭제</div>';
			reviewHtml +=	'<div class="rv_op_btn line rop_edit" onclick="reviewModify('+list[i].cno+', this, "'+list[i].content+'");">수정</div>';
			reviewHtml +=	'<div class="rv_op_btn line rop_cancel" onclick="slideUpComment();">취소</div></div>';
			reviewHtml +=	'<div class="cmmt_c_user_txt">';
			reviewHtml +=		'<div class="cmmt_c_user_name">';
			reviewHtml +=		list[i].writerNm + '<span>&nbsp;&nbsp;' + writeDate.getFullYear() + "-" + pad(writeDate.getMonth() + 1) + "-" + pad(writeDate.getDate()) + '</span>';
			reviewHtml +=		'<div class="clear"></div>';
			reviewHtml +=		'</div>';
			reviewHtml +=		'<div class="cmmt_c_user_level">';
			reviewHtml +=			'<div class="rv_cnt" style="margin-left: 1px;">' + list[i].reviewCnt + '개의 평가</div>';
			reviewHtml +=			'<div class="clear"></div>';
			reviewHtml +=		'</div>';
			reviewHtml +=	'</div>';
			reviewHtml +=	'<div class="clear"></div><div class="clear"></div>';
			reviewHtml +=	'<div class="cmmt_content" style="padding-left :13px;">';
			reviewHtml +=		'<div class="cmmt_content_info">';
			console.log(list[i].grade);
			if(list[i].grade == 1){
				reviewHtml +=		'<span>별로에요!</span>';
			}else if(list[i].grade == 3){
				reviewHtml +=		'<span>괜찮아요!</span>';              
			}else{
				reviewHtml +=		'<span>좋아요!</span>';
			}
			reviewHtml += 	'</div>';
			reviewHtml +=	list[i].content;
			reviewHtml +='</div></div>';
			//var dateTd = $("<td>").text(writeDate.getFullYear() + "-" + pad(writeDate.getMonth() + 1) + "-" + pad(writeDate.getDate()));				
		}
		reviewDiv.html(reviewHtml);
		$("#content").val("");
	}
	
	function reviewModify(cno, btn, replyContent){
				
		$(".rv_op_btn").hide();
		
		$(btn).next().removeClass("line").show();
		
		var tr = $("<tr>");
		var tdContent = $("<td colspan='3'><input type='text' id='writeReviewForm' value='"+replyContent+"'/></td>");
		var tdAction = $("<td>"+
							"<button onclick='updateReview("+cno+")'>수정 완료</button>" +
							"<button onclick='cancelReview()'>취소</button>" +
						"</td>");
		tr.append(tdContent);
		tr.append(tdAction);
		
		$(btn).closest("tr").after(tr);
	}
	
	function reviewDelete(cno){
		if(!confirm("댓글을 삭제 하시겠습니까?")){
			return;
		}
		
		$.ajax({        
	        url: 'deleteReview.do',
	        type: 'post',
	        data: { contentid : ${contentid}, cno : cno },
	        success: function(data){
	        	console.log(data);
	        	//1. 댓글 작성 성공 여부 화면 출력
	        	if(data.result == 1){
	        		alert("댓글을 삭제 하였습니다.");
	        	}else{
	        		alert("댓글 삭제에 실패 하였습니다.");
	        	}
	        	//2. 댓글 리스트 화면에 출력
	        	setReviewList(data.list);
	        }, error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });
	}
	
	function updateReview(cno){
		$.ajax({        
	        url: 'updateReview.do',
	        type: 'post',
	        data: { contentid : ${contentid}, cno : cno, content : $("#writeReviewForm").val() },
	        success: function(data){
	        	console.log(data);
	        	//1. 댓글 작성 성공 여부 화면 출력
	        	if(data.result == 1){
	        		alert("댓글을 수정 하였습니다.");
	        	}else{
	        		alert("댓글 수정에 실패 하였습니다.");
	        	}
	        	//2. 댓글 리스트 화면에 출력
	        	setReviewList(data.list);
	        }, error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });
	}
	
	function cancelReview(){
		$.ajax({        
	        url: 'selectReview.do',
	        type: 'post',
	        data: { contentid : ${contentid}},
	        success: function(data){
	        	setReviewList(data.list);
	        }, error: function(XMLHttpRequest, textStatus, errorThrown) { 
	        	alert("Status: " + textStatus); alert("Error: " + errorThrown); 
	    	} 
	    });
	}
	
</script>
</body>
<c:import url="/footer.do"/>
</html>