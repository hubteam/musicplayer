package com.musicplayer.controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.musicplayer.util.UpLoadUtil;
import com.musicplayer.util.UpUtil;

@Controller
@RequestMapping(value="/download")
public class DownLoadController {

	/*
	@RequestMapping(value="/downFile",produces="text/html;charset=utf-8")
	@ResponseBody
	public void downLoadFile(HttpServletRequest request,HttpServletResponse response) throws IOException{
	
		//完整的路径
		String songAddr = request.getParameter("songAddr");
		
		int last = songAddr.lastIndexOf('/');
		String name = songAddr.substring(last+1);
		System.out.println("截取后的名字"+name);
		System.out.println("下载的文件的地址"+songAddr);
		response.setContentType(request.getServletContext().getMimeType(name));
		response.setHeader("Content-Disposition","attachment;fileName="+name);
		//File file = new File(songAddr);
		//FileInputStream fis = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		
		//OutputStream out = response.getOutputStream();
		
		UpLoadUtil.downFile(out, songAddr);
	}*/
	
	@RequestMapping(value="/downFile",produces="text/html;charset=utf-8")
	public void downLoadFile(HttpServletRequest request,HttpServletResponse response) throws IOException{
	
		//完成下载的功能
		String songAddr = request.getParameter("songAddr");
		int last = songAddr.lastIndexOf('/');
		String name = songAddr.substring(last+1);
		response.setContentType(request.getServletContext().getMimeType(name));
		response.setHeader("Content-Disposition","attachment;fileName="+name);
		//完整的路径
		
		OutputStream out = response.getOutputStream();
		UpUtil.download(songAddr, out);

		System.out.println("截取后的名字"+name);
		System.out.println("下载的文件的地址"+songAddr);
		//向data表中插入或者更新数据
		
		
		
	}
	
	
}
