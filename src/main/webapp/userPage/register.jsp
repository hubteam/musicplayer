<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>心随乐动 注册账号</title>
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
    <!--[if lt IE 9]>
    <script src="${ctx }/js/ie/html5shiv.js"></script>
    <script src="${ctx }/js/ie/respond.min.js"></script>
    <script src="${ctx }/js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body class="bg-info dker">
	<div class="modal fade login-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content bg-info">
         <div class="container aside-xl">
          <a class="navbar-brand block m-t" href="${ctx }/song/showAllList"><span class="h1 font-bold">心随乐动</span></a>
          <section class="m-b-lg">
            <header class="wrapper text-center">
              <p>登录账号获得更多</p>
            </header>
            <form action="${ctx }/user/login" id="defaultForm" class="form-horizontal">
              <div class="form-group">
                <input type="email" placeholder="账号" class="form-control rounded input-lg text-center no-border" name="email">
              </div>
              <div class="form-group">
                 <input type="password" placeholder="密码" class="form-control rounded input-lg text-center no-border" name="password">
              </div>
              <div class="checkbox i-checks m-b">
                <label class="m-l">
                  <input type="checkbox" checked=""><i></i> 记住密码
                </label>
              </div>
              <button type="submit" class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded"><i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登录</span></button>
              <div class="text-center m-t m-b"><a href="${ctx }/userPage/findPass"><small>忘记密码</small></a></div>
              <div class="line line-dashed"></div>
              <p class="text-muted text-center"><small>尚未注册</small></p>
              <a href="register.html" class="btn btn-lg btn-info btn-block rounded">注册</a>
            </form>
          </section>
        </div>
        </div>
      </div>
    </div>
  <section id="content" class="m-t-lg wrapper-md animated fadeInDown">
    <div class="container aside-xl">
      <a class="navbar-brand block" href="${ctx }/song/showAllList"><span class="h1 font-bold">心随乐动</span></a>
      <section class="m-b-lg">
        <header class="wrapper text-center">
          <strong>注册账号 获得更多内容</strong>
        </header>
        <form action="${ctx }/user/register" id="defaultForm2" class="form-horizontal" method="post">
          <div class="form-group">
            <input id="userName" placeholder="用户名" class="form-control rounded input-lg text-center no-border"  name="userName" onkeyup="checkName()"/>
            <span id="test"></span>
          </div>
          
          <div class="form-group">
            <input type="email" placeholder="邮箱" class="form-control rounded input-lg text-center no-border" name="email"id="email"/>
          </div>
          <div class="form-group">
             <input type="password" placeholder="密码" class="form-control rounded input-lg text-center no-border" name="password"/>
          </div>
          <div class="form-group">
             <input type="password" placeholder="确认密码" class="form-control rounded input-lg text-center no-border" name="confirmPassword"/>
             
          </div>
          <div class="checkbox i-checks m-b">
            <label class="m-l">
              <input type="checkbox" checked=""/><i></i> 我接受 <a href="#">《心随乐动服务协议》</a>
            </label>
          </div>
          <button id="btn1" type="submit" class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded"><i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">注册</span></button>
          <div class="line line-dashed"></div>
          <p class="text-muted text-center"><small>已经注册账号</small></p>
          <a href="" class="btn btn-lg btn-info btn-block btn-rounded" data-toggle="modal" data-target=".login-modal">登录</a>
        </form> 
      </section>
    </div>
  </section>
  <!-- footer -->
  <footer id="footer">
    <div class="text-center padder clearfix">
      <p>
        <small>Web app framework base on Bootstrap<br>&copy; 2014</small>
      </p>
    </div>
  </footer>
  <!-- / footer -->
  <script src="${ctx }/js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="${ctx }/js/bootstrap.js"></script>
  <!-- App -->
  <script src="${ctx }/js/app.js"></script>  
  <script src="${ctx }/js/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="${ctx }/js/bootstrapValidator/bootstrapValidator.min.js"></script>
  <script src="${ctx }/js/app.plugin.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/demo.js"></script>
  <script type="text/javascript" src="${ctx }/js/bootstrapValidator/useValidator.js"></script>

</body>

<script type="text/javascript">
function checkName(){
	var userName = $("#userName").val();
	$.ajax({
		type:'POST',
		url:'${ctx }/user/checkName',
		dataType:'json',
		data:{
			username : userName
		},
		success:function(data){
			//alert("success");
			//alert(data.mes);
			if(data.mes != null){
				$("#test").html("");
				$("#test").append(data.mes);
				$("#btn1").attr("disabled",true);
			}
			
			
				//$("#test").hide();
		
		} 
		
	});	
}


</script>

</html>