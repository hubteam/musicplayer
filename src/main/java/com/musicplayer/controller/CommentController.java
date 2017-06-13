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

import com.musicplayer.dao.CommentDao;
import com.musicplayer.entity.Comment;
import com.musicplayer.entity.Song;
import com.musicplayer.entity.User;
import com.musicplayer.service.CommentService;
import com.musicplayer.service.SongService;

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	@Autowired
	private SongService songService;
	
	//发表评论
	@RequestMapping(value="/addComment")
	public @ResponseBody List<Comment> addComment(HttpServletRequest req,HttpServletResponse response,@RequestParam(value="comment") String comment,@RequestParam(value="songId") int id) throws ParseException{
		
		HttpSession session = req.getSession();
		String userName = (String) session.getAttribute("user");
		System.out.println("用户名"+userName);
		//ModelAndView mv = new ModelAndView();
		//判断是否登陆
		if(userName == null || "".equals(userName) || comment == null || "".equals(comment)){
			
		}else{
			//添加评论
			Comment com = new Comment();
			com.setComment(comment);
			User user = new User();
			user.setUserName(userName);
			com.setUser(user);
			Song song = new Song();
			song.setSongId(id);
			com.setSong(song);
			//获取当前系统的时间
			Date date = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String str = sdf.format(date);
		//	Date dd = sdf.parse(str);
			com.setTime(str);
			commentService.addComment(com);
		}
	//	System.out.println(id);		
		//为了跳转到指定的界面做准备
	//	List<Song> list = songService.showSongDetail(id);
		//Song ss = list.get(0);
		List<Comment> comm = commentService.showAllComment(id);
		//mv.addObject("list",ss);
		//mv.addObject("comment",comm);
		//mv.setViewName("/userPage/song-detial.jsp");
		//return mv;
		return comm;
	}
	
	@RequestMapping(value="/commentDel")
	public @ResponseBody List<Comment> commentDel(HttpServletRequest req,HttpServletResponse response,@RequestParam(value="commentId") int cid,@RequestParam(value="songId") int sid){
		System.out.println("cid"+cid);
		System.out.println("sid"+sid);
		
		commentService.delComment(cid);
	
		List<Comment> comm = commentService.showAllComment(sid);
	
		return comm;
	}

}
