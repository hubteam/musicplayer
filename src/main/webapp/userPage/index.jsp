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
  <link rel="stylesheet" href="${ctx }/css/bootstrapValidator.min.css" type="text/css">
    <!--[if lt IE 9]>
    <script src="${ctx }/js/ie/html5shiv.js"></script>
    <script src="${ctx }/js/ie/respond.min.js"></script>
    <script src="${ctx }/js/ie/excanvas.js"></script>
  <![endif]-->
 <script type="text/javascript">
function myclick(title,artist,path,lyc){
   	 var zc=title+","+artist+","+path+","+lyc;
   	 $("a").attr('value',zc);
   	 //alert(title);
   	 //alert(artist);
   	 //alert(path);
   	 //alert(lyc);
   	 //alert(zc);
   	 $.okclick.startm();
    } 

</script> 
</head>
<body class="">
	<textarea name="textfield" id="lrc_content" style="display:none;">
	</textarea>
  <section class="vbox">
    <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
      <div class="navbar-header aside bg-info nav-xs">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
          <i class="icon-list"></i>
        </a>
        <a href="${ctx }/song/showAll" data-bjax data-target="#mainContent" class="navbar-brand text-lt">
          <i class="icon-earphones"></i>
          <img src="images/logo.png" alt="." class="hide">
          <span class="hidden-nav-xs m-l-sm">心随乐动</span>
        </a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
          <i class="icon-settings"></i>
        </a>
      </div>
      <ul class="nav navbar-nav hidden-xs">
        <li>
          <a href="#nav,.navbar-header" data-toggle="class:nav-xs,nav-xs" class="text-muted">
            <i class="fa fa-indent text"></i>
            <i class="fa fa-dedent text-active"></i>
          </a>
        </li>
      </ul>
     <div class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs">
      <div class="form-group">
          <div class="input-group">
            <span class="input-group-btn">
           <button onclick="mybtn()" class="btn btn-sm bg-white btn-icon rounded" ><i class="fa fa-search"></i></button>
            </span>           
            <input id="mysearch" name="mysearch" type="text" class="form-control input-sm no-border rounded" placeholder="搜索歌曲、歌手...">
          </div>
        </div>
        </div>


      <input id="test" type="hidden" value="${user }">
      <!-- 登陆 -->
      <div id="login" class="navbar-right ">
        <ul class="nav navbar-nav m-n hidden-xs nav-user user">
          <li>
            <a href="#" data-toggle="modal" data-target=".login-modal">
              登录
            </a>
          </li>
        </ul>
      </div>   
      
      <!-- 退出 -->
    
      <div id="logout" class="navbar-right ">
        <ul class="nav navbar-nav m-n hidden-xs nav-user user">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle bg clear" data-toggle="dropdown">
              <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
                <img src="${ctx }/images/a0.jpg" alt="...">
              </span>
              ${user } <b class="caret"></b>
            </a>
            <ul class="dropdown-menu animated fadeInUp">            
              <li>
              	<span class="arrow top"></span>
                <a href="javascript:void(0);" onclick="execFun()" data-toggle="modal" data-target=".profile-modal">修改资料</a>
              </li>
              <li class="divider"></li>
              <li>
              	<a href="javascript:void(0);" onclick="execFun1()" data-toggle="modal" data-target=".logout-modal">退出登录</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>      
    
         
    </header>
    <section>
      <section class="hbox stretch">
        <!-- .aside -->
        <aside class="bg-black dk nav-xs aside hidden-print" id="nav">
          <section class="vbox">
            <section class="w-f-md scrollable">
              <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">

                <!-- nav -->                 
                <nav class="nav-primary hidden-xs">
                  <ul class="nav bg clearfix">
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                      在线音乐
                    </li>
                    <li>
                      <a href="${ctx }/song/showAll" data-bjax data-target="#mainContent">
                        <i class="icon-disc icon text-success"></i>
                        <span class="font-normal">发现音乐</span>
                      </a>
                    </li>
                    <li>
                      <a href="${ctx }/song/showSongList" data-bjax data-target="#mainContent">
                        <i class="icon-grid icon text-info"></i>
                        <span class="font-normal">歌曲类别</span>
                      </a>
                    </li>
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                      我的音乐
                    </li> 
                    <li>
                      <a href="${ctx }/click/click" data-bjax data-target="#mainContent">
                        <i class="icon-playlist icon  text-success-lter"></i>
                        <span class="font-normal">试听列表</span>
                      </a>
                    </li>
                    <li>
                      <a href="${ctx }/click/download" data-bjax data-target="#mainContent">
                        <i class="icon-cloud-download icon  text-info-lter"></i>
                        <span class="font-normal">下载歌曲</span>
                      </a>
                    </li>
                  </ul>
                  <ul class="nav text-sm">
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                    个性音乐
                    </li>
                    <li>
                      <a href="${ctx }/like/allLike" data-bjax data-target="#mainContent">
                        <i class="icon-heart icon text-danger"></i>
                        <span>我最喜欢</span>
                      </a>
                    </li>
                  </ul>
                </nav>
                <div class="modal fade dellist-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                	<div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                          &times;
                        </button>
                        <h3 class="modal-title" id="myModalLabel">
                          心随乐动
                        </h3>
                      </div>
                      <div class="modal-body">
                        <h4><i class="icon-info padder-lg i-3x text-danger-dker"></i>是否确认删除此歌单？</h4>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-s-xs" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-success btn-s-xs">确定</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- / nav -->
              </div>
            </section>
            <!--<footer class="footer hidden-xs no-padder text-center-nav-xs">
              <div class="bg hidden-xs ">
                  <div class="dropdown dropup wrapper-sm clearfix">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="thumb-sm avatar pull-left m-l-xs">                        
                        <img src="images/m0.jpg" class="dker" alt="...">
                      </span>
                      <span class="hidden-nav-xs clear">
                        <span class="block m-l">
                          <strong class="font-normal text-lt">歌曲名</strong> 
                        </span>
                        <span class="text-muted text-xs block m-l">歌手名</span>
                      </span>
                    </a>
                  </div>
                </div>            
            </footer>-->
          </section>
        </aside>
        <!-- /.aside -->
        <section id="content">
          <section class="vbox">
            <section id="mainContent" class="w-f-md">
            	<!--内容展示-->
              <section class="vbox animated fadeInUp">
                <section class="scrollable padder-lg">
                  <a href="#" class="pull-right text-muted m-t-lg" data-toggle="class:fa-spin" ><i class="icon-refresh i-lg  inline" id="refresh"></i></a>
                  <h2 class="font-thin m-b">发现 <span class="musicbar animate inline m-l-sm" style="width:20px;height:20px">
                    <span class="bar1 a1 bg-primary lter"></span>
                    <span class="bar2 a2 bg-info lt"></span>
                    <span class="bar3 a3 bg-success"></span>
                    <span class="bar4 a4 bg-warning dk"></span>
                    <span class="bar5 a5 bg-danger dker"></span>
                  </span>
                  </h2>
                  <div class="row">
                    <div class="col-md-7">
                      <h3 class="font-thin">最新歌曲</h3>
                      <div class="row row-sm">
                       <%int flag=1; %>
                      <c:forEach items="${newList}" var="list">

                        
                        <div class="col-xs-6 col-sm-3">
                          <div class="item">
                            <div class="pos-rlt">
                              <div class="item-overlay opacity r r-2x bg-black">
                                <div class="center text-center m-t-n">
                                  <a href="#" class="ok" onclick="myclick('${list.songName}','${list.singer.singerName}','${list.songAddr}','${list.lyricAddr}')"><i class="fa fa-play-circle i-2x"></i></a>
                                  
                                </div>
                              </div>
                              
                              <a href="#"><img src="${list.singer.singerPictureAddr }" alt="" class="r r-2x img-full"></a>
                            </div>
                            <div class="padder-v">
                              <a href="${ctx }/song/songDetail?songId=${list.songId }" class="text-ellipsis" data-bjax data-target="#mainContent">${list.songName }</a>
                              <a href="${ctx }/singer/singerDetail?singerName=${list.singer.singerName }" class="text-ellipsis text-xs text-muted" data-bjax data-target="#mainContent">${list.singer.singerName }</a>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    
                       
                       
                        
                        
                       
                      </div>
                    </div>
                    <div class="col-md-5">
                      <h3 class="font-thin">最热歌曲</h3>
                      <div class="list-group bg-white list-group-lg no-bg auto">                          
                        
                      <c:forEach items="${hot }" var="hot">
                        <a href="${ctx }/song/songDetail?songId=${hot.songId }" class="list-group-item clearfix" data-bjax data-target="#mainContent">
                          <span class="pull-right h2 text-muted m-l"><%=flag++ %></span>
                          <span class="pull-left thumb-sm avatar m-r">
                          <c:forEach items="${hot.singers }" var="hhh">
                         
                            <img src="${hhh.singerPictureAddr }" alt="...">
                            </c:forEach>
                          </span>
                          <span class="clear">
                            <span>${hot.songName }</span>
                            <c:forEach items="${hot.singers }" var="hh">
                            <small class="text-muted clear text-ellipsis">${hh.singerName }</small>
                            </c:forEach>
                          </span>
                        </a>
                        </c:forEach>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <h3 class="font-thin">下载最多</h3>
                      <div class="row row-sm">
                        
                        
                      <c:forEach items="${download }" var="download1">
                     
                      
                        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                          <div class="item">
                            <div class="pos-rlt">
                              <div class="item-overlay opacity r r-2x bg-black">
                                <div class="center text-center m-t-n">
                                  <a href="#" class="ok" onclick="myclick('${download1.songName}','${aa.singerName}','${download1.songAddr}','${download1.lyricAddr}')"><i class="fa fa-play-circle i-2x"></i></a>
                                </div>
                              </div>
                              <c:forEach items="${download1.singers }" var="nnn">
                              <a href="#"><img src="${nnn.singerPictureAddr }" alt="" class="r r-2x img-full"></a>
                              </c:forEach>
                            </div>
                            <div class="padder-v">
                              <a href="${ctx }/song/songDetail?songId=${download1.songId }" class="text-ellipsis" data-bjax data-target="#mainContent">${download1.songName }</a>
                              <c:forEach items="${download1.singers }" var="nn">
                              <a href="${ctx }/singer/singerDetail?singerName=${nn.singerName }" class="text-ellipsis text-xs text-muted" data-bjax data-target="#mainContent">${nn.singerName }</a>
                           </c:forEach>
                            </div>
                          </div>
                        </div>
                         </c:forEach>
                            
                        
                      </div>
                    </div>
                  </div>
                  <div class="row m-t-lg m-b-lg">
                    <div class="col-sm-6">
                      <div class="bg-primary wrapper-md r">
                        <a href="register.html">
                          <span class="h4 m-b-xs block"><i class=" icon-user-follow i-lg"></i> 注册账号</span>
                          <span class="text-muted">注册账号，获得全新的音乐体验。</span>
                        </a>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="bg-black wrapper-md r">
                        <a href="#">
                          <span class="h4 m-b-xs block"><i class="icon-cloud-download i-lg"></i> 下载客户端</span>
                          <span class="text-muted">下载心随乐动客户端，感受移动的音乐享受。</span>
                        </a>
                      </div>
                    </div>
                  </div>
                  <div class="text-center">
                    <p>
                      <a href="http://www.tencent.com/" rel="nofollow" target="_blank" title="关于XX">关于XX</a> | 
                      <a href="http://www.tencent.com/index_e.shtml" rel="nofollow" target="_blank" title="About XX">About XX</a> | 
                      <a href="http://www.qq.com/contract.shtml" rel="nofollow" target="_blank" title="服务条款">服务条款</a> | 
                      <a href="http://y.qq.com/y/static/tips/service_tips.html" rel="nofollow" target="_blank" title="用户服务协议">用户服务协议</a> | 
                      <a href="http://www.tencentmind.com/" rel="nofollow" target="_blank" title="广告服务">广告服务</a> | 
                      <a href="http://service.qq.com/" rel="nofollow" target="_blank" title="客服中心">客服中心</a>
                    </p>
                    <p>Copyright © 1998 - 2017 Tencent. <a target="_blank" href="#" rel="nofollow" title="All Rights Reserved.">All Rights Reserved.</a></p>
                    <p>XX公司 <a target="_blank" href="#" rel="nofollow" title="版权所有">版权所有</a> <a target="_blank" href="#" rel="nofollow" title="XX网络文化经营许可证">XX网络文化经营许可证</a></p>
                  </div>
                </section>
              </section>
              <!--/内容展示-->
            </section>
            <footer class="footer bg-dark">
              <div id="jp_container_N">
                <div class="jp-type-playlist">
                  <div id="jplayer_N" class="jp-jplayer hide"></div>
                  <div class="jp-gui">
                    <div class="jp-interface">
                      <div class="jp-controls">
                        <div><a class="jp-previous"><i class="icon-control-rewind i-lg"></i></a></div>
                        <div>
                          <a class="jp-play"><i class="icon-control-play i-2x"></i></a>
                          <a class="jp-pause hid"><i class="icon-control-pause i-2x"></i></a>
                        </div>
                        <div><a class="jp-next"><i class="icon-control-forward i-lg"></i></a></div>
                        <div><a class="jp-stop"><i class="fa fa-square-o i-lg m-t-xs"></i></a></div>
                        <div class="jp-progress hidden-xs">
                          <div class="jp-seek-bar dk">
                            <div class="jp-play-bar bg-info">
                            </div>
                            <div class="jp-title text-lt">
                              <ul>
                                <li></li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <div class="hidden-xs hidden-sm jp-current-time text-xs text-muted"></div>
                        <div class="hidden-xs hidden-sm jp-duration text-xs text-muted"></div>
                        <div class="hidden-xs hidden-sm">
                          <a class="jp-mute" title="音量"><i class="icon-volume-2"></i></a>
                          <a class="jp-unmute hid" title="静音"><i class="icon-volume-off"></i></a>
                        </div>
                        <div class="hidden-xs hidden-sm jp-volume">
                          <div class="jp-volume-bar dk">
                            <div class="jp-volume-bar-value lter"></div>
                          </div>
                        </div>
                        <!--<div id="liketest">
                          <a href="javascript:void(0);" onclick="isLike('${user}')" class="active" data-toggle="class">
                            <i class="fa fa-heart-o text" title="我最喜欢"></i>
                            <i class="fa fa-heart text-active text-danger" title="取消喜欢"></i>
                          </a>
                        </div>-->
                        <div>
                              <a class="jp-shuffle" title="随机播放"><i class="icon-shuffle text-muted"></i></a>
                              <a class="jp-shuffle-off hid" title="关闭随机"><i class="icon-shuffle text-lt"></i></a>
                        </div>
                        <div>
                              <a class="jp-repeat" title="循环播放"><i class="icon-loop text-muted"></i></a>
                              <a class="jp-repeat-off hid" title="关闭循环"><i class="icon-loop text-lt"></i></a>
                        </div>
                        <div>
                        	<a class="" title="播放列表" data-toggle="dropdown" data-target="#playlist,#lrclist">
                          	<i class="icon-list"></i>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="jp-playlist dropup" id="playlist">
                    <ul class="dropdown-menu aside-xl dker">
                      <!-- Playlist.displayPlaylist()方法产生无序列表 -->
                      <li class="list-group-item"></li>
                    </ul>
                  </div>
                  <div class="jp-lrc dropup" id="lrclist">
                  	<div class="dropdown-menu aside-xl dker">
                      <ul class="" id="lrc_list" >
                        <li>点击开始播放</li>
                      </ul>
                    </div>
                  </div>
                  <div class="jp-no-solution hide">
                    <span>需要更新</span>
                    为了能够播放媒体文件，您需要更新您的浏览器到最新版本，或者更新您的<a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                  </div>
                </div>
              </div>
            </footer>
          </section>
        </section>
      </section>
    </section>    
  </section>
  <div class="modal fade logout-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-center animated fadeInUp text-center" style="padding-top:100px;">
        <div class="thumb-md"><img src="images/a0.jpg" class="img-circle b-a b-light b-3x"></div>
        <p class="text-white h4 m-t m-b">John.Smith</p>
        <div class="input-group">
          <button class="btn btn-success btn-rounded" type="button" data-dismiss="modal">退出登录</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade login-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content bg-info">
       <div class="container aside-xl">
        <a class="navbar-brand block m-t" href="index.html"><span class="h1 font-bold">心随乐动</span></a>
        <section class="m-b-lg">
          <header class="wrapper text-center">
            <p>登录账号获得更多</p>
            
            <!-- 记住密码 -->
    
          </header>
          <form method="post" action="${ctx }/user/login" id="defaultForm" class="form-horizontal">            
          	<div class="form-group">
              
                                    <%
