package com.musicplayer.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.musicplayer.entity.Click;
import com.musicplayer.entity.Comment;
import com.musicplayer.entity.Data;
import com.musicplayer.entity.Singer;
import com.musicplayer.entity.Song;
import com.musicplayer.entity.SongExt;
import com.musicplayer.entity.SongType;
import com.musicplayer.entity.Wrapper;
import com.musicplayer.service.ClickService;
import com.musicplayer.service.ClickSumService;
import com.musicplayer.service.CommentService;
import com.musicplayer.service.SingerService;
import com.musicplayer.service.SongService;
import com.musicplayer.service.TypeService;
import com.musicplayer.util.Page;
import com.musicplayer.util.UpUtil;

@Controller
@RequestMapping(value="/song")
public class SongController {

	@Autowired
	private SongService songService;
	
	@Autowired
	private SingerService singerService;
	
	@Autowired
	private TypeService typeService;
	
	@Autowired
	private ClickService clickService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ClickSumService clickSumService;
	
	@RequestMapping(value="/songList")
	public ModelAndView showSong(){
		ModelAndView mv = new ModelAndView();
		List<Song> list = songService.showSong();
		
		mv.addObject("list",list);
		mv.setViewName("/adminPage/songList.jsp");
		//return "forward:/adminPage/songList.jsp";
		return mv;
	}
	
	@RequestMapping(value="/songListByPage")
	public ModelAndView singerListByPage(HttpServletRequest req,HttpServletResponse response){
		String pagenow = req.getParameter("pageNow");

		int totalCount = songService.getTotalCount();
		System.out.println(totalCount);
		System.out.println(totalCount);
		Page page = null;
		if(pagenow != null){
			int pageNow = Integer.parseInt(pagenow);
			page = new Page(totalCount,pageNow);
		    
		}else{
			
			page = new Page(totalCount,1);
		}
		ModelAndView mv = new ModelAndView();
		List<Song> list = songService.showSongByPage(page);
		mv.addObject("list",list);
		mv.addObject("page",page);
		mv.setViewName("/adminPage/songList.jsp");
		return mv;
	}
	
	@RequestMapping(value="/showAllList")
	public ModelAndView showAllList(){

		ModelAndView mv = new ModelAndView();
		int totalCount = songService.getTotalCount();

		Page page = null;
		page = new Page(totalCount,1);
		
		List<Song> list = songService.showSongByPage(page);
		mv.addObject("newList",list);
		List<SongExt> listHot = songService.clickMany();
		System.out.println(listHot.size());
		mv.addObject("hot",listHot);
		//List<Data> listDown = clickService.downLoadMany();
		List<SongExt> listDown = songService.downLoadMany();
		
		mv.addObject("download",listDown);

		mv.setViewName("/userPage/index.jsp");
		return mv;
	}
	
	@RequestMapping(value="/showAll")
	public ModelAndView showAll(){

		ModelAndView mv = new ModelAndView();
		int totalCount = songService.getTotalCount();

		Page page = null;
		page = new Page(totalCount,1);
		
		List<Song> list = songService.showSongByPage(page);
		mv.addObject("newList",list);
		List<SongExt> listHot = songService.clickMany();
		System.out.println(listHot.size());
		mv.addObject("hot",listHot);
		//List<Data> listDown = clickService.downLoadMany();
		List<SongExt> listDown = songService.downLoadMany();
		
		mv.addObject("download",listDown);

		mv.setViewName("/userPage/index_cut.jsp");
		return mv;
	}
	
