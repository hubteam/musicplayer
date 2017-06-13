package com.musicplayer.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMailUtil {
	public static void sendMail(String to,String fourRandom){
		final String host = "smtp.163.com";  //smtp服务器  
		 final String from = "wang_xinwei_s@163.com";  //发件人地址  
		 final String user = "wang_xinwei_s@163.com";  //用户名  
		
		 final String pwd = "wxw2729klyyZ";   //密码  
		 final String subject = "心随乐动邮箱验证"; //邮件标题 
		 
		
	      
		 String context = "您的验证码是："+fourRandom+"\n"+"请尽快完成验证!";
		 
		    Properties props = new Properties();  
	        //设置发送邮件的邮件服务器的属性（这里使用网易的smtp服务器）  
	        props.put("mail.smtp.host", host);  
	        //需要经过授权，也就是有户名和密码的校验，这样才能通过验证  
	        props.put("mail.smtp.auth", "true");  
	        //用刚刚设置好的props对象构建一个session  
	        Session session = Session.getDefaultInstance(props);  
	        
	        //有了这句便可以在发送邮件的过程中在console处显示过程信息，供调试使  
	        //用（你可以在控制台（console)上看到发送邮件的过程）  
	        session.setDebug(true);  
	        
	        //用session为参数定义消息对象  
	        MimeMessage message = new MimeMessage(session);  
	        try{  
	         //加载发件人地址  
	            message.setFrom(new InternetAddress(from));  
	           //加载收件人地址  
	            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	           //加载标题  
	            message.setSubject(subject);  
	            
	            // 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件  
	            Multipart multipart = new MimeMultipart();           
	            
	            
	            //设置邮件的文本内容  
	            BodyPart contentPart = new MimeBodyPart();  
	            contentPart.setText(context);  
	            multipart.addBodyPart(contentPart);  	            
	            
	            //将multipart对象放到message中  
	            message.setContent(multipart);  
	            //保存邮件  
	            message.saveChanges();  
	            //   发送邮件  
	            Transport transport = session.getTransport("smtp");  
	            //连接服务器的邮箱  
	            transport.connect(host, user, pwd);  
	            //把邮件发送出去  
	            transport.sendMessage(message, message.getAllRecipients());  
	            transport.close();  
	        }catch(Exception e){  
	            e.printStackTrace();  
	        }  
		
	}

}
