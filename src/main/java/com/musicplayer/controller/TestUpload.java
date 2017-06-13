package com.musicplayer.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.musicplayer.util.CommonsUtil;
import com.musicplayer.util.UUIDUtil;
import com.musicplayer.util.UpLoadUtil;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;


@Controller
@RequestMapping(value="/upload")
public class TestUpload {
	
	@RequestMapping(value="/uploadfile")
	public void uploadFile(HttpServletRequest req,HttpServletResponse response) throws IOException{
 
		MultipartHttpServletRequest mh = (MultipartHttpServletRequest) req;
		MultipartFile pic = mh.getFile("filename");
	
		String name = UpLoadUtil.upFile(pic);
		
		//System.out.println("打印地址");
		//System.out.println(name);

        //9090端口服务器
		//System.out.println(myname);
		//MultipartHttpServletRequest mh = (MultipartHttpServletRequest) req;
		//MultipartFile cm = mh.getFile("filename");
		 
	}
}
