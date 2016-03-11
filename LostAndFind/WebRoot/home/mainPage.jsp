<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lostandfind.dao.* "%>
<%@page import="com.lostandfind.model.Info"%>
<%@page import="com.lostandfind.dao.Select"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>失物招领平台主页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="./css/mainPage.css">
<link rel="stylesheet" type="text/css" href="./css/mainPage-loginPanel.css">
<link rel="stylesheet" type="text/css" href="./css/mainPage-lostandfindPublish.css">
<script  type="text/javascript" src="./js/jquery-2.2.1.min.js"></script>
</head>

<body>
	<article class="main-container"> <header
		class="navigator-bar">
	<div class="navigator-barInner">设为首页</div>
	<div class="navigator-barInner">收藏本站</div>
	<div class="navigator-barInner">注 册</div>
	<div class="navigator-barInner"  id="loginButton">
	  <%
	       HttpSession s=request.getSession(true);
	       s.setAttribute("userName", request.getParameter("userName"));
	       if(s.getAttribute("userName")!=null){
	    	   out.println("欢迎你："+s.getAttribute("userName"));
	       }else{
	    	   out.println("登陆");
	       }
	    %>
     </div>
	</header> 
<!-- 	<script type="text/javascript">
	    var b=document.getElementById("loginButton");
	      if(b.innerHTML()!="登陆")  b.onclick=null;

	    </script> -->
	<section class="title-search-box">
	<div class="title-box">
		<img name="mianPage-titlePicture"
			src="./images/mianPage-titlePicture.jpg" />
	</div>
	<span class="search-box">
	    <input type="text" name="searchBox" />
		<input type="button" name="search" value="查询" />
	</span> 
	</section> 
	<nav id="siteMap">
	<ul id="siteMap-ulClass">
		<li class="liClass">首页</li>
		<li class="liClass">论坛首页</li>
		<li class="liClass">新闻中心</li>
		<li class="liClass">网站公告</li>
		<li class="liClass">关于我们</li>
	</ul>
	</nav> <script type="text/javascript">    //实现导航栏下拉到某个位置时，固定在窗口顶部
       $(function(){                      
    	   $(window).scroll(
    			   function(){
    				   var sitemap=  $("#siteMap");
    	   if($(document).scrollTop()>=130){
    		 sitemap.addClass("navFixed");
   
    	   }else{
    		   sitemap.removeClass("navFixed");
    	   }
    })
/*     $("#siteMap").click(
    		function(){
    			alert($("#siteMap").offset().top);
    		}) */
    })
       </script>
	<div class="advertisement-picture">
		<img alt="这里是网站宣传图片" src="./images/mainPicture.jpg">
	</div>

	<section class="publish-enter"> 
	<span class=" publish-enter-common publish-enter-find"> 
	    <img class="enterPicture" name="find-enterPicture" alt="这是寻物启事入口" src="./images/lost.jpg" />
	</span> 
	<span class=" publish-enter-common publish-enter-lost"> 
	   <img class="enterPicture"  name="lost-enterPicture" alt="这是失物招领入口" src="./images/find.jpg" />
	</span> 
	</section>
	
	 <section class="showContainer">
	<div class="showContainer-find">
		<div class="showTitle">寻物启事</div>
		<ul class="showUl">
			<%
			Select select = new Select();
			List eventList = select.search("select * from info where eventType='1'");
			if (!eventList.isEmpty()) {
				Iterator<Info> iterator = eventList.iterator();
				for (; iterator.hasNext() == true;) {
					Info info = (Info) iterator.next();
				out.println("<li class='showLi'><span class='titleSpan'>"
								+ info.getTitle()
								+ "</span><span class='dateSpan'>"
								+ info.getPublishDate() + "</span></li>");
				}
			}
			%>
		</ul>
	</div>
	<div class="showContainer-lost">
		<div class="showTitle">失物招领</div>
		<ul class="showUl">
			<%
			eventList = select.search("select * from info where eventType='0'");
			if (!eventList.isEmpty()) {
				Iterator<Info> iterator = eventList.iterator();
				for (; iterator.hasNext() == true;) {
					Info info = (Info) iterator.next();
				out.println("<li class='showLi'><span class='titleSpan'>"
								+ info.getTitle()
								+ "</span><span class='dateSpan'>"
								+ info.getPublishDate() + "</span></li>");
					}
				}
			%>
		</ul>
	</div>
	</section>
	
	
	<section id="loginPanel" > <!--  ----------------------------管理员登陆-------------------------------------------------------------------->
	<div id="formContainer" draggable>
		<form id="form" name="loginForm" action="" method="get">
			<div class="commonDiv">
				管理员账号:
				 <input type="text" id="input1" name="adminAccount" class="commonInput" />
			</div>
			<div class="commonDiv">
				管理员密码: 
				<input id="input2" name="adminPassword" type="password" class="commonInput" />
			</div>
			<div id="tip" class="tipStyle"></div>
			<div  id="divSubmit">
				<input id="submitButton" class="button" type="submit" value="登陆" />
				<button id="cancelButton" class="button" type="button">取消</button>
			</div>
			<!-- <div class="commonDiv" id="studentLoginLabel">
				<a id="studentLoginOption" href="">用户登陆</a>
			</div> -->
		</form> 
		</div>
	</section> 
	
	<section id="lostandfind-publish">
	    <table>
	    <tr>
	      <td>  事件类型：</td>
	      <td> 
                   <select class="commonTd" name="eventType"/>
                      <option value="1">丢失</option>
                      <option value="0">归还</option>
                    </select>
                    
            </td>
	    </tr>
	      <tr>
	         <td>丢失/拾到日期：</td>
	         <td><input  id="eventDate"  type="date" name="eventDate"/></td>
	    </tr>
	    <tr>
	       <td>  标      题：</td>
	       <td><input type="text" name="title"  id="title"/></td>
	    </tr>
	    <tr>
	    <td> 事件描述：</td>
	    <td>
	       <textarea rows="6" cols="60"  name="content" id="content"></textarea>
	    </td>
	    </tr>
	    <tr>
	       <td><button id="submitInfo" type="button">提交</button></td>
	       <td><button id="cancelSubmit" type="button">取消</button></td>
	    </tr>
	    </table>
	    <label id="insertSuccess">插入成功！</label>
	    <label id="insertFailed">插入失败! 请重新尝试</label>
	</section>
	<footer class="web-right">
	<div class="friendly-link">这里是友情链接</div>
	<div class="bottom-bar">这里是警示信息</div>
	<div class="web-right-div1">Copyright ©2015 失物招领平台</div>
	<div class="web-right-div2">Powered By ChristopherMa2012 Version
		1.0.0</div>
	</footer> 
	</article>
	 
	
	<script async defer="defer" type="text/javascript" src="./js/mainPage.js"></script> 
	<script async defer="defer" type="text/javascript" src="./js/mainPage-lostandfindPublish.js"></script> 
</body>
</html>