	@RequestMapping(value="/showSongList")
	public ModelAndView showSongList(HttpServletRequest req,HttpServletResponse response) throws UnsupportedEncodingException{
		//req.setCharacterEncoding("UTF-8");
		String pagenow = req.getParameter("pageNow");
        String songType = req.getParameter("songType");
        Wrapper wrapper = new Wrapper();
        if(songType != null && !("".equals(songType)))
        {
        	songType = new String(songType.getBytes("ISO-8859-1"),"UTF-8");
      	  songType = songType.trim();
      	  System.out.println("这个值是啥子"+songType);
      	  wrapper.setSongTypeName(songType);
        }else{
        	wrapper.setSongTypeName(null);
        }
          
    	ModelAndView mv = new ModelAndView();
    	//显示类别
    	List<SongType> type = typeService.showType();
		mv.addObject("type",type);
		
		System.out.println("songType"+songType);
		
		//分页
		int totalCount = songService.showCountByType(wrapper);
		System.out.println("totalCount"+totalCount);
		Page page = null;
		if(pagenow != null){
			int pageNow = Integer.parseInt(pagenow);
			System.out.println("当前页为"+pageNow);
			page = new Page(totalCount,pageNow);
		    
		}else{
			
			page = new Page(totalCount,1);
		}
		List<SongExt> wrapperList = null;
		
		wrapper.setPage(page);

		wrapperList = songService.showSongByType(wrapper);
		mv.addObject("list",wrapperList);
		mv.addObject("songType",songType);
		mv.addObject("page",page);
		/*String pagenow = req.getParameter("pageNow");
        String songType = req.getParameter("songType");

        Page page = null;
        List<Song> list = null;
        
        ModelAndView mv = new ModelAndView();
        List<SongType> type = typeService.showType();
		mv.addObject("type",type);
        if(songType == null || "".equals(songType)){
        	int totalCount = songService.getTotalCount();
    		System.out.println(totalCount);
    	
    		if(pagenow != null){
    			int pageNow = Integer.parseInt(pagenow);
    			page = new Page(totalCount,pageNow);
    		    
    		}else{
    			
    			page = new Page(totalCount,1);
    		}
    		
    		list = songService.showSongByPage(page);
    	
    		mv.addObject("list",list);
    		mv.addObject("page",page);
    		
    		
        }else{
        	songType = new String(songType.getBytes("ISO-8859-1"),"UTF-8");
        	songType = songType.trim();
        	System.out.println("songType"+songType);
        	int totalCount = songService.showCountByType(songType);
        	System.out.println(totalCount);
    		
    		if(pagenow != null){
    			int pageNow = Integer.parseInt(pagenow);
    			page = new Page(totalCount,pageNow);
    		    
    		}else{
    			
    			page = new Page(totalCount,1);
    		}
    		
    		Wrapper wrapper = new Wrapper();
    		wrapper.setPage(page);
    		wrapper.setSongTypeName(songType);
    		List<SongExt> wrapperList = null;
    		wrapperList = songService.showSongByType(wrapper);
    		mv.addObject("list",wrapperList);
    		mv.addObject("songType",songType);
    		mv.addObject("page",page);
    		System.out.println(12);
	
        }*/
        mv.setViewName("/userPage/genres.jsp");
        System.out.println("34");
		return mv;
	}
	
	@RequestMapping(value="/showAllType")
	public @ResponseBody List<SongType> showAllType(){
		List<SongType> type = typeService.showType();
		return type;
	}
	
	@RequestMapping(value="/upLyric")
	public String upLyric(HttpServletRequest req,HttpServletResponse response) throws IOException{
		String id = req.getParameter("songId");
		int sid = Integer.parseInt(id);
		MultipartHttpServletRequest mh = (MultipartHttpServletRequest) req;
		MultipartFile pic = mh.getFile("filename");
		//String name1 = UpLoadUtil.upFile(pic);
		String name = UpUtil.upload(pic);
		
		Song song = new Song();
		song.setLyricAddr(name);
		song.setSongId(sid);
		songService.upLoadLyric(song);
		return "redirect:/song/songListByPage";
	}
	
	@RequestMapping(value="/songDel")
	public String songDel(@RequestParam(value="id") int sid){
		songService.delSong(sid);
		return "redirect:/song/songListByPage";
	}
	
	@RequestMapping(value="showSingers")
	public ModelAndView songAdd(){
		ModelAndView mv = new ModelAndView();
		List<Singer> singer = singerService.showSinger();
		
		mv.addObject("map",singer);
		mv.setViewName("/adminPage/songManage-list-add.jsp");
		return mv;
	}
	
	
	
	@RequestMapping(value="/showType")
	public @ResponseBody List<SongType> showType(){
		//System.out.println(fileName);
		//List<Song> list = songService.showAlbumName(fileName);
		List<SongType> list = typeService.showType();
		
		System.out.println(list.size());
		
		//Song song = new Song();
		
		return list;
	}
	
	@RequestMapping(value="/showSingleSong")
	public @ResponseBody Song showSingleSong(String fileName){
		int id = Integer.parseInt(fileName);
		List<Song> list = songService.showSingleSong(id);
		Song song = list.get(0);
		return song;
	}
	
	
	@RequestMapping(value="/showSingerName")
	public @ResponseBody List<Singer> showSingerName(){
		//System.out.println(fileName);
		//List<Song> list = songService.showAlbumName(fileName);
		List<Singer> singer = singerService.showSinger();
		
		return singer;
	}
	
