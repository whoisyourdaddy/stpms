<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据树</title>
 <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css" rel="stylesheet"/>
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css" rel="stylesheet"/>
  <style type="text/css">
			.tree .tree-folder {width: 16px;}
			.tree:before {border: none;}
			.tree .tree-item, .tree .tree-folder {border: none;}
 </style>
 <script type="text/javascript">
 function del(){
     if(treeid != ""){
       BUI.Message.Confirm('确认要删除选中的记录么？',function(){
         $.ajax({
           url : 'tree/delTree?treeid='+ treeid,
           success : function(data){
             if(data.success){ //删除成功
                 BUI.Message.Alert('删除成功！');

                 top.topManager.reloadPage();
             }else{ //删除失败
               BUI.Message.Alert('删除失败！');
             }
           }
       });
       });
     }
   }
 
 function add(){
	 $.ajax({
		 cache: true,
         type: "POST",
         url:'tree/addTree',
	     data:$('#cform').serialize(),
	 });
	 top.topManager.reloadPage();
 }
 
 function edit(){
	 alert("可以进行修改了");
 }
 
  function doSave(){
	 $.ajax({
		 cache: true,
         type: "POST",
	 	url:'tree/updateTree',
	 	data:$('#cform').serialize(),
	  	success : function(data){
          if(data.success){ //删除成功
              BUI.Message.Alert('保存成功！');
              top.topManager.reloadPage();
          }else{ //删除失败
            BUI.Message.Alert('保存失败！');
          }
        }
	 });
	 
 } 
 </script>
</head>
<body>
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="first">系统管理</a>
				</li>
				<li class="active">数据字典管理</li>
			</ul><!-- .breadcrumb -->
		</div>
    <div class="demo-content">
      <style>
    .bui-tree-list{
      overflow: auto;
    }
  </style>
    <div class="row">
       <div class="span10">
     
         <div class="panel panel-head-borded panel-small">
          <div class="panel-header clearfix">树列表
          <div id="tbar" class="pull-right"></div> 
          </div>                         
          <div id="t1" class="panel-body">
            </div>
          </div>
          </div>        
                  
      
        <div class="span10">
        	<div class="panel panel-head-borded panel-small">
          		<div class="panel-header">表单</div>
          		<div class="row">
				<h3 class="control-label centered" >数据字典</h3>
				
				
				
				 <div class="centered">
						    <!-- <button class="btn btn-info btn-sm" type="submit" onclick="add();">添加</button> -->  
						<!-- <button class="btn btn-info btn-sm" onclick="addChild();">添加子项</button> -->
						<button class="btn btn-info btn-sm" onclick="edit();">修改</button>
						<button class="btn btn-warning btn-sm" onclick="del();">删除</button>
				</div>
				
				<div class="col-sm-6">
				
					<div class="widget-box">
					
						<div class="widget-header">
						</div>
						<div class="widget-body">
							<div class="widget-main">
					<ul id="category">
					</ul>
					</div></div></div>
				</div>
				<div class="col-sm-9">
					<div class="widget-box">
					
						<div class="widget-header">
						</div>
						<div class="widget-body">
							<div class="widget-main">
								<form class="form-horizontal" role="form" id="cform" method="post">
									<div class="form-group">
										    <label for="id" class="col-sm-2 control-label">ID</label>
											<div class="col-sm-3">
										    	<input type="text"  class="form-control" id="id"  name="category.id" >
											</div>
											
										    <label for="sup_id" class="col-sm-2 control-label">父节点</label>
											<div class="col-sm-4">
										    	<input type="text"   class="form-control" id="sup_id"  name="category.sup_id">
											</div>
									</div>
									<div class="form-group">
										    <label for="c_name" class="col-sm-2 control-label">名称</label>
											<div class="col-sm-3">
										    	<input type="text" class="form-control1" id="c_name"  name="category.c_name">
											</div>
											
										    <label for="c_code" class="col-sm-2 control-label">字典编码</label>
											<div class="col-sm-4">
										      <input type="text" class="form-control" id="c_code"  name="category.c_code">
											</div>
									</div>
									<div class="form-group">
										    <label for="orderby" class="col-sm-2 control-label">排序</label>
											<div class="col-sm-4">																																																																																																																																				
										      <input type="text" class="form-control" id="orderby"  name="category.orderby">
											</div>
									</div>
									<div class="space-6 centered">									
									 <button class="button button-primary" type="submit" onclick="doSave();">
										<i class="icon-ok bigger-110"></i>
										保存
									</button> 
									
									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										重置
									</button></div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		        
        	</div>
      	</div>
      </div>

        <script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
  		<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
  		<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
  		<script type="text/javascript">
  		var treeid = 1;
        BUI.use(['bui/tree','bui/data','bui/form','bui/toolbar'],function (Tree,Data,Toolbar,form) {

      var store = new Data.TreeStore({
          root : {
            id : 'category',
            text : '数据字典表',
            checked : false
          },
          
          proxy : {
              save : { //也可以是一个字符串，那么增删改，都会往那么路径提交数据，同时附加参数saveType
                 updateUrl : 'tree/updateTree',		                       
                },
                method : 'POST',
              pageStart : 1
            },
          url : 'tree/allTree',
          autoLoad:true,
          autoSync : true ,//保存数据后，自动更新
          save:{
        	  url:'tree/updateTree',
          },
        });   
      //由于这个树，不显示根节点，所以可以不指定根节点
      var tree = new Tree.TreeList({
        render : '#t1',
        height:300,
        showLine : true, //显示连接线
        showRoot : true,
        store : store,
        checkType : 'none', 
      });
      tree.render();
      
 
      tree.on('itemclick',function(ev){
    	  var item = ev.item;
    	  $('#c_code').val(item.c_code);
          $('#id').val(item.id);
          $('#sup_id').val(item.attributes.sup_id); 
          $('#c_name').val(item.text);        
          $('#orderby').val(item.attributes.orderby);         
          treeid=item.id;  
          
  	});

      
      var form = new BUI.Form.HForm({
          srcNode : '#cform',
          submitType : 'ajax',
          contentId : 'content',
          method : {view: true, value: 'post'}
        }).render();
      
      form.on('beforesubmit',function(ev) {
          //序列化成对象
          
          var obj = form.serializeToObject();
          obj.start = 0; //返回第一页
          store.load(obj);
          
          return false;
        });
      
          	  
        });
  

    </script>
    
    </div>
</body>
</html>