String myname = "";
String mypassword = "";
try{ 
	Cookie[] cookies=request.getCookies(); 
	if(cookies!=null){ 	
		for(int i=0;i<cookies.length;i++){ 	
			if(cookies[i].getName().equals("cookie_user")){ 		
				String value = 	cookies[i].getValue();		
				if(value!=null && !("".equals(value))){		
					myname=cookies[i].getValue().split("-")[0]; 		   
					if(cookies[i].getValue().split("-")[1]!=null && !cookies[i].getValue().split("-")[1].equals("null")){
						mypassword=cookies[i].getValue().split("-")[1]; 		     
					}					 	        
				}
			} 		
			//request.setAttribute("myname",myname); 		
			//request.setAttribute("mypassward",mypassword); 	
		} 
	} 
}catch(Exception e){ 
	e.printStackTrace(); 
} 
%>  

              <input id="userName" type="text" placeholder="账号" class="form-control rounded input-lg text-center no-border" name="userName" value="" >
            </div>
            <div class="form-group">
               <input id="password" type="password" placeholder="密码" class="form-control rounded input-lg text-center no-border" name="password" value="">
            </div>
            <span id="test1"></span>
            <div class="checkbox i-checks m-b">
            <!-- 
              <label class="m-l">
                <input type="checkbox" name="flag" checked=""><i></i> 记住密码
              </label>
               -->
            </div>
            <button type="submit" class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded m-t-md"><i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登录</span></button>
            <div class="text-center m-t m-b"><a href="${ctx }/userPage/findPass.jsp"><small>忘记密码</small></a></div>
            <div class="line line-dashed"></div>
            <p class="text-muted text-center"><small>尚未注册</small></p>
            <a href="${ctx }/userPage/register.jsp" class="btn btn-lg btn-info btn-block rounded">注册</a>
          </form>
        </section>
      </div>
      </div>
    </div>
  </div>
  <div class="modal fade profile-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <form id="defaultForm2" class="form-horizontal" action="${ctx }/user/changeRes" method="post">
          <section class="panel panel-default bg-light lter">
            <header class="panel-heading">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <span class="h4">修改资料</span>
            </header>
            <div class="panel-body">
              <p class="text-muted">请填写一下资料</p>
              <div class="form-group">
                <label class="col-lg-3 control-label">用户名</label>
                <div class="col-lg-5">
                  <input readonly="true" type="text" class="form-control" name="userName" id="name" />
                  <span id="test2"></span>
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">邮箱地址</label>
                <div class="col-lg-5">
                  <input type="text" class="form-control" name="email" id="email"/>
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
                      <input name="sex" type="radio" name="gender" value="male" /> 男
                    </label>
                  </div>
                    <div class="radio">
                      <label>
                        <input name="sex" type="radio" name="gender" value="female" /> 女
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
            </div>
            <footer class="panel-footer text-right bg-light lter">
              <button type="button" class="btn btn-default btn-s-xs" data-dismiss="modal">取消</button>
              <button type="submit" class="btn btn-success btn-s-xs">提交</button>
              <button type="button" class="btn btn-default btn-s-xs" id="resetBtn">重置</button>
            </footer>
          </section>
        </form>
      </div>
    </div>
  </div>
  
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
  <script type="text/javascript" src="${ctx }/js/jPlayer/lrc.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/getlrc.js"></script>
  <script src="${ctx }/js/bootstrapValidator/bootstrapValidator.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/bootstrapValidator/useValidator.js"></script>