	@RequestMapping(value="/songSearch")
	public ModelAndView songSearch(@RequestParam(value="mysearch") String name){
		ModelAndView mv = new ModelAndView();
        List<Song> list = songService.showMes(name);
		
		mv.addObject("list",list);
		mv.setViewName("/adminPage/songList.jsp");
		return mv;
	}
	//歌曲详情
	@RequestMapping(value="/songDetail")
	public ModelAndView songDetail(HttpServletRequest request,@RequestParam(value="songId") int sid) throws ParseException{
		//操作data与click两张表
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		//String songId = request.getParameter("songId");
		System.out.println(userName);
		System.out.println("songId");
		//int sid = Integer.parseInt(songId);
			
			//向data表中插入或者更新数据
		int isClick = clickService.isClick(sid);
		System.out.println("歌曲的idwei"+sid);
		if(isClick == 1){
				//已经存在下载的记录，更新表
			System.out.println("插入一条数据");
			clickService.updClick(sid);
		}else{
				//不存在记录就插入一条
			Data data = new Data();
			data.setSongId(sid);
			data.setDownload(0);
			data.setClick(1);
			clickService.insertData(data);
		}
			//获取当前时间
			Date date = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
			String str = sdf.format(date);
			Date dd = sdf.parse(str);
		//用户已经登陆	
		if(userName != null){	
			Click click = new Click();
			click.setSongId(sid);
			click.setUserName(userName);
			//判断是否要插入download表中
			System.out.println("有人登陆了");
			int isDown = clickSumService.isListen(click);
			if(isDown == 1){
				System.out.println("数据表中有数据了");
			    click.setSongId(sid);
				click.setClickTime(dd);
                click.setUserName(userName);
				clickSumService.updCTime(click);

			}else{
				System.out.println("数据表中没有数据，需要插入");
				click.setSongId(sid);
				click.setClickTime(dd);
                click.setUserName(userName);
                clickSumService.insertClick(click);
				//downloadService.addDownLoad(download);
			}
		}
		
		//显示歌曲详情
		ModelAndView mv = new ModelAndView();
		List<Song> list = songService.showSongDetail(sid);
		Song song = list.get(0);
		System.out.println("地址是"+song.getSinger().getSingerPictureAddr());
		List<Comment> comment = commentService.showAllComment(sid);
		mv.addObject("list",song);
		mv.addObject("comment",comment);
		mv.setViewName("/userPage/song-detial.jsp");
		return mv;
	}
	
	@RequestMapping(value="/findSongOrSinger")
	public @ResponseBody List<Song> findSongOrSinger(@RequestParam(value="mysearch")String mysearch){
		System.out.println("ENTER");

		System.out.println("mysearch"+mysearch);

        List<Song> list = songService.showMes(mysearch);

		return list;
	}
	
	@RequestMapping(value="/songAdd")
	public String addSong(HttpServletRequest req,HttpServletResponse response) throws ParseException, IOException{
		String songName = req.getParameter("songName");
		String songType = req.getParameter("songType");
		int type = Integer.parseInt(songType);
		String singerName = req.getParameter("singerName");
		int sname = Integer.parseInt(singerName);
		String songTime = req.getParameter("songTime");
		
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		//Date date=sdf.parse(songTime);
		
		Date date = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String str = sdf.format(date);
		Date dd = sdf.parse(str);
		System.out.println(dd);
	
		MultipartHttpServletRequest mh = (MultipartHttpServletRequest) req;
		MultipartFile pic = mh.getFile("filename");
		//String name1 = UpLoadUtil.upFile(pic);
		String name = UpUtil.upload(pic);
		
		Song song = new Song();
		song.setSongTime(dd);
		song.setSongName(songName);
		song.setSongAddr(name);
		song.setSingerId(sname);
		song.setSongTypeId(type);
		songService.addSong(song);
		//song.set
		return "redirect:/song/songListByPage";
	}
	
	@RequestMapping(value="/songChange")
	public String songChange(HttpServletRequest req,HttpServletResponse response) throws ParseException, IOException{
		String songName = req.getParameter("songName");
		String songType = req.getParameter("songType");
		int type = Integer.parseInt(songType);
		String singerName = req.getParameter("singerName");
		int sname = Integer.parseInt(singerName);
		String songid = req.getParameter("singerid");
		int songId = Integer.parseInt(songid);
		Date date = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String str = sdf.format(date);
		Date dd = sdf.parse(str);
		System.out.println(dd);
	
		MultipartHttpServletRequest mh = (MultipartHttpServletRequest) req;
		MultipartFile pic = mh.getFile("filename");
		//String name1 = UpLoadUtil.upFile(pic);
		String name = UpUtil.upload(pic);
		
		Song song = new Song();
		song.setSongTime(dd);
		song.setSongName(songName);
		song.setSongAddr(name);
		song.setSingerId(sname);
		song.setSongTypeId(type);
		song.setSongId(songId);
		//songService.addSong(song);
		songService.songChange(song);
		//song.set
		return "redirect:/song/songListByPage";
	}
	//点击首页上的歌手的名字，显示该歌手的所有的歌曲
	@RequestMapping(value="/singerDetail")
	public ModelAndView singerDetail(HttpServletRequest req,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		String name = req.getParameter("singerName");
		System.out.println("这个是singerName"+name);
		List<Song> list = songService.showMes(name);
		mv.addObject("list",list);
		mv.setViewName("/userPage/result.jsp");
		return mv;
	}
	
}
