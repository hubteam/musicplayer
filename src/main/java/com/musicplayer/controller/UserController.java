package com.musicplayer.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.*;

import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*; 
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.musicplayer.entity.Message;
import com.musicplayer.entity.User;
import com.musicplayer.service.UserService;
import com.musicplayer.util.MD5Util;
import com.musicplayer.util.SendMailUtil;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
//	@RequestMapping(value="/login")
//	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "userName") String userName,@RequestParam(value = "password") String password,String flag){ 
//		ModelAndView mv = new ModelAndView();
//		System.out.println("login");
//		System.out.println("checked"+"   "+flag);
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("user", userName);
//		if(flag != null || !("".equals(flag))){
//			Cookie cookie = new Cookie("cookie_user", userName+"-"+password);				
//			cookie.setMaxAge(60*60*24*30); //cookie 保存30天
//			response.addCookie(cookie);
//		}else{	
//			Cookie cookie = new Cookie("cookie_user",userName+"-"+null);				
//			cookie.setMaxAge(60*60*24*30); //cookie 保存30天
//			response.addCookie(cookie);				
//		}
//		
//		
//		mv.setViewName("/song/showAll");
//		
//		return mv;
//	}
	
	@RequestMapping(value="/login")
	public ModelAndView checkLogin(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "userName") String userName,@RequestParam(value = "password") String password,String flag){ 
		ModelAndView mv = new ModelAndView();
		User user = new User();
		user.setUserName(userName);
		System.out.println("username"+userName);
		user.setPassword(MD5Util.md5(password));
		System.out.println("checkLogin");
		System.out.println(userName);
		int isLogin;
		
		isLogin = userService.login(user);
	//	Message mes = new Message();
		//HttpSession session = request.getSession();
		if(isLogin == 1){
			//session.setAttribute("user", userName);
			//mv.setViewName("/userPage/index.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("user", userName);
			if(flag != null || !("".equals(flag))){
				Cookie cookie = new Cookie("cookie_user", userName+"-"+password);				
				cookie.setMaxAge(60*60*24*30); //cookie 保存30天
				response.addCookie(cookie);
			}else{	
				Cookie cookie = new Cookie("cookie_user",userName+"-"+null);				
				cookie.setMaxAge(60*60*24*30); //cookie 保存30天
				response.addCookie(cookie);				
			}
			
		}else{
			//mes.setMes("");
			//mv.addObject("mes","用户名或密码错误");
			System.out.println("error");
		}
		mv.setViewName("/song/showAllList");
		return mv;
	}
	
	@RequestMapping(value="/register")
	public String register(String userName,String email,String password,String confirmPassword){
		//ModelAndView mv = new ModelAndView();
		
			User user = new User();
			user.setMail(email);
			user.setPassword(MD5Util.md5(password));
			user.setUserName(userName);
			
			userService.register(user);	
			//mv.setViewName("/userPage/index.jsp");
		    return "redirect:/song/showAllList";		
	}
	
	@RequestMapping(value="/changeRes")
	public String changeRes(HttpServletRequest request,String userName,String password,String confirmPassword,String email,String sex){
		//ModelAndView mv = new ModelAndView();
		User user = new User();
		user.setMail(email);
		user.setPassword(MD5Util.md5(password));
		user.setSex(sex);
		user.setUserName(userName);
		userService.changeRes(user);
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("user");
		if(name != null || !("".equals(name))){
			session.invalidate();
			//mv.setViewName("/userPage/index.jsp");
		}
		return "redirect:/song/showAlList";
	}
	
	@RequestMapping(value="/checkName")
	public @ResponseBody Message checkName(String username){
		System.out.println(username);
		
		int flag = userService.checkUserName(username);
		if(username == null || "".equals(username)){
			flag=0;
		}
		Message mes = new Message();
		if(flag == 1){
			System.out.println("cunzaile");
			mes.setMes("用户名已经存在");
		}else{
			//mes.setMes("用户名");
		}
		return mes;
	}
	
	@RequestMapping(value="/checkName1")
	public @ResponseBody Message checkName1(String username){
		System.out.println(username);
		
		int flag = userService.checkUserName(username);
		if(username == null || "".equals(username)){
			flag=0;
		}
		Message mes = new Message();
		if(flag == 1){
			//System.out.println("cunzaile");
			
		}else{
			//mes.setMes("用户名");
			mes.setMes("用户名不存在");
		}
		return mes;
	}
	
	@RequestMapping(value="/logOut")
	public String logOut(HttpServletRequest request){
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("user");
		System.out.println("test");
		System.out.println(name);
		//ModelAndView mv = new ModelAndView();
		if(name != null || !("".equals(name))){
			session.invalidate();
			//mv.setViewName("/song/showAll");
		}

		return "redirect:/song/showAllList";
	}
	
	@RequestMapping(value="/showOneUser")
	public @ResponseBody User showOneUser(@RequestParam(value="loginName") String loginName){
		User user = new User();
		System.out.println(loginName);
		List<User> list = userService.showOneUser(loginName);
		user = list.get(0);
		return user;
	}
	
	@RequestMapping(value="/sendMail")
	public @ResponseBody Message sendMail(HttpServletRequest req){
		String to = req.getParameter("address");
		Message mes = new Message();		
		 Random random = new Random();
		 String fourRandom = random.nextInt(10000)+"";
		 int randLength = fourRandom.length();
	        if(randLength<4){
	          for(int i=1; i<=4-randLength; i++)
	              fourRandom = "0" + fourRandom  ;
	     }
	      
		SendMailUtil.sendMail(to, fourRandom);
		mes.setMes(fourRandom);
		return mes;
	}
	

	
	@RequestMapping(value="/checkCode")
	public @ResponseBody Message checkCode(String checkCode,String email){
		
		 Message mes = new Message();
	     if(email.equals(checkCode)) {
	    	 
	     }else{
	    	 mes.setMes("验证码不正确，请重新输入");
	     }
	              
		return mes;
	}
	
	@RequestMapping(value="/findPass")
	public String findPass(String userName,String password){
		//ModelAndView mv = new ModelAndView();
		User user = new User();
		
		user.setPassword(MD5Util.md5(password));
		user.setUserName(userName);
		userService.findUserPass(user);
		//mv.setViewName("/userPage/index.jsp");
		return "redirect:/song/showAllList";
	}
	
	
	
}
