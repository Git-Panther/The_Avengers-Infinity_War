package com.kh.planner.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

import com.kh.planner.hotel.model.vo.HotelVo;

public class XmlParser {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Date date = new Date();
	String today = sdf.format(date);

	public ArrayList<HotelVo> getAllHotelList() {
		ArrayList<HotelVo> HotelList = null;

		try {
			String baseUrl = "http://kopis.or.kr/openApi/restful/boxoffice?service=d11d486f591e447d84737299b2895c19&ststype=";
			System.out.println("XmlRequestUrl: " + baseUrl);
			SAXBuilder builder = new SAXBuilder();
			Document doc = (Document) builder.build(new java.net.URL(baseUrl));
			Element root = doc.getRootElement(); // result

			List<Element> list = root.getChildren("boxof");
			HotelList = new ArrayList<HotelVo>();
			String[] tagList = { "area", "prfdtcnt", "prfpd", "cate", "prfplcnm", "prfnm", "rnum", "seatcnt", "poster",
					"mt20id" };
			for (int i = 0; i < list.size(); i++) {
				HotelVo hotelData = new HotelVo();
				Element show = list.get(i);
				//hotelData.setter(show.getChildText(tagList[0]));
				HotelList.add(hotelData);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return HotelList;
	}
	
	//키워드 검색
	//http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?serviceKey=z7V6sSliIR%2Bo5YnTbwqckgea9o%2BSsyWLHFX5ArEqzUHcsMnTtcIpHydqeqqD1erNziNIyDJ%2Fe7ZNvx6WZkcy0A%3D%3D&MobileApp=AppTest&MobileOS=ETC&pageNo=1&startPage=1&numOfRows=15&pageSize=15&listYN=Y&arrange=A&contentTypeId=32&areaCode=1&cat1=B02&keyword=%EB%B2%A0

}
