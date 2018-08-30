<template>
	<div class="model-div">
		<page-foot></page-foot>
</div>

</template>

<script>
import PageFoot from '../../views/layout/page/index.vue';
  export default {
    components: {
      Model,
      PageFoot
    }
  };	
</script>
<style>
	table {
		border-collapse: separate;
		border-spacing: 10px;
		width:100%;
		cellpadding: 1px;
		 cellspacing: 1px
	}
	.model-div{
		text-align: right; 
		margin-right: 10px;
	}
	a {
		margin-right: 10px;
	}
	
	.template {
		display: none;
	}
</style>