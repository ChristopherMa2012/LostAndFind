    $(function(){     
	        	var xhr=new XMLHttpRequest();
	        	 $("#logout").click(  			 
	        	  function(){  
	        				xhr.open("GET", "../LoginHandler?logout=1",true);
	        				xhr.send(null);
	        				return false;
	        		   })
	        			    xhr.onreadystatechange=function(){
	        				if(xhr.readyState==4){
	        						if(xhr.responseText=="1"){	
	        							$("#replaceL").replaceWith("<a href='../index.html'>登陆</a>");
	        							$("#logout").replaceWith("<a id='register' href='../register.html' class='dropdown-toggle' >注册</a>");
	        						}
	        					}	
	        			}
	         })