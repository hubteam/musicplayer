<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="vbox animated fadeInUp">
  <section class="scrollable">
    <div class="wrapper">
      <div class="row m-t-n-xxs">
        <div class="col-lg-2 m text-center"><i class="icon-magnifier i-5x"></i></div>
        <div class="gd no-bg col-lg-4">
          <div class="m-b">
            <span class="h2">搜索的结果</span>
          </div>
          <div class="btn-group btn-group-justified m-b">
            <a class="btn btn-dark btn-rounded">
              <i class="icon icon-control-play m-r"></i> 播放全部
            </a>
            <a class="btn btn-sm btn-success btn-rounded">
                <i class="icon icon-cloud-download i-md m-r"></i> 下载 
            </a>
            <a class="btn btn-dark btn-rounded dropdown-toggle" data-toggle="dropdown" data-target="#songlist">
              <i class="icon icon-plus m-r"></i> 添加到
            </a>
          </div>
          <div class="dropdown pull-right" id="songlist">
            <ul class="dropdown-menu animated fadeInUp">
              <li>
                <span class="arrow top text-center-xs"></span>
                <a href="#" class="m-l-md"> 试听列表</a>
              </li>
              <li class="divider"></li>
              <li>
                <a href="#"><i class="icon icon-heart m-r-xs"></i> 我最喜欢</a>
              </li>
              <li>
                <a href="#" class="m-l-md"> 列表1</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div>
      <%
     String p =request.getParameter("param");
%>
<input id="param" type="hidden" value=<%=p %>>
        <table class="table table-hover">
          <thead>
            <tr>
             
              <th class="th-sortable" data-toggle="class">歌曲
                <span class="th-sort">
                  <i class="fa fa-sort-down text"></i>
                  <i class="fa fa-sort-up text-active"></i>
                  <i class="fa fa-sort"></i>
                </span>
              </th>
              <th>歌手</th>
             
              
              <th style="width:30%;">操作</th>
            </tr>
          </thead>
          <tbody id="searchRes">  
          <!-- 
            <tr>              
              <td>${list.songName }</td>
              <td>${list.singer.singerName }</td>             
              <td>
                <a href="#" class="m-r-sm active" data-toggle="class">
                  <i class="icon-control-play text-active"></i>
                  <i class="icon-control-pause text"></i>
                </a>
                <a href="#" class="m-r-sm"><i class="icon-plus"></i></a>
                <a href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
                <a href="#" class="m-r-sm"><i class="icon-speech"></i></a>
              </td>
            </tr>
             -->                      
          </tbody>
        </table>
      </div>
    </div>
  </section>
</section>

<input type="hidden" id="inp" value="${user }">

</body>

<script type="text/javascript">
$(document).ready(function(){
	var p = $("#param").val();
	//alert(p);
	$.ajax({
		type:'POST',
		url:'${ctx }/song/findSongOrSinger',
		dataType:'json',
		data:
		{
			mysearch : p
		},
		success:function(data){
			//alert("success");
			$.each(data,function(i,item){
			//	alert(item.songName);
				$("#searchRes").append(
					"<tr>"+	
					"<td>"+item.songName+"</td>"+
					"<td>"+item.singer.singerName+"</td>"+
					"<td>"+
					"<a href='#' class='active' data-toggle='class'>"+
					"<i class='icon-control-play text-active'></i>"+
					"<i class='icon-control-pause text'></i>"+
					"</a>"+
					"<a id="+item.songId+" href='javascript:void(0);' onclick=\"isLike('"+item.songId +"')\" data-toggle='class'>"+
					"<i class='fa fa-heart-o text m-l-sm' title='我最喜欢'></i>"+
					"<i class='fa fa-heart text-active text-danger m-l-sm' title=取消喜欢></i>"+
					"</a>"+
					"<a href='javascript:void(0);' onclick=\"isLogin('"+item.songAddr+"','"+item.songId+"')\" class='m-r-sm'>"+
					"<i class='icon-cloud-download m-l-sm'></i>"+
					"</a>"+
					"<a href='${ctx }/song/songDetail?songId="+item.songId+"' data-bjax data-target='#mainContent' class='m-r-sm'>"+
					"<i class='icon-speech'></i>"+
					"</a>"+
					"</td>"+
					"</tr>"	
				);
				//alert("over");
				
			});	
				
				
		}
	

	});
	
	
	

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
	
	
	
	function isLike(id){
		//alert(name);
		//alert(id);
		var name = $("#inp").val();
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

	function isLogin(addr,id){
		//alert("进入了");
		//alert(name);
		//alert(addr);
		var name = $("#inp").val();
		if(!name){
			alert("请先登陆");
			//$("#aa").attr("data-toggle","class" );
		}else{
			window.location.href="${ctx }/click/downFile?songAddr="+addr+"&songId="+id+"";
		}
	}


</script>

</html>