<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>


<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
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
  
<link rel="stylesheet" href="${ctx }/bootstrapvalidator/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="${ctx }/jquery-2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="${ctx }/bootstrapvalidator/js/bootstrapValidator.js"></script>

    <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body class="bg-info dker">
  <section id="content" class="m-t-lg wrapper-md animated fadeInUp" >    
    <div class="container aside-xl">
      <span class="h1 font-bold, navbar-brand block" ><font size="+4" style="font-weight:normal">心随乐动</font></span>
      <section class="m-b-lg">
        <header class="wrapper text-center">
          <strong>管理员登录</strong>
        </header>
        <form id="defaultForm" method="post" class="form-horizontal" action="${ctx }/admin/login">
          <div class="form-group">
                <input type="text" placeholder="请输入账号" class="form-control rounded input-lg text-center no-border" name="adminName" />
        </div>
          <div class="form-group">
             <input type="password" name="adminPass" placeholder="请输入密码" class="form-control rounded input-lg text-center no-border">
          </div>
          <div id="test" align ="center">${msg }</div>
          <input id="testMsg" type="hidden" value="${msg }">
          <div class="form-group">
          <button type="submit" class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded"><i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登 录</span></button>
          </div>
        </form>
      </section>
    </div>
  </section>
  
  <!-- Bootstrap -->
  <script src="${ctx }/js/bootstrap.js"></script>
  <!-- App -->
  <script src="${ctx }/js/app.js"></script>  
  <script src="${ctx }/js/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx }/js/app.plugin.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/demo.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#defaultForm').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
fields: {
            
            adminName: {
                validators: {
                    //emailAddress: {
                       // message: '请输入有效的电子邮箱地址'
                    //},
					notEmpty: {
                        message: '账号不能为空'
                    }
                }
				
            },
            adminPass: {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'email',
                        message: '密码和用户名不能相同'
                    },
					stringLength: {
                        min: 6,
                        max: 30,
                        message: '请输入6-30个字符'
                    }
                }
            }
        }
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#defaultForm').data('bootstrapValidator').resetForm(true);
    });
});
</script>

</body>
</html>