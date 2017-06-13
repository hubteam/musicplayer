<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>类别管理</title>
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
                        <li>
                          <a href="${ctx}/song/songListByPage" target="son" class="auto">                                                        
                            <i class="fa fa-angle-right text-xs"></i>

                            <span>歌曲列表</span>
                          </a>
                        </li>
                        <li class="active">
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
  
  <section id="content">
          <section class="vbox">
            <section class="scrollable padder">
              <div class="m-b-md">
                <h3 class="m-b-none">类别管理</h3></div>
                
              
              <section class="panel panel-default">
                
                <div class="table-responsive">
                  <table class="table" style="background-color:#F7FAFA;"><!--data-ride="datatables"*/-->
                    
                    <tbody> 
                    
                    <c:forEach items="${type}"  var="type" >                
            
             <% 
             int i=0;
             %>
             
              <input id="typeId<%=i++ %>" type="hidden" name="typeId" value="${type.songTypeId }"/> 
               <td width="10%">
               <div align="left" style="margin-top:6px;">${type.songTypeName}&nbsp; 
              
                 <a href="javascript:void(0);" onclick="execFun(${type.songTypeId })" data-toggle="modal" title="修改类别" data-target="#type1"><i class="fa fa-pencil"></i></a>
                 <div class="modal fade" id="type1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                     <div class="modal-content">
                       <div class="modal-body">
                         <div class="panel-body" style="font-size:15px;">
                           <form class="form-horizontal" data-validate="parsley" action="${ctx }/type/typeChange">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                               ×
                               </button>
                             
                             <div class="panel-body" align="center"> 
                               <div class="col-lg-12" align="left">
                                 <label class="col-lg-2 control-label">类别名:</label>
                                 <div class=" col-lg-10" align="left">
                                   <input id="tn" name="tn" type="text" class="form-control"  data-required="true" contenteditable="true">   
                                   <input id="ti" name="ti" type="hidden"> 
                                   </div>
                                 </div>
                               </div>
                             <div align="right" class="col-lg-12">
                              
                               <a href="javascript:void(0);" onclick="execFun1()" class="btn btn-s-xs btn-danger" data-toggle="modal" data-target="#myModal">删除类别</a>
                               <button id= "bt2" type="submit" class="btn btn-info btn-s-xs" style="margin-left:10px">修改类别</button>
                               </div>
                             </form>
                              
                           </div>
                         </div>
                       </div>
                     </div>
                   </div></div></td>
                 
              
		       
		         </c:forEach>
		       
		       <td><a href="#" class="btn btn-default" data-toggle="modal" title="添加类别" style="background-color:#4cb6cb" data-target="#add1"><i class="fa fa-plus" style="color:white;"></i></a>
                 <div class="modal fade" id="add1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                   <div class="modal-dialog">
                     <div class="modal-content">
                       <div class="modal-body">
                         <div class="panel-body" style="font-size:15px;">
                           <form class="form-horizontal" data-validate="parsley" action="${ctx }/type/typeAdd">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                               ×
                               </button>
                             
                             <div class="panel-body" align="center"> 
                               <div class="col-lg-12" align="left">
                                 <label class="col-lg-2 control-label" >类别名:</label>
                                 <div class=" col-lg-10" align="left">
                                   <input name="mytype" type="text" class="form-control"  data-required="true" contenteditable="true" placeholder="请填入类别名">    
                                   </div>
                                 </div>
                               </div>
                             <div align="right" class="col-lg-12"><button type="submit" class="btn btn-info btn-s-xs">添加类别</button>
                               </div>
                             </form>
                           </div>
                         </div>
                       </div>
                     </div>
                   </div></td>
		       
                    </tbody>
                  </table>
                </div>
              </section>
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
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
 
 function execFun(id){
	 //int i=0;
	// var id =$("#typeId").val();
	 //var aa = document.getElementsByName("typeId");
	   //      for(var i=0;i<aa.length;i++){
	     //        alert(aa[i].value);
	       //  }
		//alert(id);
		$.ajax({
			type:'POST',
			url:'${ctx }/type/typeShowOne',
			dataType:'json',
			data:{
				fileName : id
			},
			success:function(data){
				$("#tn").val(data.songTypeName);
				$("#ti").val(data.songTypeId);

			}
				
		});
 }
 
 function execFun1(){
	 var tid = $("#ti").val();
	 //alert(tid);
	 window.location.href="${ctx}/type/typeDel?ti="+tid+"";
	 
 }
 
 
 </script>
 
</html>