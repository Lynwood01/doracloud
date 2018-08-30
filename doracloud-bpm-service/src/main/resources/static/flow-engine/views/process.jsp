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
<title>Insert title here</title>
<script type="text/javascript">
var pageNum = 1;
var pageSize = 20;
var page = null;
var count = null;
window.onload=function (){
	$(document).ready(function(){  
		
		getData(); 
		
	}); 
/* 	$('#cz').live('click',function(){
		alert("1");
	}); */
	$(document).on("click","#cz",function(){
		var method = "";
		var id = $(this).parent().parent().parent().children().eq(0).html();
		
		var cz = $(this).html();
		
		if(cz == "挂起"){
			method = "suspendProcessDefinitionById";
		} else {
			method = "activateProcessDefinitionById";
		}
	 	 $.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : method,
				"id" : id
										
			},	
			
			success : function(data){
				alert(data);
				window.location.reload();
				
			}
		})  
	})
	$(document).on("click",".a",function(){
		var method = "";
		var id = $(this).parent().parent().children().eq(0).html();
	
		alert(key)
	 	 $.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "startProcessInstanceById",
				"id" : id
										
			},	
			
			success : function(data){
				alert(data);
				
			}
		})  
	})
	function getData(){
		if(pageNum == page){
			pageSize = count%20;
		} else {
			pageSize = 20;
		}
		var cz = "";
		$.ajax({
			
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "createProcessDefinitionQuery",
				"pageNum" : (pageNum-1)*pageSize,
				"pageSize" : pageSize							
			},
			dataType : "json",
			success : function(data){
				
				 for(var i=0;i<data.length;i++){
					 if(pageNum == 1){
						if(i == data.length-1){
							
							page = data[i].page;
							count = data[i].count;
							break;
						}
					 }
						if(data[i].isSuspended == false){
							cz = "挂起";
						} else {
							cz = "激活";						
						}
						$('tbody').first().append("<tr><td>"+data[i].id+"</td><td>"+data[i].deploymentId+"</td><td>"+data[i].name+"</td><td>"+data[i].key+"</td><td>"+data[i].version+"</td><td><span>"+data[i].isSuspended+"</span>|<span><a id='cz' href='#'>"+cz+"</a></span></td><td><a class='a' role='button' aria-disabled='false'>启动</a></td>");			}
						
					
				 $('#lblCurent').html(pageNum); 
					$('#lblPageCount').html(page); 
						
					
					 
			}
	})
		
	}
	$('#btn3').click(function(){
		if(pageNum != page){
			$('tbody').empty();
			pageNum = pageNum+1;
			getData()
		}		
	})
	$('#btn2').click(function(){
		if(pageNum != 1){
			$('tbody').empty();
			pageNum = pageNum-1;
			getData()
		}		
	})
	$('#btn5').click(function(){
		var changePage = $('#changePage').val()
		if(changePage <= page){
			$('tbody').empty();
			pageNum = changePage;
			getData()
		}		
	})
$('#btn1').click(function(){
		
			$('tbody').empty();
			pageNum = 1;
			getData()
				
	})
	$('#btn4').click(function(){
		
			$('tbody').empty();
			pageNum = page;
			getData()
				
	})

		
	
}
</script>
<style type="text/css">
table 
  {   border-collapse:   separate;   border-spacing:   10px;   }
.disable{
	
	cursor: default;
	background-color: transparent
}

</style>
<title>Insert title here</title>
</head>
<body>
<table id="jgcsTable" class="listTable" width="100%" cellpadding="1" cellspacing="1"> 
<thead> 
<tr> 
<th> 
流程定义ID
</th> 
<th> 
部署ID
</th> 
<th> 
名称
</th> 
<th> 
KEY
</th> 
<th> 
版本号
</th> 
<th> 
是否挂起
</th> 
<th> 
操作
</th> 
</tr> 
</thead> 
<tbody id="tb_body"> 
</tbody>
</table>
<div style="text-align: center; float: left; width: 100%;"> 
第[<label id="lblCurent" ></label>]页&nbsp;共[<label id="lblPageCount"></label>]页 <a class="disable" href="#" id="btn1">首页</a>
<a class="disable" href="#" id="btn2">上一页</a>
<a  class="disable" href="#" id="btn3">下一页</a>
<a class="disable"  href="#" id="btn4">尾页</a> 
转到
<input id="changePage" type="text" size="1" maxlength="4"/>
页 
<a class="disable" href="#" id="btn5"  class='tz'>跳转</a>
</div>
</body>
</html>