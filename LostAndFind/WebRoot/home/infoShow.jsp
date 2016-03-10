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
    <title>L&F | infoShow</title>
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
	             if(s.getAttribute("userName")!=null){
			      /*  s.setAttribute("adminAccount", request.getParameter("adminAccount")); */
	               out.println(" <a href='#' id='replaceL'>欢迎你："+request.getSession(false).getAttribute("userName"));
		    	   out.println("  </a></li><li class='dropdown'><a  href='.dropdown-menu' class='dropdown-toggle' id='logout' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>退出</a></li></ul> ");
	             }else{
	            	   out.println("<a href='../index.html' id='login'>登陆");
			    	   out.println("</a></li><li class='dropdown'><a id='register' href='./register.html' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' >注册</a></li></ul>");
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
   <li ><a href="home.jsp">首页</a></li>
   <li class="active"><a href="#">论坛首页</a></li>
   <li><a href="#">新闻中心</a></li>
   <li><a href="#">网站公告</a></li>
   <li><a href="#">关于我们</a></li>
</ul>
</div>
        <div>
        <ol class="col-md-12 breadcrumb">
          <li><a href="#">论坛首页</a></li>
          <li><a href="#">失物招领</a></li>
          <li><a href="#">信息展示</a></li>
        </ol>
        </div>


        <img  class="img-thumbnail img-responsive" alt="这是网站宣传图片" src="../images/mainPicture.jpg" style="width: 100%;"/>
          <%
		Select select = new Select();
          Info info=null;
		List eventList = select.search("select * from info where id="+request.getParameter("infoid"));
		if (!eventList.isEmpty()) {
			Iterator<Info> iterator = eventList.iterator();
			if(iterator.hasNext() == true) {
				info = (Info) iterator.next();
				}
			}%>
   <section class="row" style="margin-top:10px;">
       <div class="col-md-2">
		       <div class="panel panel-info">
		         <div class="panel-heading">
		             <h5 class="title">用户信息 </h5>
		           </div>
		               <div class="panel-body">
		                <h4>
		                <%out.println(info.getUserId());%>   
		               </h4>
	                 </div>
	            
	            </div>
       </div>
       
       <div class="col-md-10">
           <div class=" panel panel-info ">
                 <div class="panel-heading">
                 <h4 class="panel-title"><%out.println(info.getTitle());%></h4>
                  </div>
	            <div class="panel-body">
	               <small><%out.println(info.getPublishDate()); %></small>
	           </div> 
	           <table class="table table-responsive">
	                <tbody>
	                  <tr><td><%out.println(info.getContent()); %></td></tr>
	                </tbody>
	           </table>
               
           </div>       
       </div>
   </section>
   
   
   <section class="row">
       <div class="col-md-12">
          这里是交流编辑框
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
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/logout.js"></script>
  </body>
</html>
