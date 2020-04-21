<template>
  <div class="header">
    <div class="header-in">
    	<div class="header-r">
  		<a href="" class="header-font" target="_blank"><span>中文</span></a>
    	<a href="" target="_blank" class="header-font"><span>英文</span></a>   
    	</div>
    </div>
  </div>
</template>
<style>
  .header {
    background-color: #f5f5f5;
    height: 38px;
    position: absolute;
    z-index: 10;
    width: 100%;
  }
  .header-in {
    width: 50%;
    height: 38px;
    float: right;
  }
  .header-l, .header-r {
    width: 10%;
    height: 38px;
  }
  .header-l {
    float: left;
  }

  .header-font {
    font-size: 14px;
    cursor:pointer;
  }

  .header-r {
    float: right;
  }
/*  .header-l img {
    width: 100px;
    height: 30px;
    margin-top: 9px;
    float: left;
  }*/
  .header-r li {
    float: left;
    height: 38px;
    line-height: 38px;
    margin: 0 18px;

  }

  .header-r input {
    outline: 0;
    float: left;
    width: 203px;
    height: 26px;
    margin-left: 170px;
    margin-top: 10px;
    border: 1px solid #8c92a4;
    border-radius: 50px;
    background-color: #303643;
    text-indent: 1em;
    color: #8c92a4
  }

  .header-r li {
    height: 46px;
    line-height: 46px;
    margin: 0 10px;
    color: #8c92a4;
    float: right;
  }

  .header-r li a {
    color: #8c92a4;
  }
</style>

