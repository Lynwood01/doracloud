<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/user.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<script type="text/javascript">
//记录当前页
var currentPage = 1;
//处理翻页
function fliover(page){

	//alert(page);
	currentPage = page;
	$.ajax({
		type : 'POST',
		url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
		data : {
			"tag" : "MethodServlet",
			"method" : "queryGroupList",
			"page":page-1,
			"size":$("#sel").val()
			
		},
		dataType : "json",
		success : function(data) {
			//alert(JSON.stringify(data));
			$("tbody").empty();
			$("li").remove(".active");
			var username = "<%=session.getAttribute("username")%>";
			//总条数
			var num = data[data.length-1].count;
			$('#page').html("共"+num+"条数据");
			var pageCount =Math.ceil(num/$("#sel").val());    //向上整除 4/3=2;
			//动态生成li
			$("#sf").after("<li class='active' ><a href='javascript:void(0)' onclick='fliover("+pageCount+")'>"+pageCount+"</a></li>");
			for(var i=0;i<pageCount-1;i++){
				$("#sf").after("<li class='active' ><a href='javascript:void(0)' onclick='fliover("+(pageCount-i-1)+")'>"+(pageCount-i-1)+"</a></li>");
			}
			for(var i=0;i<data.length-1;i++){
				
				$('tbody')
				.first()
				.append(
						"<tr><td class='prop-id'>"
								+ (data[i].id == null?"":data[i].id)
								+ "</td><td class='prop-name'>"
								+ (data[i].name == null?"":data[i].name)
								+ "</td><td class='prop-type'>"
								+ (data[i].type == null?"":data[i].type)
								+ "</td><td><a class='btn btn-danger btn-small' href='#'><i class='icon-remove'></i>删除</a> <a class='btn btn-info btn-small edit-user' data-id='' href='#' ><i class='icon-pencil'></i>编辑</a></td>"
								+ "</td></tr>");
			}
			//加样式
			$(".active").each(function(i){
				if(page == $(this).text()){
					$(this).find("a").css({ "color": "blue"});
				}
			});
		}
});
}
	$(function() {
		//新增和保存
		$("#bc").click(function(){
			var p = $(this);
			if($.trim(p.text())=="新增"){
				$('#groupId').attr('disabled', false);
				$("#groupId").val("");
				$('#groupName').val("");
				p.html("<i class='icon-ok-sign'></i>保存");
				
			}
			else{
				var groupId = $('#groupId').val();
				var groupName = $('#groupName').val();
				var groupType = $('#groupType').val();
				if(groupId == ""){
					alert("请输入组ID");
				}else {
					$.ajax({
						type : 'POST',
						url : window.location.protocol + "${pageContext.request.contextPath}/AbstractServlet",
						data : {
							"tag" : "MethodServlet",
							"method" : "createGroup",
							"groupId" : groupId,
							"groupName" : groupName,
							"groupType" : groupType

						},
						success : function(status) {
							/* window.location.reload(); */
							alert(status.split(":")[1]);
							if (status.split(":")[0] != "1") {
								p.html("<i class='icon-ok-sign'></i>新增");
								//加载首页
								fliover(1);
							}
						}
					})
				}
			}
		});
		//首页和末页处理
		$("#sy").click(function(){
			fliover(1);
		});
		$("#my").click(function(){
			var page = $(".active").last().children().html();
			fliover(page);
		});
		//上下翻页
		$("#up").click(function(){
			if((currentPage-1) >1){
				fliover(currentPage-1);
			}
			else{
				fliover(1);
			}
		});
		$("#down").click(function(){
			var page = $(".active").last().children().html();
			if((currentPage+1) < page){
				fliover(currentPage+1);
			}
			else{
				fliover(page);
			}
		});
		//select
		$("#sel").change(function(){
			var val = $("#sel").find("option:selected").val();
			fliover(1);
		});
		
		$(document).ready(function(){
			//加载首页
			fliover(1);
		});
		
		$('#xz').click(function() {
			var groupId = $('#groupId').val();
			var groupName = $('#groupName').val();
			var groupType = $('#groupType').val();

			$.ajax({
				type : 'POST',
				url : window.location.protocol + "${pageContext.request.contextPath}/AbstractServlet",
				data : {
					"tag" : "MethodServlet",
					"method" : "createGroup",
					"groupId" : groupId,
					"groupName" : groupName,
					"groupType" : groupType

				},
				success : function(status) {
					/* window.location.reload(); */
					alert(status);
					//加载首页
					fliover(1);
				}
			})

		});
		$('#xg').click(function() {
			var groupId = $('#groupId').val();
			if(groupId == ""){
				alert("请选择要编辑的组信息");
			}else{
				var groupName = $('#groupName').val();
				var groupType = $('#groupType').val();
				$.ajax({
					type : 'POST',
					url : window.location.protocol + "${pageContext.request.contextPath}/AbstractServlet",
					data : {
						"tag" : "MethodServlet",
						"method" : "editGroup",
						"groupId" : groupId,
						"groupName" : groupName,
						"groupType" : groupType

					},
					success : function(data) {
						/* window.location.reload(); */
						alert(data);
						//加载当前页
						fliover(currentPage);
					}
				})
			}
		});
		$('#cz').click(function() {
			$("#groupId").removeAttr("disabled");
			$("input[type=reset]").trigger("click");
		})

		$(document).on("click", ".edit-user", function() {

			var groupId = $(this).parent().parent().children().first().html();
			var groupName = $(this).parent().parent().children().eq(1).html();

			var groupType = $(this).parent().parent().children().eq(2).html();

			$('#groupId').val(groupId);
			$('#groupName').val(groupName);
			$('#groupType').val(groupType);

			$('#groupId').attr('disabled', "true");

		});
		$(document).on("click", ".btn-danger", function() {
			//获取当前行
			var parent = $(this).parent().parent();
			var groupId = parent.children().first().html();
			if (confirm("你确定要删除吗？")) {
			$.ajax({
				type : 'POST',
				url : window.location.protocol + "${pageContext.request.contextPath}/AbstractServlet",
				data : {
					"tag" : "MethodServlet",
					"method" : "deleteGroup",
					"groupId" : groupId,

				},
				success : function() {
					/* window.location.reload(); */
					alert("删除成功!");
					//加载首页
					fliover(currentPage);
				}
				});
			}
		});
	});
