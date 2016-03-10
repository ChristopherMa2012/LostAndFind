$(function(){
	var tip=document.getElementById("tip");
	var xhr=new XMLHttpRequest();
	var loginButton=document.getElementById("submitButton");
	$("#submit").click(
	   function(){
			xhr.open("GET", "LoginHandler?"+$("#loginForm").serialize(),false);
			alert($("#loginForm").serialize());
			xhr.send(null);
			return false;
	   })
		    xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
					if(xhr.responseText=="1"){	
						tip.innerHTML="登陆成功,正在跳转";
						window.location.href="home/home.jsp"/*?"+$("#loginForm").serialize()*/;
					}else if(xhr.responseText=="0"){
					/*	tip2.style.color="red";*/
						tip.innerHTML="用户名不存在或密码不正确";		
					}
				}	
		}
	function tipRemove(){
		tip.innerHTML="";
	}
	document.getElementById("input1").onfocus=tipRemove;
	document.getElementById("input2").onfocus=tipRemove;
})


