<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>歌曲列表</title>
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
  
  <link rel="stylesheet" href="${ctx }/js/datepicker/datepicker.css" type="text/css" />
<link rel="stylesheet" href="${ctx }/js/slider/slider.css" type="text/css" />
<link rel="stylesheet" href="${ctx }/js/chosen/chosen.css" type="text/css" />
  <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
        
        <link href="${ctx }/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <script src="${ctx }/http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
        <script src="${ctx }/js/fileinput.js" type="text/javascript"></script>

</head>
<body>





 <section class="vbox">

<section>
      <section class="hbox stretch">
        <!-- .aside -->
        <aside class="bg-black dk aside hidden-print" id="nav">
        
         <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
      <div class="navbar-header aside bg-info dk">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
          <i class="icon-list"></i>
        </a>
        <span class="navbar-brand text-lt">
          <i class="icon-earphones"></i>
          <img src="images/logo.png" alt="." class="hide">
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
                    <li class="active">
                      <a href="#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                        <i class="icon-playlist">
                        </i>
                        <span>歌曲管理</span>
                      </a>
                      <ul class="nav dk text-sm">
                        <li class="active">
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
                    <li >
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
                    
                  </ul>
                  
                </nav>
                <!-- / nav -->
                
               
              </div>
               
            </section>
			
            
            
          </section>
        </aside>
        
        <section id="content">











  <section class="vbox">
    <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
     
      <form method="post" action="${ctx }/song/songSearch" class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search">
        <div class="form-group">
          <div style="width:500px" class="input-group">
            <span class="input-group-btn">
              <button type="submit" class="btn btn-sm bg-white btn-icon rounded"><i class="fa fa-search"></i></button>
            </span>
            <input name="mysearch" type="text" class="form-control input-sm no-border rounded" placeholder="搜索歌曲、歌手">
          </div>
        </div>
      </form>
         
    </header>
    
    <section id="content">
          <section class="vbox">
            <section class="scrollable padder">
              <div class="m-b-md">
                <h3 class="m-b-none">歌曲列表
                <a href="${ctx }/song/showSingers" class="btn btn-s-md btn-info" style="float:right;">歌曲上传</a>
                </h3></div>
             
              <section class="panel panel-default">
                
                <div class="table-responsive">
                  <table class="table table-striped m-b-none" ><!--data-ride="datatables"*/-->
                    <thead>
                      <tr>
                        <th width="138"  >&nbsp;</th>
                        <th width="507"  >音乐标题</th>
                        <th width="265"  >歌手</th>
                        
                       
                        <th width="129" >操作</th>
                      </tr>
                    </thead>
                    <%int i=1; %>
                    <c:forEach items="${list}"  var="list" >
                    <tbody>
                    		<tr>
			<td><%=i++ %></td>
			<td>${list.songName }</td>
			<td>${list.singer.singerName }</td>
			
			
			<td>
            <a href="javascript:void(0);" onclick="execFun1(${list.songId })"  data-toggle="modal" title="歌曲删除" data-target="#delete1" style="float:left;"><i class="fa fa-trash-o" style="margin-right:10px;"></i></a>
            <div class="modal fade" id="delete1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
               
                <div class="modal-body">
                
                <section class="panel panel-info portlet-item">
                <header class="panel-heading">
                  <strong>提示消息</strong>
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </header>
                <div class="caption wrapper-lg" align="center">
                   <h5><strong>删除成功！</strong></h5>
                </div>
              </section>
                </div>
                </div>
                </div>
                </div>
            
            <a href="javascript:void(0);" onclick="execFun2(${list.songId })" data-toggle="modal" title="歌曲修改" data-original-title="歌曲修改" data-target="#modify1" style="float:left;"><i class="fa fa-pencil" style="margin-right:10px;"></i></a>
            <div class="modal fade" id="modify1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
               
                <div class="modal-body">
                
                <div class="panel-body" style="font-size:15px;">
  				<form method="post" enctype="multipart/form-data" class="form-horizontal" data-validate="parsley" action="${ctx }/song/songChange">
                    <section class="panel panel-default">
                      <header class="panel-heading">
                        <strong>歌曲修改面板</strong>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                ×
                </button>
                      </header>
                      <div class="panel-body"> 
                      <p><strong>修改信息：</strong></p>
                      <div class="line line-dashed b-b line-lg pull-in"></div>                   
                        <div class="form-group">
                          <label class="col-sm-3 control-label">音乐标题</label>
                          <div class="col-sm-9">
                            <input id="songName" name="songName" type="text" class="form-control" placeholder="请填入音乐标题" data-required="true" contenteditable="true">    
                         <input id="singid" name="singerid" type="hidden">
                          </div>
                        </div>
                        <div class="line line-dashed b-b line-lg pull-in"></div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label">歌手</label>
                          <div class="col-sm-9">
                        <select id="singerName" name="singerName" style="width:100%" >
                        <option>请选择歌手</option>
                        
                                
                                
                            
                        </select>
                      </div>
                        </div>
                       
                        <div class="line line-dashed b-b line-lg pull-in"></div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label">歌曲类别</label>
                          <div class="col-sm-9">
                            <select id="songType" name="songType" style="width:100%" >
                        <option>请选择类别</option>
                                
                           
                        </select>
                          </div>
                        </div>
                        <!-- 
                        <div class="line line-dashed b-b line-lg pull-in"></div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label">歌曲发布时间</label>
                          <div class="col-sm-9">
                            <input type="text" data-type="dateIso" class="form-control" placeholder="请填入歌曲发布时间（如2017-01-09）">
                          </div>
                        </div>
                         -->
                        <div class="line line-dashed b-b line-lg pull-in"></div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label">歌曲上传</label>
                          <div class="col-sm-9">
                            <input name="filename" id="filename" class="file" type="file" multiple data-min-file-count="1">
                          </div>
                        </div>
                      </div>
                      <footer class="panel-footer text-right bg-light lter">
                        <button type="submit" class="btn btn-info btn-s-xs">提交</button>
                      </footer>
                    </section>
                  </form>
                    
                    
                      </div>
                
                </div>
                
                </div>
                </div>
            </div>
            
            <a href="javascript:void(0);" onclick="execFun(${list.songId })" title="歌词上传" data-toggle="modal" data-original-title="歌词上传" data-target="#upload1" style="float: left;"><i class="fa fa-file-text-o" style="margin-right:10px;"></i></a>
            <div class="modal fade" id="upload1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
               
                <div class="modal-body">
                
                <div class="panel-body" style="font-size:15px;">
  				<form enctype="multipart/form-data"  class="form-horizontal" data-validate="parsley" action="${ctx}/song/upLyric" method="post">
                    <section class="panel panel-default">
                      <header class="panel-heading">
                        <strong>歌词上传面板</strong>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                ×
                </button>
                      </header>
                      <div class="panel-body"> 
                      
                        <div class="form-group">
                          <label class="col-sm-3 control-label" >歌词上传</label>
                          <div class="col-sm-9">
                          <input type="hidden" id="songId" name="songId">
                            <input name="filename" id="filename" class="file" type="file" multiple data-min-file-count="1">
                          </div>
                        </div>
                      </div>
                      <footer class="panel-footer text-right bg-light lter">
                        <button type="submit" class="btn btn-info btn-s-xs">提交</button>
                      </footer>
                    </section>
                  </form>
                    
                    
                      </div>
                
                </div>
                
                </div>
                </div>
            </div>
            
            </td>
		</tr>
		
		
                    </tbody>
                    </c:forEach>
                  </table>
                </div>
              </section>
              
               <input id="total" value="${page.totalPageCount}" type="hidden">
              <input id="current" value="${page.pageNow}" type="hidden">
              
            <div class="text-center">
                  <ul class="pagination pagination">
                   <li>
                     <a href="${ctx }/song/songListByPage?pageNow=1">首页</a>
                    </li>
                  </ul>  
                  <ul id="listBypage" class="pagination pagination">
                  </ul>
                  <ul class="pagination pagination">
                   <li>
                    <a href="${ctx }/song/songListByPage?pageNow=${page.totalPageCount}">尾页</a>
                   </li>
                  </ul>
              </div>
                 
            </section>
          </section>
          </section>
          </section>
          </section>
          
          
          <script src="${ctx }/js/datepicker/bootstrap-datepicker.js"></script>
  <!-- slider -->
  <script src="${ctx }/js/slider/bootstrap-slider.js"></script>
  <!-- file input -->  
  <script src="${ctx }/js/file-input/bootstrap-filestyle.min.js"></script>
  <!-- wysiwyg -->
  <script src="${ctx }/js/wysiwyg/jquery.hotkeys.js"></script>
  <script src="${ctx }/js/wysiwyg/bootstrap-wysiwyg.js"></script>
  <script src="${ctx }/js/wysiwyg/demo.js"></script>
  <!-- markdown -->
  <script src="${ctx }/js/markdown/epiceditor.min.js"></script>
  <script src="${ctx }/js/markdown/demo.js"></script>

  <script src="${ctx }/js/chosen/chosen.jquery.min.js"></script>
  <script src="${ctx }/js/app.plugin.js"></script>
  
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
   var total= $("#total").val();
   var current = $("#current").val();
   for(var i=1;i<=total;i++){
	  $("#listBypage").append("<li><a href='${ctx}/song/songListByPage?pageNow="+i+"'>"+i+"</a></li>");
	
   }
});

