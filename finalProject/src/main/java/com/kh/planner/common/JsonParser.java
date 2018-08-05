package com.kh.planner.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.kh.planner.hotel.model.vo.HotelVo;

public class JsonParser {

	public ArrayList<HotelVo> getHotelList(String area, String sigungu) { // 시,
																			// 시군구의
																			// 호텔리스트
		ArrayList<HotelVo> list = null;
		try {
			String json;
			String address = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay"
					+ "?serviceKey=z7V6sSliIR%2Bo5YnTbwqckgea9o%2BSsyWLHFX5ArEqzUHcsMnTtcIpHydqeqqD1erNziNIyDJ%2Fe7ZNvx6WZkcy0A%3D%3D"
					+ "&numOfRows=15" + "&pageSize=15" + "&pageNo=1" + "&startPage=1" + "&MobileOS=ETC"
					+ "&MobileApp=AppTest" + "&arrange=A" + "&listYN=Y" + "&areaCode=" + area + "&sigunguCode="
					+ sigungu + "&_type=json";
			BufferedReader br;
			URL url;
			HttpURLConnection conn;
			String protocol = "GET";

			url = new URL(address);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod(protocol);
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			json = br.readLine();
			System.out.println(json);
			
			list = new ArrayList<HotelVo>();
			String[] tagList = { "addr1", "addr2", "areacode", "booktour", "cat1", "cat2", "cat3", "contentid",
					"contenttypei", "createdtime", "firstimage", "firstimage2", "mapx", "mapy", "mlevel",
					"modifiedtime", "readcount", "sigungucode", "tel", "title" };

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(json);
			System.out.println(obj);
			JSONObject records = (JSONObject) obj.get("response");
			for (int i = 0; i < records.size(); i++) {
				HotelVo hd = new HotelVo();
				JSONObject tmp = (JSONObject) records.get(i);
				hd.setAddr1((String) tmp.get(tagList[i]));
				hd.setAddr2((String) tmp.get(tagList[i]));
				hd.setAreacode((String) tmp.get(tagList[i]));
				hd.setBooktour((String) tmp.get(tagList[i]));
				hd.setCat1((String) tmp.get(tagList[i]));
				hd.setCat2((String) tmp.get(tagList[i]));
				hd.setCat3((String) tmp.get(tagList[i]));
				hd.setContentid((String) tmp.get(tagList[i]));
				hd.setContenttypeid((String) tmp.get(tagList[i]));
				hd.setCreatedtime((String) tmp.get(tagList[i]));
				hd.setFirstimage((String) tmp.get(tagList[i]));
				hd.setFirstimage2((String) tmp.get(tagList[i]));
				hd.setMapx((String) tmp.get(tagList[i]));
				hd.setMapy((String) tmp.get(tagList[i]));
				hd.setMlevel((String) tmp.get(tagList[i]));
				hd.setModifiedtime((String) tmp.get(tagList[i]));
				hd.setReadcount((String) tmp.get(tagList[i]));
				hd.setSigungucode((String) tmp.get(tagList[i]));
				hd.setTel((String) tmp.get(tagList[i]));
				hd.setTitle((String) tmp.get(tagList[i]));
				list.add(hd);
				System.out.println(hd);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
