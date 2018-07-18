/*package com.springmvcexample.security;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LogInterceptor implements HandlerInterceptor{
	
	public static final Logger log = LoggerFactory.getLogger(LogInterceptor.class);
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception arg3)
			throws Exception {
		log.info("Request Completed:"+new SimpleDateFormat("HH:mm:ss").format(new Date()));
	}
 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView model)
			throws Exception {
		log.info("Method Executed:"+new SimpleDateFormat("HH:mm:ss").format(new Date()));
	}
 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		log.info("Before Executed:"+new SimpleDateFormat("HH:mm:ss").format(new Date()));
		return true;
	}

}
*/