function execFun(sid){
	//alert(sid);
	$("#songId").val(sid);
}

function execFun1(sid){
	//alert(sid);
	//$("#songId").val(sid);
	window.location.href="${ctx}/song/songDel?id="+sid+"";
}

function execFun2(sid){
	
	$.ajax({
		type:'POST',
		url:'${ctx }/song/showSingleSong',
		dataType:'json',
		data:{
			fileName : sid
		},
		success:function(data){
			$("#songName").val(data.songName);
			$("#singid").val(data.songId);
			
		} 
	});
	
	$.ajax({
		type:'POST',
		url:'${ctx }/song/showSingerName',
		dataType:'json',
		success:function(data){
			//$("#albumName").html("");
		    $.each(data,function(i,item){
		    	//alert(item.songTypeName);
			     $("#singerName").append("<option value='"+item.singerId+"'>"+item.singerName+"</option>");
			//$("#albumName").add(new Option("+item.singer.albumName+","+item.singer.albumName+"));
			});
		} 
	});
	
	$.ajax({
		type:'POST',
		url:'${ctx }/song/showType',
		dataType:'json',
		success:function(data){
			//$("#albumName").html("");
		    $.each(data,function(i,item){
		    	//alert(item.songTypeName);
			     $("#songType").append("<option value='"+item.songTypeId+"'>"+item.songTypeName+"</option>");
			//$("#albumName").add(new Option("+item.singer.albumName+","+item.singer.albumName+"));
			});
		} 
	});
}


</script>
</html>