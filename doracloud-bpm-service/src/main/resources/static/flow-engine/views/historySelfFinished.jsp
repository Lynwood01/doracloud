<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
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
window.onload=function (){
         

	//alert(new Date(parseInt('1453959556223') ).toLocaleString().replace(/:\d{1,2}$/,' '));
/* 	alert(new Date(parseInt('1453959556223')).pattern('yyyy年MM月dd日')); */
	$('#dialog').hide();
	function getData(){
		if(pageNum == page){
			pageSize = count%20;
		} else {
			pageSize = 20;
		}
		var t1=location;
		//alert(window.location.port);
		//alert('click');

	
	
	
		$.ajax({
			type : 'POST',
			url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
			data : {
				"tag" : "MethodServlet",
				"method" : "queryHistoricProcessInstancesByInitiatorFinished",
			
				"pageNum" :(pageNum-1)*pageSize,
				"pageSize" : pageSize
			},
			dataType : "json",
			success : function(data) {
				$("tbody").empty();
				if(data != null){
					
		
				for(var i=0;i<data.length;i++){
					//alert(data[i].name);
					if(pageNum == 1){
					if(i == data.length-1){
						page = data[i].page;
						count = data[i].count;
					
						break;
					}
					}
					$('tbody').first().append('<tr><td>'+data[i].id+'</td><td>'+data[i].processDefinitionId+'</td><td>'+data[i].startTime+'</td></tr>');
					
			          
					//});
				}
				$('#lblCurent').html(pageNum); 
				$('#lblPageCount').html(page); 
				$("<td><a class='claim' href='#'  id='showAdList'>查看流程图</a></td>").appendTo($("tbody tr")).css("cursor","pointer").end();
				$('<td><a class="claim">查询历史流程变量</a></td>').appendTo($("tbody tr")).click(function(){
					var this_ = $(this);
					var processInstanceId = $(this_.siblings()[0]).html();
				
					$.ajax({
						type : 'POST',
						url : window.location.protocol+"${pageContext.request.contextPath}/AbstractServlet",
						data : {
							"tag" : "MethodServlet",
							"method" : "queryHistoricVariableInstances",
							"processInstanceId" : processInstanceId
							
						},
						dataType : "json",
						success : function(data) {
							$('tbody').eq(1).empty();
					      
					        for(var i=0;i<data.length;i++){
								$('tbody').eq(1).append('<tr><td>'+data[i].variableName+'</td><td>'+data[i].value+'</td><td>'+data[i].createTime+'</td><td>'+data[i].lastUpdatedTime+'</td></tr>');
							}
							$('#dialog').dialog({
								bgiframe: true,
								resizable: false,
								modal     : true,    
								title : '历史流程变量',
								position : ['center','top'],
								width : 'auto',
								
								  overlay: {
								        backgroundColor: '#000',
								        opacity: 0.5
								    }
							}).dialog('open');
							
						}
				});
					}).css("cursor","pointer").end();
			}
			}
	});
	};
	
	
	$('#btn11').click(function(){
		var pageNum = 1;
	 getData();
	})
	

	
	
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
	
	

	
	function diagram(target){
		//alert($(target.siblings()[0]).html());
		var userId = 'wulianlong';
		var processInstanceId = $(target.siblings()[0]).html();
		var processDefinitionId = $(target.siblings()[1]).html();
		window.open(window.location.protocol+path+'/diagram-viewer/index.html?processDefinitionId='+processDefinitionId+'&processInstanceId='+processInstanceId+'');
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
/* 	$("#advertisingPage").dialog({  
        modal:true,  
            autoOpen:false,  
            width: document.documentElement.clientWidth * 0.95,  
            height:1000,  
            resizable:false,  
            position:"center",  
            title:"流程图",  
            buttons:  
            {  
                "关闭":function(){$(this).dialog("close");}  
            }  
}); */  
	$(document).on("click","#showAdList",function(){ 
		$('#advertisingPage').empty();
		var url = "";
		var userId = 'wulianlong';
		var processInstanceId = $(this).parent().parent().children().first().html();
		var processDefinitionId = $(this).parent().parent().children().eq(1).html();
		url = window.location.protocol+'/module-bpm/diagram-viewer/index.html?processDefinitionId='+processDefinitionId+'&processInstanceId='+processInstanceId+'';

		$('<iframe name = "adPageFrame" src="' + url + ' "width="100%" height="100%" />').appendTo('#advertisingPage');

	
		 $("#advertisingPage").dialog({
			   modal:true,  
	            
	            width: 1000,  
                height:516, 	          	            
	            position: ['center','top'],  
	            title:"流程图"
		 }); 

} ) 
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
<style>
/* .template{
	display:none;
} */
</style>
<body>
<div id="advertisingPage"  class="template" >  
          
</div>  
<button id="btn11" class="btn btn-primary" style="margin: 5px 5px 5px 5px" >查询历史流程</button>

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
</div>
<div style="text-align: center; float: left; width: 100%;"> 
第[<label id="lblCurent" >0</label>]页&nbsp;共[<label id="lblPageCount">0</label>]页 <a class="disable" href="#" id="btn1">首页</a>
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
