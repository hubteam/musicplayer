package com.musicplayer.web.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public class GlobalCodeFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 解決全局编码乱码的问题
		HttpServletRequest req = (HttpServletRequest) request;
		//HttpServletResponse resp = (HttpServletResponse) response;
		
		req = new MyRequest(req);
		//resp.setContentType("text/html;charset=utf-8");
		
		chain.doFilter(req, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}

class MyRequest extends HttpServletRequestWrapper{

	private HttpServletRequest request;
	
	public MyRequest(HttpServletRequest request) {
		super(request);
		this.request = request;
	}

	@Override
	public String getParameter(String name) {
		if (name != null) {
			String[] st = (String[]) getParameterMap().get(name);
			if (st != null && st.length > 0) {
				return st[0];
			}
		}
		return null;
	}

	@Override
	public Map<String, String[]> getParameterMap() {
		boolean flag = true;//标志位
		Map<String, String[]> map = request.getParameterMap();
		if(flag){
			for (Map.Entry<String, String[]> m : map.entrySet()) {
				String[] value = m.getValue();
				for (int i = 0; i < value.length; i++) {
					try {
						value[i] = new String(value[i].getBytes(),"UTF-8");
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			flag = false;
		}
		
		return map;
	}

	@Override
	public String[] getParameterValues(String name) {
		if(name != null){
			return getParameterMap().get(name);
		}
		return null;
	}
	
	
	
}
