package com.musicplayer.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.musicplayer.entity.Like;
import com.musicplayer.entity.Message;
import com.musicplayer.entity.Song;
import com.musicplayer.service.LikeService;

@Controller
@RequestMapping(value="/like")
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	@RequestMapping(value="/cherish")
	public @ResponseBody void collect(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="songId") String songId) throws ParseException{
		//String songId = request.getParameter("songId");
		int sid = Integer.parseInt(songId);
		System.out.println("siiiiiiiiiiiiiid"+sid);
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		Like like = new Like();
		like.setSongId(sid);
		like.setUserName(userName);
		
		Date date = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String str = sdf.format(date);
		Date dd = sdf.parse(str);
		
		int flag = likeService.isLike(like);
		if(flag == 1){
			likeService.deleteLike(like);
		}else{
			like.setLikeTime(dd);
			likeService.insertLike(like);
		}
		//Message mes = new Message();
		//mes.setMes("success");
		//return mes;
	}
	
	
	@RequestMapping(value="/allLike")
	public ModelAndView allLike(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		List<Song> list = likeService.selectClick(userName);
		mv.addObject("list",list);
		mv.setViewName("/userPage/like-list.jsp");
		return mv;
	}
	
	@RequestMapping(value="/isLike")
	public @ResponseBody List<Song> isLike(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		List<Song> list = likeService.selectClick(userName);
		System.out.println("当前的用户是"+userName);
		System.out.println("数据的条数是"+list.size());
		return list;
	}
	
	
}
