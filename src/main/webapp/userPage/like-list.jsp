<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>Heart with Music 心随乐动</title>
</head>
<body>

<section class="vbox animated fadeInUp">
  <section class="scrollable">
    <div class="wrapper">
      <div class="row m-t-n-xxs">
        <div class="col-lg-2 m text-center"><i class="fa fa-heart-o i-5x text-danger"></i></div>
        <div class="gd no-bg col-lg-4">
          <div class="m-b">
            <span class="h2">我最喜欢</span>
            <span class="h3 text-muted"></span>
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
        <table class="table table-hover">
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
             
              <th>收藏时间</th>
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
            
              <td><fmt:formatDate value="${list.like.likeTime }" type="date"></fmt:formatDate></td>
              <td>
                <a href="#" class="ok m-r-sm active" data-toggle="class" onclick="myclick('${list.songName}','${list.singer.singerName}','${list.songAddr}','${list.lyricAddr}')">
                  <i class="icon-control-play"></i>
                  <!-- <i class="icon-control-pause text"></i>  -->
                </a>
                <!-- 
                <a href="#" class="m-r-sm"><i class="icon-plus"></i></a>
                 -->
                <a href="${ctx }/click/downFile?songAddr=${list.songAddr}&songId=${list.songId}"  class="m-r-sm"><i class="icon-cloud-download"></i></a>
                <a href="${ctx }/song/songDetail?songId=${list.songId}" class="m-r-sm" data-bjax data-target="#mainContent"><i class="icon-speech"></i></a>               
              </td>
            </tr>
           </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</section>
</body>
</html>