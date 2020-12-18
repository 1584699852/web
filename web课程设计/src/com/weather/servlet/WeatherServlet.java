package com.weather.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weather.service.WeatherService;

// 通过注解实现servlet的映射
@WebServlet("/getWeather")
public class WeatherServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取城市
		String cityName = req.getParameter("cityName");
		WeatherService service = new WeatherService();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(service.getWeather(cityName));
//		resp.getWriter().write(service.test());
	}
}
