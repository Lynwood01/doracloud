<template>
    <!--<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(function(){
        page(1,8);
      })

      function page(n,s){

        var month = $("#month").val();
        //alert(month);
        var index = layer.load(2);
        $.ajax({
          url: ctx+'/myInfo/findAllinventoryByMonth.ajax',
          type: "POST",
          dataType:"json",
          data:{
            month:month,
            pageNo:n,
            pageSize:s
          },
          success: function(data) {
            $("#noData").remove();
            var list = data.reModel.list;
            layer.close(index);
            if(data.reType){
              $(".table>tbody").empty();
              if(list.length==0)
              {
                /* layer.alert("未查询到符合条件的信息"); */
                $(".page").empty();
                $(".table").after(noTips);
                return;
              };
              if(list.length>0){
                for(var i=0;i<list.length;i++){
                  var tr = $("<tr></tr>");
                  tr.append("<td>"+list[i].billBatch+"</td>");
                  tr.append("<td>"+list[i].userNbr+"</td>");
                  tr.append("<td>"+list[i].dataTypeName+"</td>");
                  tr.append("<td>"+list[i].dataVal+"M</td>");
                  tr.append("<td>"+(list[i].billFee/1000).toFixed(2)+"</td>");
                  tr.append("<td>"+list[i].discount+"%</td>");
                  tr.append("<td>"+formatDateTime(list[i].recDate)+"</td>");
                  tr.append("<td>"+list[i].recNo+"</td>");
                  tr.append("<td>"+list[i].contId+"</td>");
                  $(".table>tbody").append(tr);
                }

                $(".page").html(data.reModel.html);
              }
            }else{
              layer.alert(data.msg);
            }
          }
        });
      }

      function exportTable(){
        var month = $("#month").val();
        window.location.href="${ctx}/myInfo/exportInventory.html?month="+month;
      }


    </script>-->
  <div class="main clearfix">
    <div class="content">
      <nav-bread>
        <slot>
          <a href="javascript:;">我的清单</a>
        </slot>
      </nav-bread>
      <div class="wrapper">
        <div class="inner">
          <div class="search-bar">
            <span>请选择查询的年月:</span>
              <el-date-picker v-model="month" type="month" placeholder="选择月" format="yyyy 年 MM 月"
                value-format="yyyy-MM"
                class="sel2">
              </el-date-picker>
            <el-button type="primary" icon="el-icon-search">查询</el-button>
            <el-button type="primary" @click="exportTable" class="fr" icon="el-icon-download el-icon--right" >清单导出</el-button>
          </div>
          <el-table :data="tableData"  height="400" stripe
          border :default-sort = "{prop: 'date', order: 'descending'}">
            <el-table-column prop="name"  fixed label="手机号码" sortable fit />
            <el-table-column prop="date" label="出账批次" sortable fit/>
            <el-table-column prop="address" label="流量类型" sortable fit />
            <el-table-column prop="name" label="商品规格" sortable fit />
            <el-table-column prop="name" label="价格（元）" sortable fit />
            <el-table-column prop="name" label="折扣" sortable fit />
            <el-table-column prop="name" label="充值时间" sortable fit />
            <el-table-column prop="name" label="分销流水号" sortable fit />
            <el-table-column prop="name" label="合同标识" sortable fit />
          </el-table>
          <pagination v-show="tableData.length>=0"></pagination>
        </div>
      </div>
    </div>
  </div>
</template>
<style>
  .sel2{
    width: 62px;
    padding: 6px 2px;
    font-size: 12px;
  }
  .fr{
    right:0px;
    margin-top:5px !important;
  }
  .el-button{
    border-color:#01a350;
    background-color: #01a350;
  }
</style>
<script>
  import "@/assets/css/common.css"
  import NavHeader from '@/components/header/head'
  import NavFooter from '@/components/footer/footer'
  import MenuLeft from '@/components/common/left'
  import NavBread from '@/components/common/bread'
  import pagination from '@/components/common/pagination'
  import axios from 'axios'
  export default {
    data() {
      return {
        tableData: [

        ],
        month:'',
        currentPage: 5
      }
    },
    components:{
      NavHeader,
      NavFooter,
      MenuLeft,
      NavBread,
      pagination
    },
    methods:{
      exportTable(){
        axios.get('/exportInventory',{
          params:{month:this.month}}).then(res=>{
            alert(res.data);
        }).catch(error=>{
          alert(error);
        })
  }
    }
  }
</script>
