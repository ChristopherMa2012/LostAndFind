<%@page import="com.lostandfind.dao.UserGet"%>
<%@page import="com.lostandfind.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>L&F infoPublish</title>
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap-theme.min.css"">
    <link href="../css/home.css" rel="stylesheet">
    <link href="../css/radio.css" rel="stylesheet" />
    <link href="../css/labelauty.css" rel="stylesheet" />
  
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
     
  </head>
 <body>
 <article >
<nav class="navbar navbar-inverse navbar-fixed-top">
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
    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="nav navbar-nav">
        <li ><a href="#">设为首页</a></li>
        <li><a href="#">收藏本站</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
	        <li>
	          <%
	          Object userNameObject=request.getSession(false).getAttribute("userName");
	          if(userNameObject!=null){
	        	  User user=null;
	        	 List userList=new UserGet().search( (String) userNameObject);
	              if(!userList.isEmpty()){
	            	  Iterator<User> iterator=userList.iterator();
	            	  user=(User)iterator.next();
	              }
		    	   out.println(" <a href='#' id='replaceL'>欢迎你："+request.getSession(false).getAttribute("userName"));
		    	   out.println("  </a></li><li class='dropdown'><a  href='.dropdown-menu' class='dropdown-toggle' id='logout' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>退出</a></li></ul> ");
				   out.println("<script type='text/javascript'>");
				   out.println(" var loginState=true;var userId="+user.getId()+";");
				   out.println(" </script>"); 
		       }else{
		    	   out.println("<a href='../index.html' id='login'>登陆");
		    	   out.println("</a></li><li class='dropdown'><a id='register' href='./register.html' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' >注册</a></li></ul>");
		    	   out.println("<script type='text/javascript'>");
		    	   out.println("alert('请先登陆再进行信息发布');");
				   out.println("var loginState=false;");
				   out.println("</script>");
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
   <li class="active"><a href="home.jsp" >首页</a></li>
   <li><a href="#">论坛首页</a></li>
   <li><a href="#">新闻中心</a></li>
   <li><a href="#">网站公告</a></li>
   <li><a href="#">关于我们</a></li>
</ul>
</div>
      <section class="row table-responsive">
       <div class="col-md-12" style="height: 550px">
         <form action="#" method="post" > 
         <table class="table-responsive table">
             <caption class="col-md-12 text-center"><h3>信息发布</h3></caption>
             <tbody class="col-md-12 center-block">
                 <tr style="height:50px">
	                 <td class="col-md-5 text-right text-info"  >
	                      <small> 事件类型：</small>
	                 </td>
	                 <td class="col-md-7 " style="padding: 0;padding-left: 30px;">
	                         <div class="rdo col-md-6 " style="display: inline-block;">
						        <input id="eventType1" type="radio" name="eventType" class="rdolist"  value="1" style="height: 30px;"/>
						        <label  class="rdobox" name="eventType" >
						            <span class="check-image"></span>
						            <span class="radiobox-content" >寻找</span>
						        </label>
						        <input id="eventType2" type="radio" name="eventType" class="rdolist"  value="0"/>
						        <label   class="rdobox" name="eventType" >
						            <span class="check-image"></span>
						            <span class="radiobox-content"  >归还</span>
						        </label>
					        </div>  
	                 </td>
                 </tr>
                  <!--  <td class="text-right col-md-5 text-info">
	                   <small>丢失/拾到时间:</small>
	                 </td>
	                 <td class=" col-md-7" style="padding-left: 22px;">
	                     <input  id="eventDate"  type="date" name="eventDate"/>
	                 </td> -->
                 <tr>
                   <td class="text-right col-md-5 text-info">
	                 <small>概述：</small>
             
	                 </td>
	                 <td class=" col-md-7" style="padding-left: 22px;">
	                   <input type="text" name="title"  id="title"/>
	                 </td>
                 </tr>
                 <tr>
                   <td class="text-right col-md-5 text-info">
	                   <small>事件描述：</small>    
	                 </td>
	                 <td class=" col-md-7" style="padding-left: 22px;">
	                 <textarea class="" rows="5" cols="40" name="content" id="content"></textarea>
	                 </td>
                 </tr>
                 <tfoot>
                 <tr>
                        <td colspan="1">
                        <div style="margin-left: 40%;">
	                  <button class="btn btn-primary btn-lg " id="submitInfo" type="button">提交</button>
	                  <button class="btn btn-primary btn-lg"   type="reset">重置</button>
	                  </div>
	                  </td >
	                  <td></td>
	                  </tr>
	             </tfoot>
             </tbody>
         </table>  
         </form>  
         	
	     <div class="col-md-12 bg-success" style="height: 50px;display: none;" id="insertSuccess">
	        <p class="text-success center-block"><strong>插入成功!</strong></p>
	    </div>
          <div class="col-md-12 bg-danger" style="height: 50px;display: none;" id="insertFailed">
	        <p class="text-danger center-block"><strong>插入失败!</strong></p>
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
<script src="../js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="../js/slidr.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/labelauty.js"></script>
<script src="../js/infoPublish.js"></script>
<script src="../js/logout.js"></script>

</article>
  </body>
</html>
