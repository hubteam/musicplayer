package com.musicplayer.web.filter;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicplayer.entity.User;

public class RemberPassFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		
		
		
		Cookie[] cookies=request.getCookies();  // Cookie c=new Cookie("admin","123456");
		for(Cookie c:cookies){
			String cookieName=URLDecoder.decode(c.getName());
			System.out.println("cookie");
			System.out.println("name是多少"+cookieName);
			//判断之前是否存储过该用户名
			if(cookieName!=null){
				
			}
			
		}
		
		
		
		
		
		
		chain.doFilter(request, response);
	
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
