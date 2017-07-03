<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>招聘人员</title>
<link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css"rel="stylesheet" />
<link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css"rel="stylesheet" />
</head>

<body>

<div class="demo-content" style="padding-left: 10px">
		<br />
		<div class="demo-content">

			<form id="searchForm" class="form-horizontal" method="post">
				<div class="row">
					<div class="span14 doc-content">
						<input type="text" name="search" class="control-text search-query" />
						<button id="btnSearch" type="submit" class="button button-primary">搜索</button>
					</div>
				</div>
			</form>
			<br />
			<div class="row">
				<div class="span34">
					<div id="grid"></div>
				</div>
			</div>
			
			<div id="content" class="hide">
				<form action="add" method="post" class="form-horizontal">
				
					<div class="row">
						<div class="control-group span8">
							<label class="control-label"><s>*</s>姓名：</label>
							<div class="controls">
								<input name="name" type="text" data-rules="{required:true}"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label"><s>*</s>性别：</label>
							<div class="controls">
								<input name="sex" type="text"
									data-rules="{required:true}"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8 ">
							<label class="control-label"><s>*</s>联系方式：</label>
							<div id="range" class="controls">
								<input name="phone" type="text"
									data-rules="{required:true,number : true}"  class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8 ">
							<label class="control-label"><s>*</s>类型：</label>
							<div id="range" class="controls">
								<input name="types" type="text"
								  class="input-normal control-text" data-rules="{required:true}"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8 ">
							<label class="control-label"><s>*</s>年龄：</label>
							<div id="range" class="controls">
								<input name="age" type="text"
								  class="input-normal control-text" data-rules="{required:true,number : true}"/>
							</div>
						</div>
					</div>
					
				</form>
			</div>
			<script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
			<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
			<script src="http://g.alicdn.com/bui/bui/1.1.17/config.js"></script>
			<script type="text/javascript">	
			
			var tempFields;
		
	        BUI.use(['bui/grid','bui/data','bui/form'],function(Grid,Data,Form){
	            columns = [
					{title:'ID',dataIndex:'id',width:120},
					{title: '招聘人',dataIndex:'name',width:150},
					{title: '年龄',dataIndex:'age',width:150},
					{title: '性别',dataIndex:'sex',width:160},
					{title: '邮箱',dataIndex:'email',width:160},
					{title: '联系方式',dataIndex:'phone',width:160},
					{title: '状态',dataIndex:'status',width:160},
					{title: '类型',dataIndex:'types',width:160},
					{title: '奖金',dataIndex:'cash',width:160},
					{title: '操作',renderer : function(){
					 return '<span class="grid-command btn-edit">编辑</span><span class="grid-command btn-del" title="删除活动信息">删除</span>'
					}}
	            ];
	            var editing = new Grid.Plugins.DialogEditing({
	                contentId : 'content',
	                autoSave : true,
        		  	editor : {
          		      	title : '编辑招聘人'
          		  	},
	                triggerCls : 'btn-edit' //触发显示Dialog的样式
	              })
	            var store = new BUI.Data.Store({
	                remoteSort : false,
	                pageSize:15,
	                proxy : {
	                    save : { //也可以是一个字符串，那么增删改，都会往那么路径提交数据，同时附加参数saveType
	                        addUrl : 'recruiters/updateRecruiters',
	                        updateUrl : 'recruiters/updateRecruiters',
	                        callback : function(date){
	                        	alert(data.success);
	                        }
	                      },
	                      method : 'POST',
	                    pageStart : 1
	                  },
	                url : 'recruiters/allRecruiters',
	                autoLoad:true,
	                autoSync : true //保存数据后，自动更新
	            });

	            var grid = new Grid.Grid({
	              render:'#grid',
	              columns : columns,
	              forceFit : true,
	              innerBorder : true,
	              loadMask: true,
	              emptyDataTpl : '<div class="centered"><h2>暂时没有数据</h2></div>',
	              // 底部工具栏
             	  tbar:{ //添加、删除
                	items : [{
		                  btnCls : 'button button-small',
		                  text : '<i class="icon-plus"></i>添加',
		                  listeners : {
		                    'click' : addFunction
		                  }
		                },{
			                  btnCls : 'button button-small',
			                  text : '<i class="icon-white icon-trash"></i>批量刪除',
			                  listeners : {
			                    'click' : delFunction
			                  }
			                }]
		            },
	              bbar:{
	                  // pagingBar:表明包含分页栏
	                  pagingBar:true
	              },
	              plugins : [BUI.Grid.Plugins.AutoFit],
	              plugins : [editing,Grid.Plugins.CheckSelection],
	              store : store
	            });

	            grid.render();

	            //创建表单，表单中的日历，不需要单独初始化
	            var form = new BUI.Form.HForm({
	              srcNode : '#searchForm',
	              method : {view: true, value: 'post'}
	            }).render();
	     
	            form.on('beforesubmit',function(ev) {
	              //序列化成对象
	              
	              var obj = form.serializeToObject();
	              obj.start = 0; //返回第一页
	              store.load(obj);
	              
	              return false;
	            });

		        //添加记录
		        function addFunction(){
		          var newData = {b : 0};
		          store.addAt(newData,0);
		          editing.edit(newData,'a'); //添加记录后，直接编辑
		        }

		        //删除选中的记录
		        function delFunction(){
		            var selections = grid.getSelection();
		            delItems(selections);
		          }
		        	
		          function delItems(items){
		            var ids = "";
		            var count = 0;
		            BUI.each(items,function(item){
		          	if(count == 0) {
		          		ids = item.id;
		          	} else {
		          		ids += "-" + item.id;
		          	}
		              count ++;
		            });
		            if(ids != ""){
		              BUI.Message.Confirm('确认要删除选中的记录么？',function(){
		                $.ajax({
		                  url : 'recruiters/delRecruiters/'+ ids,
		                  success : function(data){
		                    if(data.success){ 
		                        BUI.Message.Alert('删除成功！');
		                        store.remove(items);
		                    }else{ 
		                      BUI.Message.Alert('删除失败！');
		                    }
		                  }
		              });
		              });
		            }
		          }
		          
		        //监听事件，删除一条记录
		        grid.on('cellclick',function(ev){
		          var sender = $(ev.domTarget); 
		          if(sender.hasClass('btn-del')){
		            var record = ev.record;
		            delItems([record]);
		          }
		        });
		        
	        });

		</script>
	</div>
</div>
</body>
</html>