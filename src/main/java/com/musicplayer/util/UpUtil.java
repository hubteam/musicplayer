package com.musicplayer.util;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

public class UpUtil {
	
	public static String upload(MultipartFile cm) throws IOException{
		byte[] fbytes = cm.getBytes();
		//擴展名
		String originalFilename = cm.getOriginalFilename();
		System.out.println(originalFilename);
		String newFilename = UUIDUtil.getUUID()+originalFilename;
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));

		System.out.println(suffix);
		Client client = Client.create();
		//把文件关联到远程服务器
		
		String fullPath = null;
		if(".mp3".equals(suffix))	{	
			WebResource resource = client.resource(CommonsUtil.PIC_HOST+"/music/"+newFilename);
			//上传
	        resource.put(String.class, fbytes);
			fullPath = CommonsUtil.PIC_HOST+"/music/"+newFilename;
		}
		else if(".lrc".equals(suffix)){		
			WebResource resource = client.resource(CommonsUtil.PIC_HOST+"/lyric/"+newFilename);
			//上传
	        resource.put(String.class, fbytes);
			fullPath = CommonsUtil.PIC_HOST+"/lyric/"+newFilename;
		}
		else if(".jpg".equals(suffix)){
			WebResource resource = client.resource(CommonsUtil.PIC_HOST+"/image/"+newFilename);
			//上传
			fullPath = CommonsUtil.PIC_HOST+"/image/"+newFilename;
			System.out.println(fullPath);
	       resource.put(String.class, fbytes);
	       System.out.println("success");
		}
		return fullPath;
	}
	
	public static void download(String songAddr,OutputStream out){
		
		try {
			URL url = new URL(songAddr);
			HttpURLConnection connection;
			connection = (HttpURLConnection) url.openConnection();
			DataInputStream fis = new DataInputStream(connection.getInputStream());
			
			int b;
			while((b=fis.read())!=-1){
				out.write(b);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
