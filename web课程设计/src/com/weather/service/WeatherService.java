package com.weather.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.weather.utils.HttpUtil;

public class WeatherService {

	private static final String KEY = "a9cd96368bb174cb77b55a611c12b4f6";
	private static final String BASE_URL = "http://v.juhe.cn/weather/index?format=2";
	
	public String getWeather(String cityName) {
		
		String url = BASE_URL + "&cityname=" + cityName +"&key=" + KEY;
		System.out.println(url);
		String resp = HttpUtil.doGet(url);
		System.out.println(resp);
		try {
			// 通过map用来组装页面的数据
			Map<String, Object> page = new HashMap<>();
			// 解析获取的天气数据
			JSONObject respObj = new JSONObject(resp);
			JSONObject result = respObj.getJSONObject("result");
			// 今天天气数据
			JSONObject today = result.getJSONObject("today");
			page.put("cityName", cityName); 
			page.put("date_y", today.getString("date_y")); // 日期
			page.put("week", today.getString("week"));// 星期
			page.put("weather", today.getString("weather"));// 天气
			page.put("temperature", today.getString("temperature"));// 温度范围
			page.put("uv_index", today.getString("uv_index"));// 紫外线
			page.put("dressing_index", today.getString("dressing_index"));// 穿衣指数
			page.put("travel_index", today.getString("travel_index"));// 旅游指数
			page.put("wash_index", today.getString("wash_index"));// 洗车指数
			JSONObject weather_id = today.getJSONObject("weather_id"); 
			String fa = weather_id.getString("fa"); // 天气标识，用来识别天气种类
			String imgUrl = "img/" + fa + ".png";// 拼接天气图标url
			page.put("imgUrl", imgUrl); 
			
			// 当前天气实况数据
			JSONObject sk = result.getJSONObject("sk");
			page.put("temp", sk.getString("temp")); // 温度
			page.put("wind_direction", sk.getString("wind_direction"));// 风向
			page.put("wind_strength", sk.getString("wind_strength"));// 风力
			page.put("humidity", sk.getString("humidity"));// 湿度
			
			// 原始的未来一周天气
			JSONArray future = result.getJSONArray("future");
			// 创建链表，用来存储解析出来的一周天气数据
			ArrayList<Map<String,Object>> futureList = new ArrayList<>();
			for (int i = 0; i < future.length(); i++) {
				// 每天的天气用一个map存储
				Map<String, Object> itemMap = new HashMap<>();
				// 循环获取原始的一周中的每天天气
				JSONObject item = future.getJSONObject(i);
				itemMap.put("weather", item.getString("weather")); 
				itemMap.put("wind", item.getString("wind")); 
				itemMap.put("week", item.getString("week")); 
				
				String date = dateFormat(item.getString("date"), "yyyyMMdd", "MM月dd日");
				itemMap.put("date", date); 
				String temperature = item.getString("temperature");
				temperature = temperature.substring(temperature.indexOf("~") + 1); // 截取最高温度
				itemMap.put("temperature", temperature); 
				
				JSONObject w_id = item.getJSONObject("weather_id"); 
				String w_fa = w_id.getString("fa"); // 天气标识，用来识别天气种类
				String w_imgUrl = "img/" + w_fa + ".png";// 拼接天气图标url
				itemMap.put("imgUrl", w_imgUrl); 
				futureList.add(itemMap);
			}
			// 将自己组装好的一周天气添加到page中
			page.put("futureList", futureList);
			// 最后将map转换成json返回
			return new JSONObject(page).toString();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	// 将格式为format1的时间字符串转换成format2格式
	public String dateFormat(String datetime,String format1, String format2) {
		SimpleDateFormat sdf = new SimpleDateFormat(format1);
		SimpleDateFormat newSdf = new SimpleDateFormat(format2);
		try {
			Date date = sdf.parse(datetime);
			String newDate = newSdf.format(date);
			return newDate;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String test() {
		return "{\"temp\":\"8\",\"week\":\"星期四\",\"dressing_index\":\"较冷\",\"futureList\":[{\"date\":\"12月10日\",\"imgUrl\":\"img/01.png\",\"week\":\"星期四\",\"weather\":\"多云转晴\",\"temperature\":\"11℃\",\"wind\":\"北风微风\"},{\"date\":\"12月11日\",\"imgUrl\":\"img/00.png\",\"week\":\"星期五\",\"weather\":\"晴转多云\",\"temperature\":\"12℃\",\"wind\":\"西北风微风\"},{\"date\":\"12月12日\",\"imgUrl\":\"img/00.png\",\"week\":\"星期六\",\"weather\":\"晴\",\"temperature\":\"13℃\",\"wind\":\"东北风微风\"},{\"date\":\"12月13日\",\"imgUrl\":\"img/07.png\",\"week\":\"星期日\",\"weather\":\"小雨转雨夹雪\",\"temperature\":\"9℃\",\"wind\":\"北风5-6级\"},{\"date\":\"12月14日\",\"imgUrl\":\"img/06.png\",\"week\":\"星期一\",\"weather\":\"雨夹雪转多云\",\"temperature\":\"3℃\",\"wind\":\"北风3-5级\"},{\"date\":\"12月15日\",\"imgUrl\":\"img/00.png\",\"week\":\"星期二\",\"weather\":\"晴\",\"temperature\":\"13℃\",\"wind\":\"东北风微风\"},{\"date\":\"12月16日\",\"imgUrl\":\"img/00.png\",\"week\":\"星期三\",\"weather\":\"晴\",\"temperature\":\"13℃\",\"wind\":\"东北风微风\"}],\"travel_index\":\"较不宜\",\"wash_index\":\"较适宜\",\"wind_direction\":\"东北风\",\"imgUrl\":\"img/01.png\",\"uv_index\":\"弱\",\"weather\":\"多云转晴\",\"temperature\":\"4℃~11℃\",\"date_y\":\"2020年12月10日\",\"humidity\":\"80%\",\"wind_strength\":\"1级\"}";
	}
	
}