</script>
<body>
	<div class="row">
		<div class="span8">
			<fieldset>
				<legend>
					<small>组列表</small>
				</legend>
				<table width="100%"
					class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>组ID</th>
							<th>组名称</th>
							<th>类型</th>
							<th width="140">操作</th>
						</tr>
					</thead>
					<tbody>

						<!-- <tr id="">
							<td class="prop-id"></td>
							<td class="prop-name"></td>
							<td class="prop-type">security-role</td>
							<td><a class="btn btn-danger btn-small"
								href="/kft-activiti-demo/management/identity/group/delete/"><i
									class="icon-remove"></i>删除</a> <a
								class="btn btn-info btn-small edit-group" data-id="" href="#"><i
									class="icon-pencil"></i>编辑</a></td>
						</tr>

						<tr id="admin">
							<td class="prop-id">admin</td>
							<td class="prop-name">管理</td>
							<td class="prop-type">security-role</td>
							<td><a class="btn btn-danger btn-small"
								href="/kft-activiti-demo/management/identity/group/delete/admin"><i
									class="icon-remove"></i>删除</a> <a
								class="btn btn-info btn-small edit-group" data-id="admin"
								href="#"><i class="icon-pencil"></i>编辑</a></td>
						</tr>

						<tr id="user">
							<td class="prop-id">user</td>
							<td class="prop-name">用户</td>
							<td class="prop-type">security-role</td>
							<td><a class="btn btn-danger btn-small"
								href="/kft-activiti-demo/management/identity/group/delete/user"><i
									class="icon-remove"></i>删除</a> <a
								class="btn btn-info btn-small edit-group" data-id="user"
								href="#"><i class="icon-pencil"></i>编辑</a></td>
						</tr> -->

					</tbody>
				</table>





				<div class="pagination pagination-centered">
					<ul>
						<li class="disabled"><a id="page"></a></li>
						<li class="disabled"><a href="#" id="sy">&lt;&lt;</a></li>
						<li class="disabled" id='sf'><a href="#" id="up">&lt;</a></li>
						<li class="disabled"><a href="#" id="down">&gt;</a></li>
						<li class="disabled"><a href="#" id="my">&gt;&gt;</a></li>
						<li class="disabled"><a style="height: 30px">条数：
						<select id="sel" style="height: 20px; width: 50px; margin-bottom: 0px; margin-top: 2px; padding: 0px;" >
											<option value="5" selected="selected">5</option>
											<option value="10">10</option>
											<option value="20">20</option>
											<option value="50">50</option>
											<option value="100">100</option>
											</select></a></li>
					</ul>
				</div>
			</fieldset>
		</div>
		<div class="span4">
			<form action="/kft-activiti-demo/management/identity/group/save"
				class="form-horizontal" method="post">
				<input type="hidden" name="id" />
				<fieldset>
					<legend>
						<small>新增/编辑组</small>
					</legend>
					<div id="messageBox" class="alert alert-error input-large controls"
						style="display: none">输入有误，请先更正。</div>
					<div class="control-group">
						<label for="groupId" class="control-label" style="width: 80px">组ID:</label>
							<input type="text" id="groupId" name="groupId" disabled="disabled" style="height: 28px"  class="required" />
					</div>
					<div class="control-group">
						<label for="groupName" class="control-label" style="width: 80px">组名:</label>
							<input type="text" id="groupName" name="groupName" style="height: 28px"
								class="required" />
					</div>
					<div class="control-group">
						<label for="type" class="control-label" style="width: 80px">组类型:</label>
							<select name="type" id="groupType" class="required">
								<option value="security-role">安全角色</option>
								<option value="assignment">功能角色</option>
							</select>
					</div>
					<div class="form-actions" style="display:inline;padding: 5px 0px 10px 0px;height: 90px">
						<label class="control-label" style="width: 80px"></label>
						<button type="reset" class="btn" id="cz">
							<i class="icon-remove"></i>重置
						</button>
						<button type="button" class="btn btn-primary" id="bc">
							<i class="icon-ok-sign"></i>新增
						</button>
						<button type="button" class="btn btn-primary" id="xg">
							<i class="icon-ok-sign"></i>修改
						</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>