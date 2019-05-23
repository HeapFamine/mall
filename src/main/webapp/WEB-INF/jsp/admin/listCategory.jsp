<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="Header.jsp"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<script>
    $(function(){
        $("#addForm").submit(function(){
        	
            if(!checkEmpty("name","分类名称"))
                return false;
            return true;
        });
    });
</script>

<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding:  80px 10px ;">
  
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>分类管理</legend>
	</fieldset>
	
	<form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data" class="layui-form layui-form-pane">
	  <div class="layui-form-item">
	
	    <label class="layui-form-label">新增分类</label>
	    <div class="layui-input-inline">
	      <input id="name" type="text" name="name" autocomplete="off" placeholder="请输入分类名称" class="layui-input">
	    </div>
	    <button type="submit" class="layui-btn" >立即提交</button>
	  </div>
	</form>

	
	<div class="demoTable">
		<div class="layui-form-item">
	  	<label class="layui-form-label">搜索：</label>
	  	<div class="layui-inline">
	    <input class="layui-input" name="id" id="demoReload" autocomplete="off" placeholder="id/分类名称">
	  	</div>
	  	<button class="layui-btn" data-type="reload"><i class="layui-icon" style="font-size: 20px; "></i> 搜索</button>
	  	</div>
	</div>

	<table class="layui-hide" id="test" lay-filter="test"></table>

  </div>
</div>



<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="manager">产品管理</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>



<script>
layui.use(['table', 'layer', 'jquery', 'form', 'element'], function(){
    var table = layui.table;
    var layer = layui.layer;
    var $ = layui.jquery;
    var form = layui.form;
    var element = layui.element;
    
    table.render({
        elem: '#test',
        url: '/mall/getCategoryList',
        id: 'testReload',
        height: 'full-220',
        page: true,
        limits: [10, 20, 30],
        limit: 10, //每页默认显示的数量
        skin: 'row',//表格风格
        even: true,
        cols: [[
                {field:'id',title:'序号',align: 'center',width: 200},
                {field:'name',title: '分类名称',align: 'center'},
                {field:'createDate',title: '创建时间',align: 'center',templet :function (row){ return createTime(row.createDate); }},
                {fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
           ]]
    });
  
  
    var $ = layui.$, active = {
    	    reload: function(){
    	      var demoReload = $('#demoReload');
    	      
    	      //执行重载
    	      table.reload('testReload', {
    	        page: {
    	          curr: 1 //重新从第 1 页开始
    	        }
    	        ,where: {
    	        	  searContent: demoReload.val()

    	        }
    	      });
    	    }
    	  };
    	  
   	  $('.demoTable .layui-btn').on('click', function(){
   	    var type = $(this).data('type');
   	    active[type] ? active[type].call(this) : '';
   	  });


  //监听工具条
  table.on('tool(test)', function(obj){
      var data = obj.data; //获得当前行数据
      var tr = obj.tr; //获得当前行 tr 的DOM对象
      
    if(obj.event === 'manager'){
  		  window.location.href='admin_product_list?cid='+data.id;
    } 
     
     if(("High")==("${admin.authority}")){
		if(obj.event === 'del'){
	    	layer.alert('真的删除分类：'+data.name+" 吗?", function(index){
	    		  window.location.href='admin_category_delete?id='+data.id;
	    	});
	    } else if(obj.event === 'edit'){
	    	layer.alert('真的修改分类：'+data.name+" 吗?", function(index){
	  		  window.location.href='admin_category_edit?id='+data.id;
	  	});
	
	    }
     }else{
	    layer.alert("您没有权限，请向管理员申请权限！");
	}
      
  });
});
</script>
</body>
</html>