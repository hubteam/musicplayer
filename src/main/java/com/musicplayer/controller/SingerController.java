package com.musicplayer.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.musicplayer.entity.Singer;
import com.musicplayer.entity.Song;
import com.musicplayer.service.SingerService;
import com.musicplayer.service.SongService;
import com.musicplayer.util.Page;
import com.musicplayer.util.UpLoadUtil;
import com.musicplayer.util.UpUtil;

@Controller
@RequestMapping(value="/singer")
public class SingerController {

	@Autowired
	private SingerService singerService;
	@Autowired
	private SongService songService;
	
	@RequestMapping(value="/singerList")
	public ModelAndView singerList(HttpServletRequest req,HttpServletResponse response){
		
		ModelAndView mv = new ModelAndView();
		List<Singer> list = singerService.showSinger();
		mv.addObject("singerList",list);
		mv.setViewName("/adminPage/singerList.jsp");
		return mv;
	}
	
	@RequestMapping(value="/singerListByPage")
	public ModelAndView singerListByPage(HttpServletRequest req,HttpServletResponse response){
		String pagenow = req.getParameter("pageNow");

		int totalCount = singerService.totalCount();
		System.out.println(totalCount);
		Page page = null;
		if(pagenow != null){
			int pageNow = Integer.parseInt(pagenow);
			page = new Page(totalCount,pageNow);
		    
		}else{
			
			page = new Page(totalCount,1);
		}
		
		ModelAndView mv = new ModelAndView();
		List<Singer> list = singerService.showSinger(page);
		mv.addObject("singerList",list);
		mv.addObject("page",page);
		mv.setViewName("/adminPage/singerList.jsp");
		return mv;
	}
	
	@RequestMapping(value="/singerDel")
	public String delSinger(@RequestParam(value = "id") Integer id){
		singerService.delSinger(id);
		singerService.delSong(id);
		//singerService.findComId(id);
		//singerService.delComment(id);
		return "redirect:/singer/singerListByPage";
	}
	
	@RequestMapping(value="/singerUpd")
	public String updSinger(HttpServletRequest req,HttpServletResponse response) throws IOException{
		MultipartHttpServletRequest mh = (MultipartHttpServletRequest) req;
		MultipartFile pic = mh.getFile("filename");
		//String name = UpLoadUtil.upFile(pic);
		
		String name = UpUtil.upload(pic);
		String singerName = req.getParameter("singerName");
		String id = req.getParameter("siid");
		System.out.println("id"+id);
		int sid = Integer.parseInt(id);
		//String albumName = req.getParameter("albumName");
		String singerIntro = req.getParameter("singerIntro");
		System.out.println(singerName);
	    //singerService.updSinger(id);
	    Singer ss = new Singer();
	    ss.setSingerId(sid);
	    ss.setSingerName(singerName);
	    ss.setSingerPictureAddr(name);
	    //ss.setAlbumName(albumName);
	    ss.setSingerIntro(singerIntro);
	    singerService.updSinger(ss);
		
		return "redirect:/singer/singerListByPage";
	}
	
	@RequestMapping(value="/singerShowOne")
	public @ResponseBody Singer showSingerOne(String fileName){
		
		int id = Integer.parseInt(fileName);
		System.out.println(id);
		ModelAndView mv = new ModelAndView();
		List<Singer> singerList = singerService.showSingerById(id);
		Singer singer = singerList.get(0);
		//mv.setViewName("/adminPage/singerManage.jsp");
		return singer;
	}
	
	@RequestMapping(value="/singerAdd")
	public String singerAdd(HttpServletRequest req,HttpServletResponse response) throws IOException{
		MultipartHttpServletRequest mh = (MultipartHttpServletRequest) req;
		MultipartFile pic = mh.getFile("filename");
		//String name = UpLoadUtil.upFile(pic);
		String name = UpUtil.upload(pic);
		String singerName = req.getParameter("singerName");
		//String albumName = req.getParameter("albumName");
		String singerIntro = req.getParameter("singerIntro");
		Singer singer = new Singer();
		singer.setSingerIntro(singerIntro);
		//singer.setAlbumName(albumName);
		singer.setSingerName(singerName);
		singer.setSingerPictureAddr(name);
		singerService.addSinger(singer);
		return "redirect:/singer/singerListByPage";
	}
	@RequestMapping(value="singerSearch")
	public ModelAndView singerSearch(@RequestParam(value="mysearch") String name){
		ModelAndView mv = new ModelAndView();
		System.out.println(name);
		List<Singer> list = singerService.showSingerByName(name);
		mv.addObject("singerList",list);
		mv.setViewName("/adminPage/singerList.jsp");
		return mv;
	}
	
	@RequestMapping(value="/singerDetail")
	public ModelAndView singerDetail(@RequestParam(value="singerName") String name) throws UnsupportedEncodingException{
		ModelAndView mv = new ModelAndView();
		
		name = new String(name.getBytes("ISO-8859-1"),"UTF-8");
	    System.out.println("这里的名字是name"+name);
        List<Song> list = songService.showMes(name);
		System.out.println("大小为"+list.size());
		mv.addObject("list",list);
		mv.setViewName("/userPage/reslut.jsp");
		return mv;
	}
}
