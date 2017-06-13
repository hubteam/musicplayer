<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Heart with Music 心随乐动</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="${ctx }/js/jPlayer/jplayer.flat.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/animate.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/simple-line-icons.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/font.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/app.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/bootstrapValidator.min.css" type="text/css">
</head>
<body>

<section class="vbox animated fadeInUp">
  <section class="scrollable padder">
  <!-- form: -->
    <div class="col-lg-8 col-lg-offset-2">
      <div class="page-header">
        <h2>密码找回</h2>
      </div>    
      <form id="defaultForm2" class="form-horizontal" ">
        <div class="form-group">
          <label class="col-lg-3 control-label">用户名</label>
          <div class="col-lg-5">
            <input onkeyup="checkName()" type="text" class="form-control" name="userName" id="userName"/>
            <span id="test"></span>
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">邮箱地址</label>
          <div class="col-lg-5">
            <input onkeyup="check()" type="text" class="form-control form-control-h" name="email" id="email"/>
            
            <span id="test1"></span>
            <button id="btn1" onclick="sendMail()" type="button" class="btn btn-success" id="validateBtn">发送邮件</button>
        </div> 
        </div>   
        <div class="form-group">
          <label class="col-lg-3 control-label">邮件验证码</label>
          <div class="col-lg-5">
            <input onblur="checkCode()" type="text" class="form-control form-control-h" name="code" id="code"/>

            <!--验证码确认按钮-->
            <button onclick="testId()" id="sure" type="button" class="btn btn-primary" data-toggle="modal" data-target=".profile-modal">确定</button>

            <input type="hidden" id="codeValue">
            <span id="test2"></span>
          </div>
        </div>

       </form>
    </div>

       <!--模态框--> 
       <div class="modal fade profile-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <form id="defaultForm2" class="form-horizontal" method="post" action="${ctx }/user/findPass">
              <input id="tttt" type="hidden" name="userName">
               <div class="modal-content">
                  <!--模态框的头部-->
                  <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"> &times;</span><span class="sr-only">Close</span></button><!--&times是 （关闭）X 号-->
                      <h4 class="modal-title">找回密码</h4>
                  </div>
                  
                  <!--模态框的内容-->
                  
                  <div class="form-group">
                     <label class="col-lg-3 control-label">密码</label>
                     <div class="col-lg-5">
                         <input type="password" class="form-control" name="password" />
                     </div>
                  </div>
                  <div class="form-group">
                      <label class="col-lg-3 control-label">密码确认</label>
                       <div class="col-lg-5">
                           <input type="password" class="form-control" name="confirmPassword" />
                        </div>
                  </div>
                  <!--模态框的底部-->
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default btn-s-xs" data-dismiss="modal">取消</button>
                     <button type="submit" class="btn btn-success btn-s-xs">提交</button>
                     <button type="reset" class="btn btn-default btn-s-xs">重置</button>
                  </div>
                </div>
              </form>
            </div>
        </div>
        
  <!-- :form -->
  </section>
</section>


</body>
 <script src="${ctx }/js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="${ctx }/js/bootstrap.js"></script>
  <!-- App -->
  <script src="${ctx }/js/app.js"></script>  
  <script src="${ctx }/js/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="${ctx }/js/app.plugin.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/demo.js"></script>
  <script src="${ctx }/js/bootstrapValidator/bootstrapValidator.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/bootstrapValidator/useValidator.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//$("#resetPass").hide();
	$("#sure").attr("disabled",true);
});

function check(){
	var name = $("#userName").val();
	var mail = $("#email").val();
	//alert(name);
	$.ajax({
		type:'POST',
		url:'${ctx }/user/showOneUser',
		dataType:'json',
		data:{
			username : name,
			
		},
		success:function(data){
          if(data.mail != mail){
        	  //alert(mail);
        	 // alert(data.mail);
        	  $("#test1").html("");
  			$("#test1").append("邮箱不是注册时候用的邮箱");	
  			
          }else{
        	  $("#test1").html("");
          }
          
						
		} 		
	});	
}

function checkName(){
	var userName = $("#userName").val();
	$.ajax({
		type:'POST',
		url:'${ctx }/user/checkName1',
		dataType:'json',
		data:{
			username : userName
		},
		success:function(data){
			//alert("success");
			//alert(data.mes);
			$("#test").html("");
			$("#test").append(data.mes);
			$("#btn1").attr("disabled",true);
		} 
		
	});	
}

function checkCode(){
	//alert("enter");
	var code = $("#codeValue").val();
	var mail = $("#code").val();
	//alert(code);
	//alert(mail);
	if(code == mail || code.equal(mail) && code!=null && mail!=null){
		
		$("#test2").html("");
		$("#sure").attr("disabled",false);
	}
	else{
		$("#test2").html("验证码错误");
		$("#sure").attr("disabled",true);
	}
	
}

function sendMail(){
	//alert("hh");
	var email = $("#email").val();
	$.ajax({
		type:'POST',
		url:'${ctx }/user/sendMail',
		dataType:'json',
		data:{
			address : email
		},
		success:function(data){
			//alert("success");
			//alert(data.mes);
			$("#codeValue").val(data.mes);
		} 
		
	});	
}

function testId(){
	var userName = $("#userName").val();
	//alert(userName);
	$("#tttt").val(userName);
}

</script>
</html>