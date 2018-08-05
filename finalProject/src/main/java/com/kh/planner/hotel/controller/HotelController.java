package com.kh.planner.hotel.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.planner.hotel.model.service.HotelService;

@Controller
public class HotelController {

	@Autowired
	HotelService service;
	
	@RequestMapping("hotel.do")
	public String hotelList() {
		
		return "hotel/hotelList";
	}

	@RequestMapping("hotelList.do")
	public void selectHotelList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="areaCode", defaultValue="1" ) String areaCode, @RequestParam(value="sigunguCode", defaultValue="1" ) String sigunguCode) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		    String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=";
	        String serviceKey = "z7V6sSliIR%2Bo5YnTbwqckgea9o%2BSsyWLHFX5ArEqzUHcsMnTtcIpHydqeqqD1erNziNIyDJ%2Fe7ZNvx6WZkcy0A%3D%3D";
	        String parameter = "";
	        
	        PrintWriter out = response.getWriter();    
	        
	        parameter = parameter + "&" + "areaCode=" + areaCode;        //JSP���� �޾ƿ� contentid, contentTypeid
	        parameter = parameter + "&" + "sigunguCode=" + sigunguCode;
	        parameter = parameter + "&" + "numOfRows=15";
	        parameter = parameter + "&" + "pageSize=15";
	        parameter = parameter + "&" + "pageNo=1";
	        parameter = parameter + "&" + "startPage=1";
	        parameter = parameter + "&" + "MobileOS=ETC";
	        parameter = parameter + "&" + "MobileApp=AppTest";
	        parameter = parameter + "&" + "arrange=A";
	        parameter = parameter + "&" + "listYN=Y";
	        parameter = parameter + "&" + "_type=json";
	        addr = addr + serviceKey + parameter;
	        URL url = new URL(addr);
	 
	        System.out.println(addr);
	 
	        InputStream in = url.openStream();                            //URL�� ���� �ڹٷ� ������ �о������ URL��ü�� ��Ʈ�� ����
	 
	        ByteArrayOutputStream bos1 = new ByteArrayOutputStream();        //InputStream�� �����͵��� ����Ʈ �迭�� �����ϱ� ����
	        IOUtils.copy(in, bos1);            //InputStream�� �����͸� ����Ʈ �迭�� ����
	        in.close();
	        bos1.close();
	 
	        String mbos = bos1.toString("UTF-8");
	 
	        byte[] b = mbos.getBytes("UTF-8");
	        String s = new String(b, "UTF-8");        //String���� Ǯ���ٰ� byte�迭�� �ߴٰ� �ٽ� String���� �ؼ� json�� ������ �迭�� print?? ���� �� �𸣰ڴ�
	        out.println(s);
	 
	        JSONObject json = new JSONObject();
	        json.put("data", s);   
	}

}