<script type="text/javascript">
function mYsearch(){
	var name = $("#mysearch").val();
	
	window.location.href="${ctx }/userPage/search-result.jsp?mysearch="+name+"";
}

$(document).ready(function(){
	$("liketest").hide();
    var ttt= $("#ttt").val();
    //alert(ttt);
	var user = $("#test").val();
	//alert(user);
	if(user == ""){
		//alert("login");
		$("#login").show();
		$("#logout").hide();	
	}else{
		//alert("logout");
		
		$("#logout").show();
		$("#login").hide();
	}
	
});

function checkLogin(){
	var userName = $("#userName").val();
	var password = $("#password").val();
	$.ajax({
		type:'POST',
		url:'${ctx }/user/checkLogin',
		dataType:'json',
		data:{
			username : userName,
			pass : password
		},
		success:function(data){

			if(data.mes != null){
				
				$("#test1").html("");
				$("#test1").append(data.mes);
			//	$("#sure").attr("diasbled",true);
			}else{
				$("#test1").html("");
			}
		
		} 
		
	});	
}
function execFun1(){
	window.location.href="${ctx}/user/logOut";
}

function execFun(){
	//window.location.href="${ctx}/user/logOut";
	var name = $("#test").val();
	//alert(name);
	$.ajax({
		type:'POST',
		url:'${ctx }/user/showOneUser',
		dataType:'json',
		data:{
			loginName : name,
			
		},
		success:function(data){

			$("#name").val(data.userName);
			$("#email").val(data.mail);				
		} 		
	});	
}
function mybtn(){
	var nn = $("#mysearch").val();
	//alert(nn);
	$("#mainContent").load("${ctx}/userPage/search-result.jsp",{'param':nn}
	);

}
</script>
</html>