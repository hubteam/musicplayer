package com.musicplayer.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import org.springframework.web.servlet.ModelAndView;

import com.musicplayer.entity.Click;
import com.musicplayer.entity.Data;
import com.musicplayer.entity.Download;
import com.musicplayer.entity.Song;
import com.musicplayer.service.ClickService;
import com.musicplayer.service.ClickSumService;
import com.musicplayer.service.DownloadService;
import com.musicplayer.service.SongService;
import com.musicplayer.util.Page;
import com.musicplayer.util.UpUtil;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

@Controller
@RequestMapping(value="/click")
public class ClickController {
	
	@Autowired
	private ClickService clickService;
	
	@Autowired
	private DownloadService downloadService;
	
	@Autowired
	private ClickSumService clickSumService;
	
	@Autowired
	private SongService songService;
	
	@RequestMapping(value="/clickList")
	public ModelAndView showClick(HttpServletRequest req,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();

		String pagenow = req.getParameter("pageNow");

		int totalCount = clickService.allClickCount();
		System.out.println(totalCount);
		System.out.println(totalCount);
		Page page = null;
		if(pagenow != null){
			int pageNow = Integer.parseInt(pagenow);
			page = new Page(totalCount,pageNow);
		    
		}else{
			
			page = new Page(totalCount,1);
		}

		List<Data> list = clickService.showClick(page);
		req.setAttribute("clickList", list);
		mv.addObject("list",list);
		mv.addObject("page",page);
		mv.setViewName("/adminPage/click.jsp");
		return mv;
	}

	@RequestMapping(value="/clickSearch")
	public ModelAndView clicSearch(@RequestParam(value="mysearch") String name) throws UnsupportedEncodingException{
		ModelAndView mv = new ModelAndView();
		name = new String(name.getBytes("ISO-8859-1"),"UTF-8");
		System.out.println(name);
		List<Data> list = clickService.showByName(name);
		mv.addObject("list",list);
		mv.setViewName("/adminPage/click.jsp");
		return mv;
	}
	
