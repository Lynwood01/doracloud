<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script>
window.onload=function (){
	$('#btn1').click(function(){
		//alert('click');
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "queryHistoricProcessInstances",
				"processDefinitionId" : ""
			},
			dataType : "json",
			success : function(data) {
				$("tbody").empty();
				for(var i=0;i<data.length;i++){
					//alert(data[i].name);
					$('tbody').first().append('<tr><td>'+data[i].processInstanceId+'</td><td>'+data[i].processDefinitionId+'</td><td>'+data[i].startTime+'</td></tr>');
					
			          
					//});
				}
				$('<td><a class="claim">查看流程图</a></td>').appendTo($("tbody tr")).click(function(){diagram($(this));}).css("cursor","pointer").end();
			}
	});
	});
	
	$('#btn2').click(function(){
		var processDefinitionKey = $('input').first().val();
		var businessKey = $('input').eq('1').val();
		var userId = $('input').eq('2').val();
		
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/StartProcess",
			data : {
				"processDefinitionKey" : processDefinitionKey,
				"businessKey" : businessKey,
				"userId" : userId
			},
			dataType : "json",
			success : function(data) {
				alert('部署成功');
			}
	});
	});
	
	$('#btn3').click(function(){
		var userId = $('input').eq('3').val();
		
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "queryTaskAssignee",
				//"chooseMethod" : "queryTaskAssignee",
				"userId" : userId
			},
			dataType : "json",
			success : function(data) {
				//alert(data[0].id);
				//for(var i=data.length())
				//alert(data.length);
				//alert($("tbody tr").eq(2).html());
				$("tbody").empty();
				for(var i=0;i<data.length;i++){
					//alert(data[i].name);
					$('tbody').first().append('<tr><th>'+data[i].id+'</th><th>'+data[i].name+'</th></tr>');
					
			          
					//});
				}
				$('<th><a class="approve">通过</a></th>').appendTo($("tbody tr")).click(function(){approve($(this));}).css("cursor","pointer").end();
				$('<th><a class="refuse">退回</a></th>').appendTo($("tbody tr")).click(function(){alert("refuse");}).css("cursor","pointer").end();
			}
	});
	});
	
	$('#btnQueryTaskCandidate').click(function(){
		var userId = $('input').eq('3').val();
		
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "queryTaskCandidate",
				//"chooseMethod" : "queryTaskAssignee",
				"userId" : userId
			},
			dataType : "json",
			success : function(data) {
				//alert(data[0].id);
				//for(var i=data.length())
				//alert(data.length);
				//alert($("tbody tr").eq(2).html());
				$("tbody").empty();
				for(var i=0;i<data.length;i++){
					//alert(data[i].name);
					$('tbody').first().append('<tr><th>'+data[i].id+'</th><th>'+data[i].name+'</th></tr>');
					
			          
					//});
				}
				$('<th><a class="claim">签收任务</a></th>').appendTo($("tbody tr")).click(function(){claim($(this));}).css("cursor","pointer").end();
			}
	});
	});
	
	$('#btnComplete').click(function(){
		var userId = $('input').eq('4').val();
		var taskId = $('input').eq('5').val();
		
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/Complete",
			data : {
				"userId" : userId,
				"taskId" : taskId
			},
			dataType : "json",
			success : function(data) {
				//alert(data[0].id);
				//for(var i=data.length())
				//alert(data.length);
				/*for(var i=0;i<data.length;i++){
					//alert(data[i].name);
					$('tbody').first().append('<tr><th>'+data[i].id+'</th><th>'+data[i].name+'</th></tr>');
				}*/
			}
	});
	});
	
	
	//$(".approve").on('click', function() {   alert("Live handler called.");  });
	function approve(target){
		//alert($(target.siblings()[0]).html());
		var userId = 'wulianlong';
		var taskId = $(target.siblings()[0]).html();
		var condition = $('#condition').val();
		//alert(condition);
		//alert('function approve');
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/Complete",
			data : {
				"userId" : userId,
				"taskId" : taskId,
				"condition": condition
			},
			dataType : "json",
			success : function(data) {
				alert('审批通过');
				$(target).parent("tr").remove();
			}
	});
	}
	
	
	function claim(target){
		//alert($(target.siblings()[0]).html());
		var userId = 'wulianlong';
		var taskId = $(target.siblings()[0]).html();
		//alert('function approve');
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "claim",
				"userId" : userId,
				"taskId" : taskId
			},
			dataType : "json",
			success : function(data) {
				alert('签收成功');
				$(target).parent("tr").remove();
			}
	});
	}
	
	function diagram(target){
		//alert($(target.siblings()[0]).html());
		var userId = 'wulianlong';
		var processInstanceId = $(target.siblings()[0]).html();
		var processDefinitionId = $(target.siblings()[1]).html();
		window.open('window.location.protocol/activiti-explorer/diagram-viewer/index.html?processDefinitionId='+processDefinitionId+'&processInstanceId='+processInstanceId+'');
		//alert('function approve');
		/*$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "claim",
				"userId" : userId,
				"taskId" : taskId
			},
			dataType : "json",
			success : function(data) {
				alert('签收成功');
				$(target).parent("tr").remove();
			}
	});*/
	}
		  
			
}
</script>
<body>
<h3>历史查询</h3>
<div id="div1"><%=session.getAttribute("username")%></div>

<button id="btn1" class="btn btn-primary"  class="btn btn-primary" style="margin: 5px 5px 5px 5px">deploy</button>
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
	<button id="btn2">startProcess</button>
</div>

<div id="queryTaskAssignee">
	<div>
		<label>userId</label>
		<input type="text" value="wulianlong">
	</div>
	<button id="btn3">queryTaskAssignee</button>
</div>

<div id="queryTaskCandidate">
	<div>
		<label>userId</label>
		<input type="text" value="wulianlong">
	</div>
	<button id="btnQueryTaskCandidate">queryTaskCandidate</button>
</div>

<div id="complete">
	<div>
		<label>userId</label>
		<input type="text">
	</div>
	<div>
		<label>taskId</label>
		<input type="text">
	</div>
	<div>
		<label>condition</label>
		<select id="condition">
			<option>deptLeaderPass</option>
			<option>hrPass</option>
		</select>
	</div>
	<button id="btnComplete">complete</button>
</div>

<table class="table">
   <caption>基本的表格布局</caption>
   <thead>
      <tr>
         <th>processInstanceId</th>
         <th>processDefinitionId</th>
         <th>startTime</th>
      </tr>
   </thead>
   <tbody>
   <!--    <tr>
         <td>Tanmay</td>
         <td>Bangalore</td>
      </tr>
      <tr>
         <td>Sachin</td>
         <td>Mumbai</td>
      </tr>          -->
   </tbody>
</table>

</body>
</html>
