<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<script>
var pageNum = 1;
var pageSize = 20;
var page = null;
var count = null;
window.onload = function() {
	Date.prototype.pattern = function(fmt) {
		var o = {
			"M+":this.getMonth() + 1, // 月份
			"d+":this.getDate(), // 日
			"h+":this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, // 小时
			"H+":this.getHours(), // 小时
			"m+":this.getMinutes(), // 分
			"s+":this.getSeconds(), // 秒
			"q+":Math.floor((this.getMonth() + 3) / 3), // 季度
			// 毫秒
			"S":this.getMilliseconds()
		};
		var week = {
			"0":"/u65e5",
			"1":"/u4e00",
			"2":"/u4e8c",
			"3":"/u4e09",
			"4":"/u56db",
			"5":"/u4e94",
			"6":"/u516d"
		};
		if (/(y+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		}
		if (/(E+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[this.getDay() + ""]);
		}
		for (var k in o) {
			if (new RegExp("(" + k + ")").test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			}
		}
		return fmt;
	};
	$('#dialog').hide();
	function getData() {
		if (pageNum == page) {
			pageSize = count % 20;
		} else {
			pageSize = 20;
		}
		var t1 = location;
		var value = $('input').first().val();
		var parameterType = $('#parameterType').val();
		var processDefinitionKey, processDefinitionId, processInstanceBusinessKey;
		switch (parameterType) {
			case "processDefinitionKey" :
				processDefinitionKey = value;
				break;
			case "processDefinitionId" :
				processDefinitionId = value;
				break;
			case "processInstanceBusinessKey" :
				processInstanceBusinessKey = value;
				break;
			default :
				;
		}
		$.ajax({
			type:'POST',
			url:"${pageContext.request.contextPath}/AbstractServlet",
			data:{
				"tag":"MethodServlet",
				"method":"queryHistoricProcessInstancesAll",
				"processDefinitionKey":processDefinitionKey,
				"processDefinitionId":processDefinitionId,
				"processInstanceBusinessKey":processInstanceBusinessKey,
				"pageNum":(pageNum - 1) * pageSize,
				"pageSize":pageSize
			},
			dataType:"json",
			success:function(data) {
				$("tbody").empty();
				if (data != null) {
					for (var i = 0; i < data.length; i++) {
						if (pageNum == 1) {
							if (i == data.length - 1) {
								page = data[i].page;
								count = data[i].count;
								break;
							}
						}
						$('tbody').first().append('<tr><td>' + data[i].id + '</td><td>' + data[i].processDefinitionId + '</td><td>' + data[i].startTime
							+ '</td></tr>');
					}
					$('#lblCurent').html(pageNum);
					$('#lblPageCount').html(page);
					$("<td><a class='claim' href='#'  id='showAdList'>查看流程图样式一</a></td>").appendTo($("tbody tr")).css("cursor", "pointer").end();
					$('<td><a class="claim">查询历史流程变量</a></td>').appendTo($("tbody tr")).click(function() {
						var this_ = $(this);
						var processInstanceId = $(this_.siblings()[0]).html();
						$.ajax({
							type:'POST',
							url:"${pageContext.request.contextPath}/AbstractServlet",
							data:{
								"tag":"MethodServlet",
								"method":"queryHistoricVariableInstances",
								"processInstanceId":processInstanceId

							},
							dataType:"json",
							success:function(data) {
								$('tbody').eq(1).empty();

								for (var i = 0; i < data.length; i++) {
									$('tbody').eq(1).append('<tr><td>' + data[i].variableName + '</td><td>' + data[i].value + '</td><td>' + data[i].createTime
										+ '</td><td>' + data[i].lastUpdatedTime + '</td></tr>');
								}
								$('#dialog').dialog({
									bgiframe:true,
									resizable:false,
									modal:true,
									title:'历史流程变量',
									position:['center', 'top'],
									width:'auto',
									overlay:{
										backgroundColor:'#000',
										opacity:0.5
									}
								}).dialog('open');
							}
						});
					}).css("cursor", "pointer").end();
				}
			}
		});
	}

	$('#btn11').click(function() {
		var pageNum = 1;
		getData();
	});
	function diagram(target) {
		/* var processInstanceId = $(target.siblings()[0]).html();
		var processDefinitionId = $(target.siblings()[1]).html();
		window.open(window.location.protocol + '${pageContext.request.contextPath}/diagram-viewer/index.html?processDefinitionId=' + processDefinitionId
			+ '&processInstanceId=' + processInstanceId + ''); */
		$(document).on("click", "#showAdList", function() {
			$('#advertisingPage').empty();
			var url = "";
			var processInstanceId = $(this).parent().parent().children().first().html();
			var processDefinitionId = $(this).parent().parent().children().eq(1).html();
			url = window.location.protocol + '/module-bpm/diagram-viewer/index.html?processDefinitionId=' + processDefinitionId + '&processInstanceId='
				+ processInstanceId + '';
			$('<iframe name = "adPageFrame" src="' + url + ' "width="100%" height="100%" />').appendTo('#advertisingPage');
			$("#advertisingPage").dialog({
				modal:true,
				width:1000,
				height:516,
				position:['center', 'top'],
				title:"流程图"
			});
		});
		$('#btn3').click(function() {
			if (pageNum != page) {
				$('tbody').empty();
				pageNum = pageNum + 1;
				getData();
			}
		});
		$('#btn2').click(function() {
			if (pageNum != 1) {
				$('tbody').empty();
				pageNum = pageNum - 1;
				getData();
			}
		});
		$('#btn5').click(function() {
			var changePage = $('#changePage').val()
			if (changePage <= page) {
				$('tbody').empty();
				pageNum = changePage;
				getData();
			}
		});
		$('#btn1').click(function() {
			$('tbody').empty();
			pageNum = 1;
			getData();

		});
		$('#btn4').click(function() {
			$('tbody').empty();
			pageNum = page;
			getData();
		});
	}
	
	diagram($(this));
}
</script>
<style>
</style>
<body>
	<div id="advertisingPage" class="template"></div>
	<button id="btn11" class="btn btn-primary" class="btn btn-primary" style="margin: 5px 5px 5px 5px">查询历史流程</button>
	<div id="startProcess">
		<div>
			<label>parameterType</label> <select id="parameterType">
				<option>processDefinitionKey</option>
				<option>processDefinitionId</option>
				<option>processInstanceBusinessKey</option>
			</select>
		</div>
		<input type="text" />
	</div>
	<table class="table">
		<caption>基本的表格布局</caption>
		<thead>
			<tr>
				<th>流程实例ID</th>
				<th>流程定义ID</th>
				<th>开始时间</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div id="dialog">
		<table class="table">
			<thead>
				<tr>
					<th>variableName</th>
					<th>variableValue</th>
					<th>createTime</th>
					<th>lastUpdatedTime</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div style="text-align: center; float: left; width: 100%;">
		第[<label id="lblCurent">0</label>]页&nbsp;共[<label id="lblPageCount">0</label>]页 <a class="disable" href="#" id="btn1">首页</a> <a
			class="disable" href="#" id="btn2">上一页</a> <a class="disable" href="#" id="btn3">下一页</a> <a class="disable" href="#" id="btn4">尾页</a> 转到
		<input id="changePage" type="text" size="1" maxlength="4" /> 页 <a class="disable" href="#" id="btn5" class='tz'>跳转</a>
	</div>
</body>
</html>
