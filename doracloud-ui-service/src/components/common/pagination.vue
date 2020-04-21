<template>
  <el-pagination
    @size-change="handleSizeChange"
    @current-change="handleCurrentChange"
    :current-page="currentPage"
    :page-sizes="[10, 20, 50, 100]"
    :page-size="10"
    layout="total, sizes, prev, pager, next, jumper"
    :total="400"
    :background=true>
  </el-pagination>
</template>
<style>
  .el-pager li.active{
    background-color: #01a350 !important;
  }
</style>
<script>
  export default {
    methods: {
      handleSizeChange(val) {
      },
      handleCurrentChange(val) {
      }
    },
    data() {
      return {
        currentPage: 1
      };
    }
  }
</script>