	@RequestMapping(value="/downFile",produces="text/html;charset=utf-8")
	public void downLoadFile(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
	
		//ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		if(userName == null){
			
		}else{
			//完成下载的功能
			String songAddr = request.getParameter("songAddr");
			String songId = request.getParameter("songId");
			int sid = Integer.parseInt(songId);
			int last = songAddr.lastIndexOf('.');
			//String name = songAddr.substring(last+1);
			String name = songAddr.substring(last);
			List<Song> sname = songService.showSingleSong(sid);
			
			String songName = sname.get(0).getSongName()+name;
			System.out.println("此时歌曲的名称是"+songName);
			response.setContentType(request.getServletContext().getMimeType(songName));
			//response.setHeader("Content-Disposition","attachment;fileName="+songName);
			response.setHeader("Content-Disposition","attachment;fileName="+URLEncoder.encode(songName, "UTF-8"));
			//完整的路径
			
			OutputStream out = response.getOutputStream();
			UpUtil.download(songAddr, out);

		//	System.out.println("截取后的名字"+name);
		//	System.out.println("下载的文件的地址"+songAddr);
			//向data表中插入或者更新数据
			int isClick = clickService.isClick(sid);
			System.out.println("歌曲的idwei"+sid);
			if(isClick == 1){
				//已经存在下载的记录，更新表
				clickService.updDownload(sid);
			}else{
				//不存在记录就插入一条
				Data data = new Data();
				data.setSongId(sid);
				data.setDownload(1);
				data.setClick(0);
				clickService.insertData(data);
			}
			//获取当前时间
			Date date = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
			String str = sdf.format(date);
			Date dd = sdf.parse(str);
			
			Download download = new Download();
			//判断是否要插入download表中
			download.setSongId(sid);
			download.setUserName(userName);
			int isDown = downloadService.isDownLoad(download);
			if(isDown == 1){
				download.setSongId(sid);
				download.setDownTime(dd);
				download.setUserName(userName);
				downloadService.updDownTime(download);
			}else{
				download.setUserName(userName);
				download.setSongId(sid);
				download.setDownTime(dd);
				downloadService.addDownLoad(download);
			}
			//return null;
		}
	
	}
	
	@RequestMapping(value="/download")
	public ModelAndView download(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		List<Song> list = downloadService.showAllDown(userName);
		mv.addObject("list",list);
		mv.setViewName("/userPage/download.jsp");
		return mv;
	}
	
	@RequestMapping(value="/click")
	public ModelAndView click(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		List<Song> list = clickSumService.selectClick(userName);
		mv.addObject("list",list);
		mv.setViewName("/userPage/listen.jsp");
		return mv;
	}
	
	//删除之后重新加载页面
	@RequestMapping(value="deleteDown")
	public ModelAndView deleteDown(HttpServletRequest request,HttpServletResponse response){
		String songId = request.getParameter("songId");
		int sid = Integer.parseInt(songId);
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		Download down = new Download();
		down.setUserName(userName);
		down.setSongId(sid);
		downloadService.deleteDown(down);
		ModelAndView mv = new ModelAndView();
		
		List<Song> list = downloadService.showAllDown(userName);
		mv.addObject("list",list);
		mv.setViewName("/userPage/download.jsp");
		return mv;
	}
	
	//删除试听列表后重新加载
	@RequestMapping(value="deleteClick")
	public ModelAndView deleteClick(HttpServletRequest request,HttpServletResponse response){
		String songId = request.getParameter("songId");
		int sid = Integer.parseInt(songId);
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		Click click = new Click();
		click.setUserName(userName);
		System.out.println("userName"+userName);
		System.out.println("sid"+sid);
		click.setSongId(sid);
		clickSumService.delClickCount(click);
	
		ModelAndView mv = new ModelAndView();
		
		List<Song> list = clickSumService.selectClick(userName);
		mv.addObject("list",list);
		mv.setViewName("/userPage/listen.jsp");
		return mv;
	}
	
	@RequestMapping(value="/export")
	public void export(HttpServletRequest req,HttpServletResponse response) throws IOException, RowsExceededException, WriteException{
		System.out.println("tetetetette");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "inline;filename="+"excel.xls");
		OutputStream os = response.getOutputStream();
		// 新建excel的工作薄文件  
		WritableWorkbook book = Workbook.createWorkbook(os);
		// 生成名为"第一页"的工作表，参数0表示这是第一页  
		WritableSheet sheet1 = book.createSheet("第一页", 0);
				/***********start第一行（各个列的标题）************/
		Label label1 = new Label(0,0,"排行");		
		sheet1.addCell(label1);
		Label label2 = new Label(1,0,"下载量");		
		sheet1.addCell(label2);
		Label label3 = new Label(2,0,"点击量");		
		sheet1.addCell(label3);
		List<Data> list = clickService.findClicks();
		//WritableWorkbook
		for(int i=0;i<list.size();i++){
			for(int j=0;i<3;j++){
				if(j==0){
					Label label = new Label(j,i,list.get(i).getSong().getSongName());
				}
				if(j==1){
					Label label = new Label(j,i,list.get(i).getClick()+"");
				}
				if(j==2){
					Label label = new Label(j,i,list.get(i).getDownload()+"");
				}
			}
		}
		book.write();
		book.close();
		os.close();

	}
	
	@RequestMapping(value="/clickCount")
	public void clickCount(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="songId") String songId) throws ParseException{
		//ModelAndView mv = new ModelAndView();
		
				HttpSession session = request.getSession();
				String userName = (String) session.getAttribute("user");
				//String songId = request.getParameter("songId");
				System.out.println(userName);
				System.out.println("songId");
				int sid = Integer.parseInt(songId);
					
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
				
	}

}
