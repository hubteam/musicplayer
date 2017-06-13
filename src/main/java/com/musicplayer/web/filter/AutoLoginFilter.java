package com.musicplayer.web.filter;

import java.io.IOException;

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

public class AutoLoginFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}
    
	//自动登陆过滤器实现
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		path = uri.substring(path.length()); 

		//如果请求的资源不是login.jsp，也不是/servlet/loginServlet，才往下执行
		if (!("/login.jsp".equals(path) || "/servlet/loginServlet".equals(path))) {
			User user = (User) request.getSession().getAttribute("user");
			//如果session得到了user对象，说明已经登录过或自动登录过。
			//那么请求下一个资源时就不用执行自动登录了。
			//用户没有登录过，我们才执行自动登录 
			if (user == null) {
				// 2、处理业务
				// 得到cookies数组
				Cookie[] cookies = request.getCookies();
				String username = "";
				String password = "";
				// 从数组中找到想要的user对象的信息
				for (int i = 0; cookies != null && i < cookies.length; i++) {
					if ("user".equals(cookies[i].getName())) {
						String value = cookies[i].getValue();// tom&123
						String[] values = value.split("&");
						username = values[0];
						password = values[1];
					}
				}

				// 登录操作（后期补上）
				
			}
		}
		
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
