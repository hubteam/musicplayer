<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
           <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Heart with Music 心随乐动</title>
  </head>
  <body>
  <input id="myUser" type="hidden" value="${user }">
              <section class="hbox stretch">
                <aside class="aside-xxl bg-light lter b-r">
                  <section class="vbox">
                    <section class="scrollable">
                      <div class="wrapper">
                        <div class="text-center m-b m-t">
                          <a href="#" class="thumb-lg">
                            <img src="${list.singer.singerPictureAddr }" class=" img-responsive">
                          </a>
                          <div>
                          <!-- 
                            <div class="h3 m-t-xs m-b-xs">${list.songName }</div>
                             -->
                          </div>                
                        </div>
                        <div class="panel wrapper">
                          <div class="row text-center">
                            <div class="col-xs-6">
                              <a href="#">
                                <small class="text-muted">歌手：</small>
                                <span class="m-b-xs h4 block">${list.singer.singerName }</span>
                              </a>
                            </div>
                            <div class="col-xs-6">
                              <a href="#">
                                <small class="text-muted">歌曲：</small>
                                <span class="m-b-xs h4 block">${list.songName }</span>
                               <input id="test1" type="hidden" value="${list.lyricAddr }">
                              </a>
                            </div>
                          </div>
                        </div>
                        <div class="btn-group btn-group-justified m-b">
                          <a class="btn btn-dark btn-rounded">
                            <i class="icon icon-control-play m-r"></i> 播放
                          </a>
                          <a class="btn btn-success btn-rounded" data-toggle="button">
                            <span class="text">
                              <i class="fa fa-heart-o m-r"></i> 收藏
                            </span>
                            <span class="text-active">
                              <i class="fa fa-heart m-r text-danger"></i> 收藏
                            </span>
                          </a>
                          <a class="btn btn-dark btn-rounded">
                            <i class="icon icon-cloud-download m-r"></i> 下载
                          </a>
                        </div>
                        
                        <!-- 放入地址的部分，歌词的路径地址${list.lyricAddr} -->
                        <div>
                            <div class="hide" id="moreless">
	                          <ul class="text-muted" id="detial_lrc_list" style="list-style:none;">
	                          </ul>
	                        </div>
		                	<a href="#moreless" class="btn btn-sm btn-default" data-toggle="class:show">
                        <i class="fa fa-plus text"></i>
                        <span class="text">更多详情</span>
                        <i class="fa fa-minus text-active"></i>
                        <span class="text-active">收起</span>
                      </a>
		              	  </p>
                      </div>
                      </div>
                    </section>
                  </section>
                </aside>
                <input id="user" name="user" type="hidden" value="${user }">
                <aside class="bg-white">
                	<section class="vbox">
                    <header class="header bg-white b-b b-light">
                      <h2 class="font-thin" style="margin-top: 0px;">评论</h2>
                    </header>
                    <section class="scrollable">
                      <ul class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
                        <li class="list-group-item">
                        <!-- 
                          <form method="post"  action="${ctx }/comment/addComment">
                          -->
                          <input id="songId" name="songId" type="hidden" value="${list.songId }">
                            <div class="form-group">
                              <label>我的评论</label>
                              <textarea onclick="check(${user})" name="comm" id="comm" class="form-control" rows="5" placeholder="输入你的评论内容"></textarea>
                            </div>
                            <div class="form-group text-right">
                             <button onclick="copyText()" class="bg-success btn">发表评论</button>
                            </div>
                       <!-- </form> -->   
                        </li>
                        <div id="commContent">
                        <c:forEach items="${comment }" var="comment">
                        
                        <li  class="list-group-item" id="comment-id-1">
                          <a href="#" class="thumb-sm pull-left m-r-sm">
                            <img src="${ctx }/images/a0.jpg" class="img-circle">
                          </a>
                          <a href="#" class="clear">
                            <small  class="pull-right">${comment.time }</small>
                            <strong  class="block">${comment.userName }</strong>
                            <small >${comment.comment }</small>
                          </a>
                                                 
                          <div  class="comment-action m-t-sm text-right">
                            <a href="javascript:void(0)" onclick="deleteCom('${comment.userName}','${comment.commentId }')" data-dismiss="alert" class="btn btn-default btn-xs" title="删除评论">
                              <i class="fa fa-trash-o text-muted"></i> 
                            </a>
                          </div>
                           
                        </li>
                        
                      </c:forEach>
                      </div>
                      </ul>
                    </section>
                  </section>
                </aside>
              </section>                        
  
