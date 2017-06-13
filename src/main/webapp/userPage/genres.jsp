<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>Heart with Music 心随乐动</title>
  
  <script type="text/javascript">
     function addLrc(lrc){
    	 //listlrc=this.playlist[a].lrc;
    	//alert(lrc);
     	if (lrc != "") { 
 			$('#lrc_content').load(lrc,function(){
 			    //alert($('#lrc_content').val());
 			    $.getlrc.start($('#lrc_content').val(), function() {});
 			});	
 		}
     }
  </script>
  
</head>

<body>
              <section class="hbox stretch">
                <!-- side content -->
                <aside class="aside bg-light dk" id="sidebar">
                  <section class="vbox animated fadeInUp">
                    <section class="scrollable hover">
                      <div class="list-group no-radius no-border no-bg m-t-n-xxs m-b-none auto" id="test">
                        <a href="${ctx }/song/showSongList" data-bjax data-target="#mainContent" class="list-group-item">
                                                                                     全部
                        </a>
                        <div id="songType">
                        </div>
                        
                      <c:forEach items="${type }" var="type">
                     <!-- 
                        <a href="${ctx }/song/showSongList?songType=${type.songTypeName }" class="list-group-item">
                         
                        -->
                       
                         <a href="${ctx }/song/showSongList?songType=${type.songTypeName }" data-bjax data-target="#mainContent" class="list-group-item">  
                          ${type.songTypeName }
                        </a>
                        </c:forEach>
                       
                      </div>
                    </section>
                  </section>
                </aside>
                <!-- / side content -->
                
                <section class="padder-lg">
                  <section class="vbox animated fadeInUp">
                    <header class="header">
                    <h2 id="test1" class="font-thin m-b">全部</h2>
                      <h2 id="test2" class="font-thin m-b">${songType }</h2>
                      <section class="no-padder" style="float:none">
                        <div class="btn-group btn-group-justified m-b">
                          <a class="btn btn-dark btn-rounded">
                            <i class="icon icon-control-play m-r"></i> 播放全部
                          </a>
                          <a class="btn btn-sm btn-success btn-rounded">
                              <i class="fa fa-cloud-download m-r"></i> 下载 
                          </a>
                          <a class="btn btn-dark btn-rounded dropdown-toggle" data-toggle="dropdown" data-target="#songlist">
                            <i class="icon icon-plus m-r"></i> 添加到
                          </a>
                        </div>
                        <div class="dropdown pull-right" id="songlist">
                          <ul class="dropdown-menu animated fadeInRight">
                            <li>
                              <span class="arrow top"></span>
                              <a class="m-l-lg" href="#"> 试听列表</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                              <a href="#"><i class="icon icon-heart m-r"></i> 我最喜欢</a>
                            </li>
                          </ul>
                        </div>
                      </section>
                    </header>
                    <section class="scrollable" style="margin-top:60px">
                      <div class="table-responsive">
                        <table class="table table-striped b-t b-light scrollable">
                          <thead>
                           <tr>
                           <!-- 复选框 -->
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                            <td></td>
                           <!-- 
                              <th style="width:20px;"><label class="checkbox m-n i-checks"><input type="checkbox"><i></i></label></th>
                              -->
                              <th>歌曲 </th>
                              <th>歌手</th>
                            
                              <th style="width:300px;">操作</th>
                              <th style="width:30px;"></th>
                            </tr>
                          </thead>
                          <tbody>
                         <input id="songTypeName" value="${songType }" type="hidden" name="songTypeName">
                             <%int i=1; %>
                             <c:forEach items="${list}"  var="list" >
                             
                            <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <!-- 
                              <td><label class="checkbox m-n i-checks"><input type="checkbox" name="post[]"><i></i></label></td>
             -->                 
                              <td>${list.songName }</td>
                              <c:forEach items="${list.singers }" var="nn">
                              <td>${nn.singerName }</td>
                               </c:forEach>
                             
                              <td>
                              <c:forEach items="${list.singers }" var="aa">
                                <a href="#" onclick="myclick('${list.songName}','${aa.singerName }','${list.songAddr}','${list.lyricAddr}')"  class="ok active" data-bjax data-target="#mainContent">
                                  <i class="icon-control-play text-active"></i>
                                  <i class="icon-control-pause text"></i>
                                </a>
                                </c:forEach>
                               
                          <a id="${list.songId }" href="javascript:void(0);" onclick="isLike('${user}','${list.songId }')" data-toggle="class">
                            <i class="fa fa-heart-o text m-l-sm" title="我最喜欢"></i>
                            <i class="fa fa-heart text-active text-danger m-l-sm" title="取消喜欢"></i>
                          </a>
                           <!-- 加入我最喜欢 -->
                                 <!-- 
                                <a href="#" class="m-r-sm dropdown-toggle" data-toggle="dropdown"><i class="icon-plus"></i></a>
                                <ul class="dropdown dropdown-menu animated fadeInRight">
                                  <li>
                                    <a href="#" class="m-l-lg"> 试听列表</a>
                                  </li>
                                  <li class="divider"></li>
                                  <li>
                                    <a href="#"><i class="icon icon-heart m-r"></i> 我最喜欢</a>
                                  </li>
                                </ul>
                                -->
                               
                               <!-- 
                                <a id="aa" href="${ctx }/click/downFile?songAddr=${list.songAddr}&songId=${list.songId}" onclick="isLogin(${user},${list.songAddr},${list.songId})"  class="m-r-sm"><i class="icon-cloud-download"></i></a>
                                -->
                            <a href="javascript:void(0);" onclick="isLogin('${user}','${list.songAddr}','${list.songId}')"  class="m-l-sm" data-bjax data-target="#mainContent"><i class="icon-cloud-download"></i></a>
                                <a href="${ctx }/song/songDetail?songId=${list.songId}" onclick="addLrc('${list.lyricAddr}');"  class="m-l-sm" data-bjax data-target="#mainContent"><i class="icon-speech"></i></a>
                              </td>
                            </tr>
                            </c:forEach>
                                                       
                          </tbody>
                        </table>
                         <input id="total" value="${page.totalPageCount}" type="hidden">
                        <input id="current" value="${page.pageNow}" type="hidden">
                        <!-- 分页 -->
                         <div class="text-center">
                          
                       <!--     <li>
                              <a href="${ctx }/song/showSongList?pageNow=1" data-bjax data-target="#mainContent">首页</a>
                            </li> --> 
                           </ul>  
                           <ul id="listBypage" class="pagination pagination">
                           </ul>
                           
                         <!--     <li>
                               <a href="${ctx }/song/showSongList?pageNow=${page.totalPageCount}" data-bjax data-target="#mainContent">尾页</a>
                             </li> --> 
                            </ul>
                        </div>
                      </div>
                    </section>           
                  </section>
                </section>
              </section>

     
