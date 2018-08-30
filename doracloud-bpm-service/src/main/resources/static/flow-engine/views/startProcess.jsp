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
<script type="text/javascript">
window.onload=function (){
	$('#btn2').click(function(){
		var processDefinitionKey = $('input').first().val();
		var businessKey = $('input').eq('1').val();
		var userId = $('input').eq('2').val();
		if(processDefinitionKey == null || processDefinitionKey == ""){
			alert("processDefinitionKey不能为空!");
		} else {
			
	
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "startProcessInstanceByKey",
				"processDefinitionKey" : processDefinitionKey,
				"businessKey" : businessKey,
				"userId" : userId
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
<div id="startProcess">
	<div>
		<label>processDefinitionKey</label>
		<input type="text">
	</div>

	<div>
		<label>businessKey</label>
		<input type="text">
	</div>
	
	<div>
		<label>userId</label>
		<input type="text">
	</div>
	<button id="btn2" class="btn btn-primary" style="margin: 5px 5px 5px 5px">startProcess</button>
</div>
</body>
</html>