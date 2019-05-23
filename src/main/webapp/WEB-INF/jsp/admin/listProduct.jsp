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

<div class="layui-body">
  <!-- 内容主体区域 -->
  <div style="padding:  80px 10px ;">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>${c.name}-产品管理</legend>
	</fieldset>
	
	<div class="layui-form-item">
	  	<label class="layui-form-label">新增产品</label>
	  	<a href="addProduct?cid=${c.id}" class="layui-btn"><i class="layui-icon">&#xe608;</i> 点击添加</a>
	</div>
	
	<div class="demoTable">
		<div class="layui-form-item">
	  	<label class="layui-form-label">搜索：</label>
	  	<div class="layui-inline">
	    <input class="layui-input" name="id" id="demoReload" autocomplete="off" placeholder="产品名称/小标题">
	  	</div>
	  	<button class="layui-btn" data-type="reload"><i class="layui-icon" style="font-size: 20px; "></i> 搜索</button>
	  	</div>
	</div>
	
	<table class="layui-hide" id="test" lay-filter="test"></table>
	
  </div>
</div>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="manager">图片管理</a>
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
  
  layui.use('element', function(){
    var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
    
    //监听导航点击
    element.on('nav(demo)', function(elem){
      //console.log(elem)
      layer.msg(elem.text());
    });
  });
  table.render({
      elem: '#test',
      url: '/mall/getProductList',
      id: 'testReload',
      height: 'full-220',
      page: true,
      where:{cid: ${ c.id} },
      limits: [10, 20, 30],
      limit: 10, //每页默认显示的数量
      skin: 'row',//表格风格
      even: true,
      cols: [[
              {field:'id',title:'序号',align: 'center',width: 50},
              {field:'name',title:'产品名称',align: 'center'},
              {field:'subTitle',title:'产品小标题',align: 'center'},
              {field:'originalPrice',title:'原价格',align: 'center',width: 100},
              {field:'promotePrice',title:'优惠价格',align: 'center',width: 100},
              {field:'stock',title:'库存',align: 'center',width: 100},
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
      if(("High")==("${admin.authority}")){
	    if(obj.event === 'manager'){
	    	window.location.href='admin_productImage_list?pid='+data.id;
	    } else if(obj.event === 'del'){
	    	layer.alert('真的删除产品：'+data.name+" 吗?", function(index){
	    		  window.location.href='admin_product_delete?id='+data.id;
	    	});
	    } else if(obj.event === 'edit'){
	    	layer.alert('真的修改产品：'+data.name+" 吗?", function(index){
	  		  window.location.href='admin_product_edit?id='+data.id;
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