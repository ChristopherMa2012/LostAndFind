$(function(){
	var tip=document.getElementById("tip");
	var xhr=new XMLHttpRequest();
	var loginButton=document.getElementById("submitButton");
	$("#submit").click(
	   function(){
		   var str=decodeURIComponent($("#registerForm").serialize(),true);
		   alert($("#registerForm").serialize());
			xhr.open("GET", "RegisterHandler?"+str,false)
			xhr.send(null);
			return false;
	   })
		    xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
					if(xhr.responseText=="1"){	
						tip.innerHTML="注册成功 ^-^ ,正在跳转到登陆页面...";
						window.location.href="index.html"/*?"+$("#loginForm").serialize()*/;
					}else if(xhr.responseText=="0"){
					/*	tip2.style.color="red";*/
						tip.innerHTML="注册失败，麻烦再试一次 @_@ ";		
					}
				}	
		}
})