</body>
<script type="text/javascript">
$(document).ready(function()
{
	var lrc = $("#test1").val();
	//alert(lrc);
	if (lrc != "") 
	{ 
			$('#lrc_content').load(lrc,function()
			{
			    //alert($('#lrc_content').val());
			    $.getlrc.start($('#lrc_content').val(), function() {});
			});	
	}
});

function copyText()
{
	var comm = $("#comm").text();	
	var songId = $("#songId").val();
	//alert("123");
	if(comm == null)
	{
		alert("评论内容不能为空");
	}else
	{		
		$.ajax(
		{
			type:'POST',
			url:'${ctx }/comment/addComment',
			dataType:'json',
			data:
			{
				comment : comm,
				songId :songId
			},
			success:function(data)
			{
				$("#commContent").html("");
				$.each(data,function(i,item){
					$("#commContent").append(
							"<li class='list-group-item' id='comment-id-1'>"+
							"<a class='thumb-sm pull-left m-r-sm'>"+							
							"<img src='${ctx }/images/a0.jpg' class='img-circle'>"+
							"</a>"+
							"<a class='clear'>"+
							"<small class='pull-right'>"+
					        item.time+
					        "</small>"+
					        "<strong class='block'>"+
					        item.userName+
					        "</strong>"+
					        "<small >"+
					        item.comment+
					        "</small>"+
					        "</a>"+
					        "<div class='comment-action m-t-sm text-right'>"+
							"<a data-dismiss='alert' onclick=\"deleteCom('"+item.userName+"','"+item.commentId+"')\" class='btn btn-default btn-xs' title='删除评论'>"+
							"<i class='fa fa-trash-o text-muted'></i>"+
							"</a>"+
							"</div>"+		        
					        "</li>"     
					);
				});			
			}			
		});										
	} 					
}


function deleteCom(userName,id){
	var name = $("#myUser").val();
	var songId = $("#songId").val();
	//alert(songId);
	//alert(id);
	if(userName != name){
		alert("您没有权限删除");
	}else{
		
		$.ajax(
				{
					type:'POST',
					url:'${ctx }/comment/commentDel',
					dataType:'json',
					data:
					{
						songId : songId,
						commentId : id
					},
					success:function(data)
					{
						$("#commContent").html("");
						$.each(data,function(i,item){
							$("#commContent").append(
									"<li class='list-group-item' id='comment-id-1'>"+
									"<a class='thumb-sm pull-left m-r-sm'>"+							
									"<img src='${ctx }/images/a0.jpg' class='img-circle'>"+
									"</a>"+
									"<a class='clear'>"+
									"<small class='pull-right'>"+
							        item.time+
							        "</small>"+
							        "<strong class='block'>"+
							        item.userName+
							        "</strong>"+
							        "<small >"+
							        item.comment+
							        "</small>"+
							        "</a>"+
							        "<div class='comment-action m-t-sm text-right'>"+
									"<a data-dismiss='alert' onclick=\"deleteCom('"+item.userName+"','"+item.commentId+"')\" class='btn btn-default btn-xs' title='删除评论'>"+
									"<i class='fa fa-trash-o text-muted'></i>"+
									"</a>"+
									"</div>"+		        
							        "</li>"     
							);
						});			
					}			
				});		
		
	}
	
}


function check(name)
{
	if(name==null)
	{
		alert("请先登陆");
		//$("#test").attr("data-toggle","modal");
		//$("#test").attr("data-target",".login-modal");
	}
}

//function deleteComment(userName,name,id)
//{
//	var songId = $("#songId").val();
	//alert(typeof songId);
//	if(userName===name)
//	{
//		window.location.href="${ctx}/comment/commentDel?songId="+songId+"&commentId="+id+"";
//	}else
//	{
//		alert("您没有权限删除");
//		
//	}
	
//}


</script>
</html>