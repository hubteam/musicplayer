<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>Heart with Music 心随乐动</title>
  </head>
  <body>
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
                                  <a href="#" class="ok" onclick="myclick('${list.songName}','${list.singer.singerName}','${list.songAddr}','${list.lyricAddr}')"><i class="fa fa-play-circle i-2x" ></i></a>
                                  
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
                                <c:forEach items="${download1.singers }" var="aa">
                                  <a href="#" class="ok" onclick="myclick('${download1.songName}','${aa.singerName}','${download1.songAddr}','${download1.lyricAddr}')">
                                  
                                  </c:forEach>
                                  <i class="fa fa-play-circle i-2x" ></i></a>
                                </div>
                              </div>
                              <c:forEach items="${download1.singers }" var="nnn">
                              <a href="#"><img src="${nnn.singerPictureAddr }" alt="" class="r r-2x img-full"></a>
                              </c:forEach>
                            </div>
                            <div class="padder-v">
                              <a href="${ctx }/song/songDetail?songId=${download1.songId }" class="text-ellipsis" data-bjax data-target="#mainContent">${download1.songName }</a>
                              <c:forEach items="${download1.singers }" var="nn">
                              <a href="${ctx }/song/singerDetail?singerName=${nn.singerName }" class="text-ellipsis text-xs text-muted" data-bjax data-target="#mainContent">${nn.singerName }</a>
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
              </body></html>