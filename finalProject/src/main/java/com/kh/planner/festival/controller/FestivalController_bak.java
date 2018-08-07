//package com.kh.planner.festival.controller;
//
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.net.MalformedURLException;
//import java.net.URL;
//
//import org.apache.commons.io.IOUtils;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//public class FestivalController {
//	private String key = "kLZYhnukkkQDzQJ58%2FtZe6IjLUnEn%2FTtuQiqyzSwbiJ8e9SiuyV3xFtgwUu9jpqT33DASyAZb8ST3r3xGD4PJQ%3D%3D";
//	
//	@RequestMapping(value="festivalList.do", method=RequestMethod.GET) // xml 파싱 쓸 것
//	public ModelAndView festivalList(ModelAndView mv, int page) {
//		mv.addObject("page", page);
//		mv.setViewName("festival/festivalList");
//		return mv;
//	}
//	
//	@RequestMapping(value = "selectFestivalList.do", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
//	public @ResponseBody String festivalApi(int page){	
//		String address = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";
//		StringBuilder params = new StringBuilder("?");
//		params.append("ServiceKey="+key);
//		params.append("&numOfRows=12"); // 한 번에 조회하는 정보 : 12개
//		params.append("&pageNo="+page); // x페이지
//		params.append("&MobileOS=ETC"); // 모바일이 아니므로 etc
//		params.append("&MobileApp=planner"); // 앱 이름
//		params.append("&arrange=Q"); // D 조건(생성일순)으로 정렬 -> C 조건(수정일 순) -> Q(이미지 있는 수정일 순)
////		params.append("&areaCode=1"); // 지역코드 : 전체
////		params.append("&sigunguCode=ETC"); // 지역코드 : 시군구 - 안 따짐
////		params.append("&eventStartDate=20180101"); // 1월 1일부터
////		params.append("&eventEndDate=20181231"); // 12월 3일까지
//		params.append("&_type=json"); // json으로
//		
//		URL url = null; // 결과를 볼 url
//		InputStream in = null; // 바이트를 읽어오기 위해 필요한 인풋 스트림
//		ByteArrayOutputStream bos1 = null; // 바이트 출력 스트림
//		String result = null; // 바이트 출력 스트림에서 json 문자열을 받을 변수
//		try {
//			url = new URL(address + params.toString());
//			in = url.openStream();
//			bos1 = new ByteArrayOutputStream();
//			IOUtils.copy(in, bos1);
//			in.close();
//			bos1.close();
//			result = bos1.toString();
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
//	@RequestMapping("festival.do")
//	public ModelAndView festival(int contentid, ModelAndView mv) {
//		System.out.println(contentid);
//		mv.addObject("contentid", contentid);
//		mv.setViewName("festival/festivalDetail");
//		return mv;
//	}
//	
//	@RequestMapping(value = "selectFestivalCommon.do", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
//	public @ResponseBody String festivalDetailCommon(int contentid){	
//		String address = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon";
//		StringBuilder params = new StringBuilder("?");
//		params.append("ServiceKey="+key);
//		params.append("&numOfRows=1"); // 상세정보 1개
//		params.append("&pageNo="+1); // 1페이지
//		params.append("&MobileOS=ETC"); // 모바일이 아니므로 etc
//		params.append("&MobileApp=planner"); // 앱 이름
//		params.append("&contentId="+contentid); // 컨텐츠 id
//		params.append("&contentTypeId="+15); // 컨텐츠 분류 id
//		params.append("&defaultYN=Y"); // 기본정보 조회 여부
//		params.append("&firstImageYN=Y"); // 대표이미지 조회
//		params.append("&areacodeYN=Y"); // 지역코드 조회
//		params.append("&catcodeYN=Y"); // 서비스분류코드 조회
//		params.append("&addrinfoYN=Y"); // 주소 조회
//		params.append("&mapinfoYN=Y"); // 좌표 조회
//		params.append("&overviewYN=Y"); // 개요 조회
//		params.append("&_type=json"); // json으로
//		
//		URL url = null; // 결과를 볼 url
//		InputStream in = null; // 바이트를 읽어오기 위해 필요한 인풋 스트림
//		ByteArrayOutputStream bos1 = null; // 바이트 출력 스트림
//		String result = null; // 바이트 출력 스트림에서 json 문자열을 받을 변수
//		try {
//			url = new URL(address + params.toString());
//			in = url.openStream();
//			bos1 = new ByteArrayOutputStream();
//			IOUtils.copy(in, bos1);
//			in.close();
//			bos1.close();
//			result = bos1.toString();
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
//	@RequestMapping(value = "selectFestivalDetailIntro.do", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
//	public @ResponseBody String festivalDetailIntro(int contentid){	
//		String address = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro";
//		StringBuilder params = new StringBuilder("?");
//		params.append("ServiceKey="+key);
//		params.append("&numOfRows=1"); // 상세정보 1개
//		params.append("&pageNo="+1); // 1페이지
//		params.append("&MobileOS=ETC"); // 모바일이 아니므로 etc
//		params.append("&MobileApp=planner"); // 앱 이름
//		params.append("&contentId="+contentid); // 컨텐츠 id
//		params.append("&contentTypeId="+15); // 컨텐츠 분류 id
//		params.append("&introYN=Y"); // 소개정보 조회
//		params.append("&_type=json"); // json으로
//		
//		URL url = null; // 결과를 볼 url
//		InputStream in = null; // 바이트를 읽어오기 위해 필요한 인풋 스트림
//		ByteArrayOutputStream bos1 = null; // 바이트 출력 스트림
//		String result = null; // 바이트 출력 스트림에서 json 문자열을 받을 변수
//		try {
//			url = new URL(address + params.toString());
//			in = url.openStream();
//			bos1 = new ByteArrayOutputStream();
//			IOUtils.copy(in, bos1);
//			in.close();
//			bos1.close();
//			result = bos1.toString();
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
////	@RequestMapping(value="festivalList.do", method=RequestMethod.GET)
////	public ModelAndView festivalList(ModelAndView mv, int page) {
////		String address = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";
////		StringBuilder params = new StringBuilder("?");
////		params.append("ServiceKey="+key);
////		params.append("&numOfRows=12"); // 한 번에 조회하는 정보 : 12개
////		params.append("&pageNo="+page); // x페이지
////		params.append("&MobileOS=ETC"); // 모바일이 아니므로 etc
////		params.append("&MobileApp=planner"); // 앱 이름
////		params.append("&arrange=C"); // D 조건(생성일순)으로 정렬 -> C 조건(수정일 순)
//////		params.append("&areaCode=1"); // 지역코드 : 전체
//////		params.append("&sigunguCode=ETC"); // 지역코드 : 시군구 - 안 따짐
//////		params.append("&eventStartDate=20180101"); // 1월 1일부터
//////		params.append("&eventEndDate=20181231"); // 12월 3일까지
////		params.append("&_type=json"); // json으로
////		
////		URL url = null; // 결과를 볼 url
////		InputStream in = null; // 바이트를 읽어오기 위해 필요한 인풋 스트림
////		ByteArrayOutputStream bos1 = null; // 바이트 출력 스트림
////		String result = null; // 바이트 출력 스트림에서 json 문자열을 받을 변수
////		try {
////			url = new URL(address + params.toString());
////			in = url.openStream();
////			bos1 = new ByteArrayOutputStream();
////			IOUtils.copy(in, bos1);
////			in.close();
////			bos1.close();
////			result = bos1.toString("UTF-8");
////		} catch (MalformedURLException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		} catch (IOException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
////		mv.addObject("festivalList", result);
////		mv.setViewName("festival/festivalList");
////		return mv;
////	}
//	
////	@RequestMapping(value = "festivalApi.do", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
////	public @ResponseBody String festivalApi(){	
////		String address = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";
////		StringBuilder params = new StringBuilder("?");
////		params.append("ServiceKey="+key);
////		params.append("&numOfRows=12"); // 12개
////		params.append("&pageNo=1"); // 1페이지
////		params.append("&MobileOS=ETC"); // 모바일이 아니므로 etc
////		params.append("&MobileApp=test"); // 앱 이름
////		params.append("&arrange=D"); // D 조건으로 정렬
////		params.append("&areaCode=1"); // 지역코드 : 서울
//////		params.append("&sigunguCode=ETC"); // 지역코드 : 시군구
////		params.append("&eventStartDate=20180101"); // 1월 1일부터
////		params.append("&eventEndDate=20181231"); // 12월 3일까지
////		params.append("&_type=json"); // json으로
////		
////		URL url = null; // 결과를 볼 url
////		InputStream in = null; // 바이트를 읽어오기 위해 필요한 인풋 스트림
////		ByteArrayOutputStream bos1 = null; // 바이트 출력 스트림
////		String result = null; // 바이트 출력 스트림에서 json 문자열을 받을 변수
////		try {
////			url = new URL(address + params.toString());
////			in = url.openStream();
////			bos1 = new ByteArrayOutputStream();
////			IOUtils.copy(in, bos1);
////			in.close();
////			bos1.close();
////			result = bos1.toString();
////		} catch (MalformedURLException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		} catch (IOException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
////		return result;
//////		System.out.println(url.toString());
//////		String mbos = bos1.toString("UTF-8");
//////		byte[] b = mbos.getBytes("UTF-8");
//////		String s = new String(b, "UTF-8");
////		
//////		Gson gson = new Gson();
//////		gson.toJson(s, response.getWriter());
////		
//////		response.setContentType("application/json; charset=UTF-8"); 
////		
//////		PrintWriter out = response.getWriter();  
//////		out.println(s);
////		
//////		JSONObject json = new JSONObject();
//////		json.put("data", s);	
//////		return json.toJSONString();
//////		return json;
////	}
////	
////	@RequestMapping("festivalMap.do")
////	public String festivalMap() {
////		return "festival/festivalMap";
////	}
////	
////	@RequestMapping("festivals.do")
////	public ModelAndView festivals(ModelAndView mv) {
////		String address = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";
////		StringBuilder params = new StringBuilder("?");
////		params.append("ServiceKey="+key);
////		params.append("&numOfRows=12"); // 12개
////		params.append("&pageNo=1"); // 1페이지
////		params.append("&MobileOS=ETC"); // 모바일이 아니므로 etc
////		params.append("&MobileApp=test"); // 앱 이름
////		params.append("&arrange=D"); // D 조건으로 정렬
////		params.append("&areaCode=1"); // 지역코드 : 서울
//////		params.append("&sigunguCode=ETC"); // 지역코드 : 시군구
////		params.append("&eventStartDate=20180101"); // 1월 1일부터
////		params.append("&eventEndDate=20181231"); // 12월 3일까지
////		params.append("&_type=json"); // json으로
////		
////		URL url = null; // 결과를 볼 url
////		InputStream in = null; // 바이트를 읽어오기 위해 필요한 인풋 스트림
////		ByteArrayOutputStream bos1 = null; // 바이트 출력 스트림
////		String result = null; // 바이트 출력 스트림에서 json 문자열을 받을 변수
////		try {
////			url = new URL(address + params.toString());
////			in = url.openStream();
////			bos1 = new ByteArrayOutputStream();
////			IOUtils.copy(in, bos1);
////			in.close();
////			bos1.close();
////			result = bos1.toString("UTF-8");
////		} catch (MalformedURLException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		} catch (IOException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
////		mv.addObject("festivalList", result);
////		mv.setViewName("festival/festivals");
////		return mv;
////	}
////	
////	@RequestMapping("festival.do")
////	public ModelAndView festival(String json, ModelAndView mv) {
////		mv.addObject("json", json);
////		mv.setViewName("festival/festivalDetail");
////		return mv;
////	}
//	
//	/*내 주변 좌표
//	 * 
//	 * 
//	 * 
//	 * 
//	 * */
//}
