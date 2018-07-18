package com.springmvcexample.security;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
@Component
public class WebFilter implements Filter {
	
	public static final Logger logger = LoggerFactory.getLogger(WebFilter.class);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.debug("init() method:"+new SimpleDateFormat("HH:mm:ss").format(new Date()));
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			logger.info("Starting a transaction for req : {}", req.getRequestURI());
			logger.debug("time in sec :"+new SimpleDateFormat("ss").format(new Date()));
			chain.doFilter(request, response);
			logger.info("Committing a transaction for req : {}", req.getRequestURI());
			logger.debug("time in sec :"+new SimpleDateFormat("ss").format(new Date()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
	}

	@Override
	public void destroy() {
		logger.debug("time in sec "+new SimpleDateFormat("ss").format(new Date()));

		
	}

	


}
