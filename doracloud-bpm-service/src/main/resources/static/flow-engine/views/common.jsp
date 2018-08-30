<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String
			contextPath = "'" + request.getContextPath() + "'";
	//String userId = request.getSession().getAttribute("userId").toString();
	request.getSession().setAttribute("username", "未登录");
	request.getSession().setAttribute("userId", 1);
%>
<script type="text/javascript">
	var path = <%=contextPath%>;
	<%-- var userId = <%=userId%>; --%>
</script>

