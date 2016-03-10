$(function() {
	$(".enterPicture").click(function() {
		$("#lostandfind-publish").show("slow");
	});
	$("#cancelSubmit").click(function() {
		$("#lostandfind-publish").hide("slow");
	});
	

	
	$("#submitInfo").click(
			function() {
				var flag = true;
				if ($("#eventDate").val() == "")
					flag = false;
				if ($("#title").val() == "")
					flag = false;
				if ($("#content").val() == "")
					flag = false;
				if (!flag) {
					alert("请输入完整信息再提交");
				} else {
					if ($("select").val() == "1") {
						processState = "寻找中"
					} else {
						processState = "招领中"
					}
					$.ajax({
						type : "post",
						async : true,
						url : "InsertHandler",
						data : "eventType=" + $("select").val() + "&eventDate="
								+ $("#eventDate").val() + "&title="
								+ $("#title").val() + "&content="
								+ $("#content").val() + "&processState="
								+ processState,
						success : function(returnValue) {
							$("table").hide();
							if (returnValue) {
								$("#insertSuccess").show();
								setInterval(function() {
									$("#lostandfind-publish").hide();
									window.location.reload();
								},1000);
							} else {
								$("#insertFailed").show();
								setInterval(function() {
									$("#lostandfind-publish").show();
								},1000);
							}
						},

					})
				}
			});

})