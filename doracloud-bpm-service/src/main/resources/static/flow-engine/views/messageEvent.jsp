<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script>
window.onload=function (){
	$('#btn2').click(function(){
		var messageName = $('input').first().val();
		var executionId = $('input').eq('1').val();
		
		if(messageName == null || messageName == ""){
			alert("messageName不能为空!");
		} else {
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "messageEventReceived",
				"messageName" : messageName,
				"executionId" : executionId
			},
		
			success : function(data) {
				alert(data);
			}
		});
		}
	});
}
</script>
</head>
<body>
<div id="messageEventReceived">
	<div>
		<label>messageName</label>
		<input type="text">
	</div>

	<div>
		<label>executionId</label>
		<input type="text">
	</div>
	
	<button id="btn2" class="btn btn-primary" style="margin: 5px 5px 5px 5px">messageEventReceived</button>
</div>
</body>
</html>