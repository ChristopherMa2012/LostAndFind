<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lostandfind.dao.* "%>
<%@page import="com.lostandfind.model.Info"%>
<%@page import="com.lostandfind.dao.Select"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>L&F | home</title>
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap-theme.min.css"">
    <link href="../css/home.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="../js/jquery-2.2.1.min.js"></script>
     
  </head>
  <body>
 <article >
<nav class="navbar navbar-inverse  navbar-fixed-top">
    <div class="">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navMenu" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand hidden-sm"  href="#">Lost & Find</a>
    </div>  
    <div class="collapse navbar-collapse  " id="navMenu">
      <ul class="nav navbar-nav">
        <li ><a href="#">设为首页</a></li>
        <li><a href="#">收藏本站</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
	        <li >
	             <%
	              HttpSession s=request.getSession(false);
	             if(s.getAttribute("userName")==null){
			       out.println("<a href='../index.html'>登陆");
			       out.println("  </a></li><li class='dropdown'><a id='register' href='./register.html' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>注册</a></li></ul> ");
	             }else{
			    	   out.println("<a id='replaceL' href='#'>欢迎你："+s.getAttribute("userName"));
			    	   out.println("</a></li><li class='dropdown'><a id='logout' href='.dropdown-menu' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>退出</a></li></ul> ");
			       }
			    %>
   
        <form class="navbar-form navbar-right" role="search">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default">搜一下</button>
      </form>
    </div>
    </div>
</nav>
<div class="container">
<div>
   <ul class="nav nav-pills list-group-item">
   <li class="active"><a href="#">首页</a></li>
   <li><a href="#">论坛首页</a></li>
   <li><a href="#">新闻中心</a></li>
   <li><a href="#">网站公告</a></li>
   <li><a href="#">关于我们</a></li>
</ul>
</div>

<div id="slidr-img" >
  <img  data-slidr="one" src="../images/mainPicture.jpg"/>
  <img  data-slidr="two" src="../images/2.jpg"/>
  <img  data-slidr="three" src="../images/3.jpg"/>
</div>
<div>

<div id="info-pulish" >
<div class="row " class="container">
	<div class="col-md-6">
	<a href="infoPublish.jsp">
	   <img class="center-block img-thumbnail" alt="我要寻找" src="../images/lost.jpg">
	   </a>
	   </div>
	   <div  class="col-md-6">
	   <a href="infoPublish.jsp">
	   <img  class="center-block img-thumbnail"  alt="我要归还" src="../images/find.jpg">
	   </a>
	   </div>
   </div>
</div>

	<section class="border-style">
			<div class="row">
				<div class="col-md-6">
						<div class="col-md-12 bg-primary">
						寻物启事
						</div>
					   <div class="col-md-12">
							<ul class="showUl ">
									<%
									Select select = new Select();
									List eventList = select.search("select * from info where eventType='1'");
									if (!eventList.isEmpty()) {
										Iterator<Info> iterator = eventList.iterator();
										for (; iterator.hasNext() == true;) {
											Info info = (Info) iterator.next();
										out.println("<li class=' list-unstyled clearfix'><span class=' pull-left '><a href='infoShow.jsp?infoid="+info.getId()+"'>"
														+ info.getTitle()
														+ "</a></span><span class='pull-right text-primary '>"
														+ info.getPublishDate() + "</span></li>");
										}
									}
									%>
						  </ul>
					</div>
				</div>
				
				
				<div class="col-md-6">
						<div class="col-md-12 bg-primary">
						失物招领
						</div>
						<div class="col-md-12">
							<ul class="showUl ">
								<%
								eventList = select.search("select * from info where eventType='0'");
								if (!eventList.isEmpty()) {
									Iterator<Info> iterator = eventList.iterator();
									for (; iterator.hasNext() == true;) {
										Info info = (Info) iterator.next();
									out.println("<li class='list-unstyled clearfix'><span class='pull-left'><a href='infoShow.jsp?infoid="+info.getId()+"'>"
													+ info.getTitle()
													+ "</a></span><span class='pull-right text-primary'>"
													+ info.getPublishDate() + "</span></li>");
										}
									}
								%>
			               </ul>
						</div>
				</div>
     </div>
	</section>


	
	<footer class="bg-primary" >
	<div class="row">
	<ul >
	    <li class=" list-unstyled  footer-text" >这里是友情链接</li>
	    <li class=" list-unstyled footer-text">这里是警示信息</li>
	    <li class=" list-unstyled footer-text">Copyright ©2016 LostAndFind Platform</li>
	    <li class="list-unstyled footer-text">Powered By ChristopherMa2012 Version 1.0.0</li>
	</ul>
	    </div>
	</footer> 

</div>
</article>

<script type="text/javascript" src="../js/slidr.min.js"></script>
<script type="text/javascript" src="../js/home.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/logout.js"></script>
  </body>
</html>
