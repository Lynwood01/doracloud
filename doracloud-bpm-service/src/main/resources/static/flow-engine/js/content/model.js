var pageNum = 1;
var pageSize = 20;
var page = null;
var count = null
// 上传文件类型错误时的code
var FILE_EXTENSION_ERROR = -601;
// 文件重复上传
var FILE_DUPLICATE_ERROR = -602;
$(function(){
    uploadBpm();
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
                        url:"/model/{modelId}/save",
                        data:{
                            "name":$('#name').val(),
                            "key":$('#key').val(),
                            "description":$('#description').val()
                        },
                        success:function(data) {
                            if(data.type){

                                // window.open("modeler/modelId/" + data);
                                window.open("model/"+data+"/save");
                            }else{
                                alert(data.msg)
                            }
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
        $.ajax({
            type:'POST',
            url: "pageDef",
            data:{"pageNum":(pageNum - 1) * pageSize,
                "pageSize":pageSize
            },
            dataType:"json",
            success:function(data) {
               if(data.type){
                   var result=data.data;
                   if(data.data!=null){
                       for (var i = 0; i < result.length; i++) {
                           if (pageNum == 1) {
                               if (i == result.length - 1) {
                                   page = result[i].page;
                                   count = result[i].count;
                                   break;
                               }
                           }
                           $('tbody')
                               .first()
                               .append("<tr><td>"
                                   + result[i].id
                                   + "</td><td>"
                                   + result[i].key
                                   + "</td><td>"
                                   + result[i].name
                                   + "</td><td>"
                                   + result[i].version
                                   + "</td><td>"
                                   + result[i].createTime
                                   + "</td><td>"
                                   + result[i].lastUpdateTime
                                   + "</td><td>"
                                   + result[i].metaInfo
                                   + "</td><td><a id='bj' href='#'>编辑</a><a id='bs' href='#'>部署</a><a id='sc' href='#'>删除</a></td></tr>");
                       }
                   }

               }else{
                   alert(data.msg)
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
});





function uploadBpm(){
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
}
