package com.musicplayer.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

public class UpLoadUtil {

	public static String upFile(MultipartFile cm){
		
		String filePath = null;
		String fileName = cm.getOriginalFilename();
		String uuid = UUIDUtil.getUUID();
		String uuidFileName = uuid + fileName;
		String suffix = fileName.substring(fileName.lastIndexOf("."));
		if(".mp3".equals(suffix))	{	
			filePath =  "F:/upload/music";
		}
		else if(".txt".equals(suffix)){		
			filePath =  "F:/upload/lyric";
		}
		else if(".jpg".equals(suffix)){
			filePath =  "F:/upload/image";
		}
		
		InputStream is = null;
	
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		BufferedInputStream bis = null;
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		File f = new File(filePath+"/"+uuidFileName);
		try {
			bis = new BufferedInputStream(is);
			fos = new FileOutputStream(f);
			bos = new BufferedOutputStream(fos);
			byte[] bt = new byte[4096];
			int len;
			while((len = bis.read(bt))!=-1){
				bos.write(bt, 0, len);			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(null != bos){
					bos.close();
					bos = null;}
				if(null != fos){
					fos.close();
					fos= null;
				}
				if(null != is){
					is.close();
					is=null;
				}
				if (null != bis) {
					bis.close();
					bis = null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return filePath+"/"+uuidFileName;
	}
	
	public static void downFile(OutputStream out ,String fileName){
		File f = new File(fileName);
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			fis = new FileInputStream(f);
			bis = new BufferedInputStream(fis);
			bos = new BufferedOutputStream(out);
			byte[] bt = new byte[4096];
			int len;
			while((len = bis.read(bt))>0){
				bos.write(bt, 0, len);			
			}
			
		} catch (IOException e) {
		}
			finally {
				try {
					
					if(null != bos){
						bos.close();
						bos = null;
					}
					
					if(null != out){
						out.close();
						out = null;
					}
					if (null != bis) {
						bis.close();
						bis = null;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	

