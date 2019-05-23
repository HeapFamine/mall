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
	  <legend>订单管理</legend>
	</fieldset>
	
	<div class="demoTable">
		<div class="layui-form-item">
	  	<label class="layui-form-label">搜索：</label>
	  	<div class="layui-inline">
	    <input class="layui-input" name="id" id="demoReload" autocomplete="off" placeholder="日期/序号/收货人/状态等等">
	  	</div>
	  	<button class="layui-btn" data-type="reload"><i class="layui-icon" style="font-size: 20px; "></i> 搜索</button>
	  	</div>
	</div>
	
	<table class="layui-hide" id="test" lay-filter="test"></table>
	
	
  </div>
</div>


<script type="text/html" id="barDemo">
  <a class="layui-btn  layui-btn-xs" lay-event="detail">查看订单</a>
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
      url: '/mall/getOrderList',
      id: 'testReload',
      height: 'full-220',
      page: true,
      limits: [10, 20, 30],
      limit: 10, //每页默认显示的数量
      skin: 'row',//表格风格
      even: true,
      cols: [[
              {field:'id',title:'序号',align: 'center',width: 60},
              {field:'orderCode',title:'订单号',align: 'center',width: 200},
              {field:'receiver',title:'收货人',align: 'center'},
              {field:'createDate',title:'创建日期',align: 'center',templet :function (row){ return createTime(row.createDate); } },
              {field:'payDate',title:'支付日期',align: 'center',templet :function (row){ return createTime(row.payDate);}},
              {field:'deliveryDate',title:'发货日期',align: 'center',templet :function (row){ return createTime(row.deliveryDate);}},
              {field:'confirmDate',title:'确认收货日期',align: 'center',templet :function (row){ return createTime(row.confirmDate);}},
              {field:'status',title:'状态',align: 'center'},
              {fixed: 'right', title:'操作', toolbar: '#barDemo', width:100}
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
		    if(obj.event === 'detail'){
		    	window.location.href='admin_orderdetail_list?id='+data.id;
		    }
      }else{
	  	    layer.alert("您没有权限，请向管理员申请权限！");
  	  }
      
  });
});
</script>
</body>
</html>