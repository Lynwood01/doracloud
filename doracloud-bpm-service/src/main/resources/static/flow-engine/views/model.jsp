<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/plupload.full.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<script type="text/javascript">
var pageNum = 1;
var pageSize = 20;
var page = null;
var count = null
// 上传文件类型错误时的code
var FILE_EXTENSION_ERROR = -601;
// 文件重复上传
var FILE_DUPLICATE_ERROR = -602;
window.onload = function() {
	// 上传对话框
	$('#upload').click(function() {
		$('#uploadFile,#choseFile').show();
		$('#dialog').dialog({
			autoOpen:true,
			height:300,
			width:700,
			modal:true,
			show:{
				effect:"blind",
				duration:1000
			},
			hide:{
				effect:"explode",
				duration:1000
			},
			close:function() {
				// 清除上次的记录
				$('#content').empty();
				// 清空原数据
				$('#table').empty();
				// 刷新table的数据
				getData();
			}
		});
	});
	// 隐藏按钮
	$('#uploadFile,#choseFile').hide();
	// 设置button的样式
	$('#uploadFile,#choseFile,#upload,#create').button({
		icons:{
			primary:"ui-icon-locked"
		}
	});
	$('button').css({
		"font-size":"12px",
		"padding":"0px 10px 0px 0px",
		"margin":"5px 2px 5px 0px"
	});
	$('#create').click(function() {
		$('#createModelTemplate').dialog({
			autoOpen:true,
			modal:true,
			width:500,
			buttons:[{
					text:'创建',
					click:function() {
						if (!$('#name').val()) {
							alert('请填写名称！');
							$('#name').focus();
							return;
						}
						setTimeout(function() {
							$('#createModelTemplate').dialog('close');
							$('#table').empty();
							// 刷新table的数据
							getData();
						}, 1000);
						$.ajax({
							type:"POST",
							url:window.location.protocol + "${pageContext.request.contextPath}/AbstractServlet",
							data:{
								"tag":"MethodServlet",
								"method":"newModel",
								"name":$('#name').val(),
								"key":$('#key').val(),
								"description":$('#description').val()
							},
							success:function(data) {
								window.open(window.location.protocol + "${pageContext.request.contextPath}/modeler.action?modelId=" + data);
							}
						})
					}
				}]
		});
	});
	// start
	var uploader = new plupload.Uploader({ // 实例化一个plupload上传对象
		browse_button:'choseFile',
		filters:{
			mime_types:[ // 只允许上传bpmn文件
			{
					title:"bpmn",
					extensions:"bpmn"
				}],
			prevent_duplicates:true
			// 不允许选取重复文件
		},
		url:'${pageContext.request.contextPath}/UploadBpmnServlet',
		flash_swf_url:'js/Moxie.swf',
		silverlight_xap_url:'js/Moxie.xap'
	});
	uploader.init(); // 初始化
	// 绑定文件添加进队列事件
	uploader.bind('FilesAdded', function(uploader, files) {
		for (var i = 0, len = files.length; i < len; i++) {
			var file_name = files[i].name; // 文件名
			// 构造html来更新UI
			var html = '<li id="file-' + files[i].id + '"><p class="file-name">' + file_name
				+ '</p><p style="width:0px; height:15px;" class="progress"  align="center"><span class="perecent" style="font-size:12px"></span></p></li>';
			$(html).appendTo('#content');
		}
	});
	// 绑定文件错误时的事件
	uploader.bind('Error', function(uploader, errObject) {
		if (errObject.code == FILE_EXTENSION_ERROR) {
			alert("文件类型不符合要求");
		}
		if (errObject.code == FILE_DUPLICATE_ERROR) {
			alert("文件重复上传");
		}
	});
	// 绑定文件上传进度事件
	uploader.bind('UploadProgress', function(uploader, file) {
		$('#file-' + file.id + ' .progress').css({
			'width':file.percent + '%',
			"background":"#4876FF"
		});// 控制进度条
		$('#file-' + file.id + ' .perecent').html(file.percent + "%");
		if (file.percent == 100) {
			$('#file-' + file.id + ' .perecent').html("完成上传");
		}
	});
	$('#uploadFile').click(function() {
		// 开始上传
		uploader.start();
	});
	// end
	$(document).on("click", "#bj", function() {
		var id = $(this).parent().parent().children().eq(0).html()
		window.open(window.location.protocol + "${pageContext.request.contextPath}/modeler.action?modelId=" + id);
	})
	$(document).on("click", "#sc", function() {
		var id = $(this).parent().parent().children().eq(0).html()
		if (confirm("你确定要删除吗？")) {
			$.ajax({
				type:"POST",
				url:window.location.protocol + "${pageContext.request.contextPath}/AbstractServlet",
				data:{
					"tag":"MethodServlet",
					"method":"deleteModel",
					"id":id

				},
				success:function(data) {
					$('#table').empty();
					// 刷新table的数据
					getData();
				}
			})
		}
	});

	$(document).on("click", "#bs", function() {
		var id = $(this).parent().parent().children().eq(0).html()
		$.ajax({
			type:"POST",
			url:window.location.protocol + "${pageContext.request.contextPath}/AbstractServlet",
			data:{
				"tag":"MethodServlet",
				"method":"createDeployment",
				"modelId":id
			},
			success:function(data) {
				alert(data);
			}
		});
	})
	$(document).on("click", "#dc", function() {
		var id = $(this).parent().parent().children().eq(0).html()
		var filename = $(this).parent().parent().children().eq(2).html()
		window.location.href = "${pageContext.request.contextPath}/UploadServlet?modelId=" + id + "&filename=" + filename + "&type=2";
	});
	// 查看
	$(document).on("click", "#ck", function() {
		var id = $(this).parent().parent().children().eq(0).html()
		var filename = $(this).parent().parent().children().eq(2).html()
		window.open("${pageContext.request.contextPath}/UploadServlet?modelId=" + id + "&filename=" + filename + "&type=1");
	});

	$(document).ready(function() {
		getData();
	});
	function getData() {
		/* if (pageNum == page) {
			pageSize = count % 20;
		} else {
			pageSize = 20;
		} */

		$.ajax({
			type:'POST',
			url:window.location.protocol + "${pageContext.request.contextPath}/AbstractServlet",
			data:{
				"tag":"MethodServlet",
				"method":"createModelQuery",
				"pageNum":(pageNum - 1) * pageSize,
				"pageSize":pageSize
			},
			dataType:"json",
			success:function(data) {

				for (var i = 0; i < data.length; i++) {
					if (pageNum == 1) {
						if (i == data.length - 1) {
							page = data[i].page;
							count = data[i].count;
							break;
						}
					}
					$('tbody')
						.first()
						.append("<tr><td>"
							+ data[i].id
							+ "</td><td>"
							+ data[i].key
							+ "</td><td>"
							+ data[i].name
							+ "</td><td>"
							+ data[i].version
							+ "</td><td>"
							+ data[i].createTime
							+ "</td><td>"
							+ data[i].lastUpdateTime
							+ "</td><td>"
							+ data[i].metaInfo
							+ "</td><td><a id='bj' href='#'>编辑</a><a id='bs' href='#'>部署</a><a id='sc' href='#'>删除</a></td></tr>");
				}
				$('#lblCurent').html(pageNum);
				$('#lblPageCount').html(page);
			}
		});
	}
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
	})
}
</script>
<style type="text/css">
table {
	border-collapse: separate;
	border-spacing: 10px;
}
a {
	margin-right: 10px;
}
.template {
	display: none;
}
</style>
<title>Model</title>
</head>
<body>
	<div style="text-align: right; margin-right: 10px">
		<button id="upload">导入</button>
		<button id="create">创建</button>
	</div>
	<table width="100%" class="need-border" cellpadding="1" cellspacing="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>KEY</th>
				<th>Name</th>
				<th>Version</th>
				<th>创建时间</th>
				<th>最后更新时间</th>
				<th>元数据</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="table">
		</tbody>
	</table>
	<div style="text-align: center; float: left; width: 100%;">
		第[<label id="lblCurent">0</label>]页&nbsp;共[<label id="lblPageCount">0</label>]页 <a href="#" id="btn1">首页</a> <a href="#" id="btn2">上一页</a>
		<a href="#" id="btn3">下一页</a> <a href="#" id="btn4">尾页</a> 转到 <input id="changePage" type="text" size="1" maxlength="4" /> 页 <a href="#"
			id="btn5" class='tz'>跳转</a>
	</div>
	<div id="createModelTemplate" title="创建模型" class="template">
		<form id="modelForm" action="" target="" method="post">
			<table>
				<tr>
					<td>名称：</td>
					<td><input id="name" name="name" type="text" /></td>
				</tr>
				<tr>
					<td>KEY：</td>
					<td><input id="key" name="key" type="text" /></td>
				</tr>
				<tr>
					<td>描述：</td>
					<td><textarea id="description" name="description" style="width: 300px; height: 50px;"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dialog" title="上传BPMN文件">
		<div id="head" align="center">
			<button id="choseFile">选择上传文件</button>
			<button id="uploadFile">上传</button>
		</div>
		<div id="content"></div>
	</div>
</body>
</html>