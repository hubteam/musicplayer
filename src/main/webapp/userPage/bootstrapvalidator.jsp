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
  <link rel="stylesheet" href="${ctx }/css/bootstrapValidator.min.css" type="text/css" />   
    <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body>
    <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h2>注册</h2>
                    </div>

                    <form id="defaultForm" class="form-horizontal" >
                        <div class="form-group">
                            <label class="col-lg-3 control-label">用户名</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="username" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">邮箱地址</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="email" />
                            </div>
                        </div>

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

                        <div class="form-group">
                            <label class="col-lg-3 control-label">性别</label>
                            <div class="col-lg-5">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" value="male" /> 男
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" value="female" /> 女
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="captchaOperation">验证码</label>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" name="captcha" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="button" class="btn btn-info" id="validateBtn">提交</button>
                                <button type="button" class="btn btn-info" id="resetBtn">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>

<script src="${ctx }/js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="${ctx }/js/bootstrap.js"></script>
  <!-- App -->
  <script src="${ctx }/js/app.js"></script>  
  <script src="j${ctx }/s/slimscroll/jquery.slimscroll.min.js"></script>
<!--  <script src="js/parsley/parsley.js"></script>-->  
	<script src="${ctx }/js/bootstrapValidator/bootstrapValidator.min.js"></script>
	<script src="${ctx }/js/app.plugin.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/demo.js"></script>
  <script type="text/javascript" src="${ctx }/js/bootstrapValidator/useValidator.js"></script>
</body>
</html>