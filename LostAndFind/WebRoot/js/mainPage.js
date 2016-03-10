$(function(){
	$("#loginButton").click(
	function(){
		$("#loginPanel").slideDown("slow");
	}		
	)
})



window.onload=function(){
	var account=document.getElementById("input1");
	var password=document.getElementById("input2");
	var tip=document.getElementById("tip");
	var loginPanel=document.getElementById("loginPanel");
	var submitButton=document.getElementById("submitButton");
	var loginButton=document.getElementById("loginButton");
/*	   loginButton.onclick=function(){
		   loginPanel.style.display="inline";
		   account.focus();
		   
	   }*/
	   /*异步验证登陆*/
	
		submitButton.onclick=function(){
			if(account.value==""||password.value=="") { //不能写null，因为这是字符串，不是对象？？
				tip.style.color="white";
				tip.innerHTML="用户名或密码不能为空";
				return false;
			} else{
			var xhr=new XMLHttpRequest();
			xhr.open("GET", "LoginHandler?"+$("#form").serialize(),true);
			xhr.send(null);

		    xhr.onreadystatechange=function(){
			if(xhr.readyState==4){
					if(xhr.responseText=="1"){	
						tip.innerHTML="登陆成功,正在跳转";
						loginPanel.style.display="none";
						window.location.href="home/mainPage.jsp?"+$("#form").serialize();
						/*loginButton.onclick=null;*/
					}else if(xhr.responseText=="0"){
						tip.innerHTML="用户名不存在或密码不正确";		
					}
				}	
		       }
            return false;
			}
			
		}

			/*移除提示信息*/
			function tipRemove(){
				tip.innerHTML="";
			}
			document.getElementById("input1").onfocus=tipRemove;
			document.getElementById("input2").onfocus=tipRemove;
			document.getElementById("cancelButton").onclick=function(){
				 loginPanel.style.display="none";	
				}
		}