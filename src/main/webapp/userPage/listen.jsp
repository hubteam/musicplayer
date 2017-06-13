<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script type="text/javascript">
     function myclick(title,artist,path,lyc,paddr){
    	 var zc=title+","+artist+","+path+","+lyc;
    	 $("a").attr('value',zc);
    	 //alert(title);
    	 //alert(artist);
    	 //alert(path);
    	 //alert(lyc);
    	 $.okclick.startm();
       	if (lyc != "") { 
   			$('#lrc_content').load(lyc,function(){
   			    //alert($('#lrc_content').val());
   			    $.getlrc.start($('#lrc_content').val(), function(){});
   			});	
   		}
       //	alert(paddr);
       	$("#pic").attr("src",paddr);
     }
  </script>
</head>
<body>

<section class="hbox stretch animated fadeInUp">
  <!--歌曲信息区-->
  <aside class="aside-xl bg-light lter b-r">
    <section class="vbox">
      <section class="wrapper text-center scrollable">
      	<div class="thumb-lg">
          <img id="pic" src="${ctx }/images/a0.jpg" class="img-responsive">
        </div>
        <div class="text-center m-t">
          <ul id="detial_lrc_list" style="list-style:none"></ul>
        </div>
      </section>
    </section>
  </aside>
  <!--/歌曲信息区-->
  <section class="vbox">
    <header  class="header padder-lg">
      <h2 class="font-thin m-t">试听列表</h2>
    </header>
    <section class="vbox">
      <header class="header col-lg-6">
        <div class="btn-group btn-group-justified m-b">
          <a class="btn btn-dark btn-rounded">
            <i class="icon icon-control-play m-r"></i> 播放全部
          </a>
          <a class="btn btn-sm btn-success btn-rounded">
              <i class="icon-cloud-download i-md m-r"></i> 下载 
          </a>
          <a class="btn btn-dark btn-rounded dropdown-toggle" data-toggle="dropdown" data-target="#songlist">
            <i class="icon icon-plus m-r"></i> 添加到
          </a>
        </div>
        <div class="dropdown pull-right" id="songlist">
          <ul class="dropdown-menu animated fadeInRight">
            <li>
              <span class="arrow top"></span>
              <a href="#" class="m-l-lg"> 试听列表</a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="#"><i class="icon icon-heart m-r"></i> 我最喜欢</a>
            </li>
            <li>
              <a href="#">列表1</a>
            </li>
          </ul>
        </div>
      </header>
      <!-- 歌曲列表 -->
      <section class="table-responsive scrollable" style="padding:15px;">
        <table class="table table-striped b-t b-light">
          <thead>
            <tr>
              <th style="width:5%;">
              <!-- 
              <label class="checkbox m-n i-checks"><input type="checkbox"><i></i></label>
               -->
              </th>
              
              <th class="th-sortable" data-toggle="class">歌曲
                <span class="th-sort">
                  <i class="fa fa-sort-down text"></i>
                  <i class="fa fa-sort-up text-active"></i>
                  <i class="fa fa-sort"></i>
                </span>
              </th>
              <th>歌手</th>
              <th>试听时间</th>
              <th style="width:30%;">操作</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${list }" var="list">
            <tr>
            
              <td>
              <!--  
              <label class="checkbox m-n i-checks"><input type="checkbox" name="post[]"><i></i></label>
              -->
              </td>
              <td><a href="#">${list.songName }</a></td>
              <td>${list.singer.singerName }</td>
              <td><fmt:formatDate value="${list.click.clickTime }" type="date"></fmt:formatDate></td>
              <td>
                <a href="#" class="ok active" data-toggle="class" onclick="myclick('${list.songName}','${list.singer.singerName }','${list.songAddr}','${list.lyricAddr}','${list.singer.singerPictureAddr }')">
                  <i class="icon-control-play"></i>
                  <!-- <i class="icon-control-pause text"></i> -->
                </a>
                <a id="${list.songId }" href="javascript:void(0);" onclick="isLike('${user}','${list.songId }')" data-toggle="class">
                  <i class="fa fa-heart-o text m-l-sm" title="我最喜欢"></i>
                  <i class="fa fa-heart text-active text-danger m-l-sm" title="取消喜欢"></i>
                </a>
                <a href="javascript:void(0);" onclick="isLogin('${user}','${list.songAddr}','${list.songId}')" ><i class="icon-cloud-download m-l-sm"></i></a>
                <a href="${ctx }/song/songDetail?songId=${list.songId}"  data-bjax data-target="#mainContent"><i class="icon-speech m-l-sm"></i></a>
                <a href="${ctx }/click/deleteClick?songId=${list.songId}"  data-bjax data-target="#mainContent"><i class="fa fa-trash-o m-l-sm"></i></a>
              </td>
            </tr>
           </c:forEach>
            
          </tbody>
        </table>
        <!-- 
        <div class="text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
          </ul>
        </div>
         -->
      </section>
      <!-- /歌曲列表 -->
    </section>
  </section>
</section>


</body>
<script type="text/javascript">
$(document).ready(function(){
	
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
});

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