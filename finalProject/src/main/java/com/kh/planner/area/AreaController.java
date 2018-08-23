package com.kh.planner.area;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.planner.common.JsonParser;

@Controller
public class AreaController {

	private static final Logger logger = LoggerFactory.getLogger(AreaController.class);

	@RequestMapping(value = "area.do", method = RequestMethod.GET)
	public String area() {
		return "area/area";
	}

	@RequestMapping(value = "areaList.do", method = RequestMethod.GET)
	public void areaList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String result = JsonParser.getAreaList();

		PrintWriter out = response.getWriter();
		out.println(result);
		JSONObject json = new JSONObject();
		json.put("data", result);
	}

	@RequestMapping(value = "sigunguCount.do", method = RequestMethod.GET)
	public void sigunguCount(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam String sidoCode)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String result = JsonParser.getSigunguCount(sidoCode);

		PrintWriter out = response.getWriter();
		out.println(result);
		JSONObject json = new JSONObject();
		json.put("data", result);
	}

	@RequestMapping(value = "sigunguList.do", method = RequestMethod.GET)
	public void sigunguList(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam String sidoCode,
			@RequestParam String numOfSigungu) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String result = JsonParser.getSigunguList(sidoCode, numOfSigungu);

		PrintWriter out = response.getWriter();
		out.println(result);
		JSONObject json = new JSONObject();
		json.put("data", result);
	}
	@RequestMapping(value = "areaMain.do", method = RequestMethod.POST)
	public ModelAndView areaMain(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, 
			@RequestParam(value="sidoName", defaultValue="-1") String sidoName,
			@RequestParam(value="sidoCode", defaultValue="-1") String sidoCode,
			@RequestParam(value="sigunguName", defaultValue="-1") String sigunguName,
			@RequestParam(value="sigunguCode", defaultValue="-1") String sigunguCode)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		mv.addObject("sidoName", sidoName);
		System.out.println(sidoName);
		mv.addObject("sidoCode", sidoCode);
		System.out.println(sidoCode);
		mv.addObject("sigunguName", sigunguName);
		System.out.println(sigunguName);
		mv.addObject("sigunguCode", sigunguCode);
		System.out.println(sigunguCode);

		mv.setViewName("area/areaMain");
		return mv;
	}

	@RequestMapping(value = "popList.do", method = RequestMethod.GET)
	public void popList(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(defaultValue = "-1") String sidoCode,
			@RequestParam(defaultValue = "-1") String sigunguCode, 
			@RequestParam String contentTypeId) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String result = JsonParser.getPopList(sidoCode, sigunguCode, contentTypeId);

		PrintWriter out = response.getWriter();
		out.println(result);
		JSONObject json = new JSONObject();
		json.put("data", result);
	}
	
	@RequestMapping(value = "contentDetail.do")
	public ModelAndView areaDetail(ModelAndView mv) throws Exception{
		
		mv.setViewName("area/areaDetail");
		return mv;
	}

}
