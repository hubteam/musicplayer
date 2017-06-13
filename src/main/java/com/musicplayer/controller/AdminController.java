package com.musicplayer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.musicplayer.entity.Admin;
import com.musicplayer.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public ModelAndView adminLogin(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "adminName") String name,@RequestParam(value = "adminPass") String pass){
		//������
		//System.out.println(name+"   "+pass);
		HttpSession session = request.getSession();
		
		Admin admin = new Admin();
		admin.setAdminName(name);
		admin.setAdminPass(pass);
		ModelAndView mv = new ModelAndView();
		int flag = adminService.login(admin);
		if(flag==1){
			//�����õ�
			session.setAttribute("user", "admin");
			mv.setViewName("redirect:/adminPage/menu.jsp");
			//mv.setViewName("redirect:/song/songList");
		}
		else{
			mv.addObject("msg", "用户名或密码错误");
			mv.setViewName("forward:/adminPage/adminSignin.jsp");
		}
		return mv;
	}
}
