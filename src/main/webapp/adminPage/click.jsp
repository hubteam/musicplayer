<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>


<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />

  <title>点击量分析</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="${ctx }/js/jPlayer/jplayer.flat.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/animate.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/simple-line-icons.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/font.css" type="text/css" />
  <link rel="stylesheet" href="${ctx }/css/app.css" type="text/css" />  
  <link rel="stylesheet" href="${ctx }/js/datatables/datatables.css" type="text/css"/>
  <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body>

  <section class="vbox">
  
   <section class="hbox stretch">
   <aside class="bg-black dk aside hidden-print" id="nav">
        
 <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
      <div class="navbar-header aside bg-info dk">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
          <i class="icon-list"></i>
        </a>
        <span class="navbar-brand text-lt">
          <i class="icon-earphones"></i>
          <img src="${ctx }/images/logo.png" alt="." class="hide">
          <span class="hidden-nav-xs m-l-sm" style="font-weight:normal">心随乐动</span>
        </span>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
          <i class="icon-settings"></i>
        </a>
      </div>      
      
     
    </header>   
          
          <section class="vbox">
            <section class="w-f-md scrollable">
              <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">
                


                <!-- nav -->                 
                <nav class="nav-primary hidden-xs">
                  
                  <ul class="nav" data-ride="collapse">
                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                      后台管理
                    </li>
                    <li >
                      <a href="#" class="auto" >
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                        <i class="icon-playlist">
                        </i>
                        <span>歌曲管理</span>
                      </a>
                      <ul class="nav dk text-sm">
                        <li >
                          <a href="${ctx}/song/songListByPage" target="son" class="auto">                                                        
                            <i class="fa fa-angle-right text-xs"></i>

                            <span>歌曲列表</span>
                          </a>
                        </li>
                        <li >
                          <a href="${ctx }/type/typeMana" target="son" class="auto">                                                        
                            <i class="fa fa-angle-right text-xs"></i>

                            <span>类别管理</span>
                          </a>
                        </li>
                      
                      </ul>
                    </li>
                    <li>
                      <a href="${ctx }/singer/singerListByPage" target="son" class="auto">
                        <i class="fa fa-users">
                        </i>
                        <span>歌手管理</span>
                      </a>
                      
                    </li>
                    <li class="active">
                      <a href="${ctx }/click/clickList" target="son">
                        <i class="icon-bar-chart">
                        </i>
                        <span>点击量分析</span>
                      </a>
                      <!-- <ul class="nav dk text-sm">
                        <li >
                          <a href="traffic.html" target="detail" class="auto">                                                        
                            <i class="fa fa-angle-right text-xs"></i>

                            <span>流量统计</span>
                          </a>
                        </li>
                        <li >
                          <a href="${ctx }/click/clickList" target="detail" class="auto">                                                        
                            <i class="fa fa-angle-right text-xs"></i>

                            <span>点击量分析</span>
                          </a>
                        </li>
                        
                        </li>
                      </ul>
                    </li>
                     
                    
                    <li>
                      <a href="${ctx }/adminPage/adminSignin.jsp" class="auto">
                        <i class="icon-user">
                        </i>
                        <span>退出登录</span>
                      </a>
                      
                    </li>
                    
                  </ul>
                  -->
                  <li>
                      <a href="${ctx }/adminPage/adminSignin.jsp" class="auto">
                        <i class="icon-user">
                        </i>
                        <span>退出登录</span>
                      </a>
                      
                    </li>
                  
                </nav>
                <!-- / nav -->
                
               
              </div>
               
            </section>
			
            
            
          </section>
        </aside>
       <section id="content">


  <section class="vbox">





  
  
   <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
     
      <form methos="post" action="${ctx }/click/clickSearch" class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search">
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-btn">
              <button type="submit" class="btn btn-sm bg-white btn-icon rounded"><i class="fa fa-search"></i></button>
            </span>
            <input name="mysearch" type="text" class="form-control input-sm no-border rounded" placeholder="搜索歌曲、歌手…">
          </div>
        </div>
      </form>
      
    </header>
    
    

    <section id="content">
          <section class="vbox">
            <section class="scrollable padder">
              <div class="m-b-md">
                <h3 class="m-b-none">点击量分析</h3></div>
                
              
              <section class="panel panel-default">
                
                <div class="table-responsive">
                  <table class="table table-striped m-b-none"><!--data-ride="datatables"*/-->
                    <thead>
                      <tr>
                        <th width="94"  >排行</th>
                        <th width="711"  >音乐标题</th>
                <th width="678" >下载量</th> 
                        <th width="174" >点击量</th>
                      </tr>
                    </thead>
                    <% int i = 1; %>
                    <c:forEach items="${list}"  var="list">
                    <tbody>
            <tr>   
              		
			<td><%=i++ %></td>
			<td>${list.song.songName }</td>
			<td>${list.download }</td>
			<td>${list.click }</td>		 
		    </tr>		
            </tbody>
            </c:forEach>
            </table>

              
                  
                  
                   <input id="total" value="${page.totalPageCount}" type="hidden">
              <input id="current" value="${page.pageNow}" type="hidden">
                  
                  <div class="text-center">
                  <ul class="pagination pagination">
                   <li>
                     <a href="${ctx }/singer/singerListByPage?pageNow=1">首页</a>
                    </li>
                  </ul>  
                  <ul id="listBypage" class="pagination pagination">
                  </ul>
                  <ul class="pagination pagination">
                   <li>
                    <a href="${ctx }/singer/singerListByPage?pageNow=${page.totalPageCount}">尾页</a>
                   </li>
                  </ul>
                  </div>
                  
                </div>
              </section>
             
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>
      </section>
      </section>
      </section>

      
      <script src="${ctx }/js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="${ctx }/js/bootstrap.js"></script>
  <!-- App -->
  <script src="${ctx }/js/app.js"></script>  
  <script src="${ctx }/js/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="${ctx }/js/charts/sparkline/jquery.sparkline.min.js"></script>
  <script src="${ctx }/js/app.plugin.js"></script>

  <!-- datatables -->
<script src="${ctx }/js/datatables/jquery.dataTables.min.js"></script>
<script src="${ctx }/js/datatables/jquery.csv-0.71.min.js"></script>
<script src="${ctx }/js/datatables/demo.js"></script>
  <script src="${ctx }/js/app.plugin.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script type="text/javascript" src="${ctx }/js/jPlayer/demo.js"></script>

</body>
<script type="text/javascript">
$(document).ready(function() {
    // Generate a simple captcha
   // alert(total);
    var total= $("#total").val();
    var current = $("#current").val();
    for(var i=1;i<=total;i++){
    	$("#listBypage").append("<li><a href='${ctx}/click/clickList?pageNow="+i+"'>"+i+"</a></li>");
    	
    }
});

</script>
</html>