</body>
<script type="text/javascript">
$(document).ready(function(){
	//test用
	//for(var a=1;a<=10;a++){
	//	$("#"+a+"").attr("class","active");
	//}
	//var user = ${user};
	//alert(${user});
	//异步刷新心形按钮
	$.ajax({
		type:'POST',
		url:'${ctx }/like/isLike',
		dataType:'json',
		
		success:function(data){
			//alert("success");
			$.each(data,function(i,item){
				$("#"+item.songId+"").attr("class","active");
			});		
				
		}
	
	});
	
	var name=$("#songTypeName").val();
	if(!name){
		$("#test1").show();
		$("#test2").hide();
		
	}else{
		$("#test2").show();
		$("#test1").hide();
	}
	
	//alert(name);
	 var total= $("#total").val();
	   var current = $("#current").val();
	   $("#listBypage").html("");
	   $("#listBypage").append("<li><a href='${ctx}/song/showSongList?pageNow="+1+"&songType="+name+" 'data-bjax data-target="+'#mainContent'+">首页</a></li>");	
	   for(var i=1;i<=total;i++){
		  
		  $("#listBypage").append("<li><a href='${ctx}/song/showSongList?pageNow="+i+"&songType="+name+" 'data-bjax data-target="+'#mainContent'+">"+i+"</a></li>");		
	   }
	   $("#listBypage").append("<li><a href='${ctx}/song/showSongList?pageNow="+total+"&songType="+name+" 'data-bjax data-target="+'#mainContent'+">尾页</a></li>");	
   
});

function test(name){
	alert(name);
	$("#songTypeName").val(name);
}

function isLogin(name,addr,id){
	//alert("进入了");
	//alert(name);
	//alert(addr);
	if(!name){
		alert("请先登陆");
		//$("#aa").attr("data-toggle","class" );
	}else{
		window.location.href="${ctx }/click/downFile?songAddr="+addr+"&songId="+id+"";
	}
}

function isLike(name,id){
	//alert(name);
	//alert(id);
	if(!name){
		alert("请先登陆");
	}
	else{		
		//异步加载的部分
		$.ajax({
			type:'POST',
			url:'${ctx }/like/cherish',
			dataType:'json',
			data:{
				songId:id
			},
			success:function(data){
				//alert(data.mes)	;				
			}		
		});
	}
}
</script>
</html>
