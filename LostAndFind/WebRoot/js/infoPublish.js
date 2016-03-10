$(function() {
	$("#submitInfo").click(
			function() {
				
       if(loginState){
				var flag = true;
				var eventType;
				if($("#eventType1").prop("checked")==true){
					eventType=1;
				}else{
					eventType=0;
				}
				
			/*	if ($("#eventType1").attr("checked")==false&&$("#eventType2").attr("checked") == false)
					flag = false;*/
			/*	if ($("#eventDate").val() == "")
					flag = false;*/
				if ($("#title").val() == "")
					flag = false;
				if ($("#content").val() == "")
					flag = false;
				if (!flag) {
					alert("请输入完整信息再提交");
				} else {
					
					if (eventType == "1") {
						processState = "寻找中"
					} else {
						processState = "招领中"
					}
					var date=new Date();
					var publishDate=date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate();
					$.ajax({
						type : "post",
						async : true,
						url : "../InsertHandler",
						data : "eventType=" + eventType+ "&publishDate="
								+ publishDate+ "&title="
								+ $("#title").val() + "&content="
								+ $("#content").val() + "&processState="
								+ processState+"&userId="+userId,
						success : function(returnValue) {
							$("form").hide();
							if (returnValue) {
								$("#insertSuccess").show();
								setInterval(function() {
									$("#insertSuccess").hide();
									$("form").show();
								},3000);
							} else {
								$("#insertFailed").show();
								setInterval(function() {
									$("#insertFailed").hide();
									$("form").show();
								},000);
							}
						},

					})
				}}else{
					alert("请先登陆再进行信息发布");
				}
			}
			
	);

})