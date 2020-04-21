<template>
	<div class="page-foot">
		第[<label id="lblCurent">0</label>]页&nbsp;共[<label id="lblPageCount">0</label>]页
		<a href="#" id="btn1">首页</a>
		<a href="#" id="btn2">上一页</a>
		<a href="#" id="btn3">下一页</a>
		<a href="#" id="btn4">尾页</a> 转到 <input id="changePage" type="text" size="1" maxlength="4" /> 页
		<a href="#" id="btn5" class='tz'>跳转</a>
	</div>
</template>

<script>
	// export default {
	// 	components: {
	// 		PageFoot
	// 	}
	// }
</script>

<style>
	.page-foot {
		text-align: center;
		float: left;
		width: 100%;
	}
</style>
