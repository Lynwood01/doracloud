<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>查看当前流程图</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<script type="text/javascript">
//配置坐标
$(function(){
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/AbstractServlet",
		data:{
			"tag" : "MethodServlet",
			"method" : "getCoordinate",
			"processInstanceId" :<%=request.getParameter("processInstanceId")%>
		},
		dataType:"json",
		success:function(data){
			$(document.body).append("<div style='position: absolute;border:2px solid red;top:"+(data[0].y-1)
			+"px;left:"+(data[0].x-1)+"px;width:"+(data[0].width+1)+"px;height:"+(data[0].height+1)+"px;'></div>");
		}
	});
});

</script>
</head>
<body>
<img style="position: absolute;top: 0px;left: 0px;" 
	 src="${pageContext.request.contextPath}/PicuterServlet?processInstanceId=<%=(String)request.getParameter("processInstanceId")%>">
</body>
</html>