<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户管理</title>
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css" rel="stylesheet" />
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css" rel="stylesheet"/>
 
</head>
<body>

	<div class="demo-content" style="padding-left: 10px">

		<div class="demo-content">		
		<h2>检索条件：</h2>
		<form id="searchForm" class="form-horizontal" method="post">
			<div class="row">
					<div class="span8 doc-content">
						<label class="control-label">用户名：</label>
						<div class="controls">
							<input type="text" name="user_name" class="control-text" />
						</div>
					</div>
<!-- 					<div class="span8 doc-content">
						<label class="control-label">创建时间：</label>
						<div class="controls">
							<input type="text" name="create_time" class="calendar" />
						</div>
					</div>	 -->	 		 
			 	 <div class="span9 doc-content">
			 	 	<label class="control-label">状态：</label>
			 	 		<div class="controls">
              			<select name="status"  ><option value="">请选择</option>
              				<c:forEach items="${ztList }" var="zt">
              					<option value="${zt.c_code }">${zt.c_name }</option> 
              					</c:forEach></select>           				
            			</div>
			 	 </div>
			 	 <div class="span9 doc-content">
			 	 	<label class="control-label">用户类型：</label>
			 	 		<div class="controls">
              			<select name="type"  ><option value="">请选择</option>
              				<c:forEach items="${yhlxList }" var="yhlx">
              					<option value="${yhlx.c_code }">${yhlx.c_name }</option> 
              					</c:forEach></select> 
            			</div>
			 	 </div></div>
			 
			 <div class="row">
			      <div class="span13 doc-content">
              			<button id="btnSearch" type="submit" class="button button-primary">搜索</button>
			      </div>
			    </div>
			</form>
			
			<br/>
			<div class="row">
				<div class="span34">
					<div id="grid">
					  
					</div>
				</div>
			</div>
			  <!-- 初始隐藏 dialog内容 -->
		    <div id="content" class="hide">
		      <form action="add" method="post" class="form-horizontal">
		        <div class="row">
		          <div class="control-group span9">
		            <label class="control-label"><s>*</s>用户名：</label>
		            <div class="controls">
		              <input name="user_name" type="text" data-rules="{required:true}" class="input-normal control-text"/>
		            </div>
		          </div>
		        </div> 
		        <div class="row">
		          <div class="control-group span8 ">
		            <label class="control-label"><s>*</s>密码：</label>
		            <div id="range" class="controls">
		              <input name="password" class="password" data-rules="{required:true}"  type="password"/>
		            </div>
		          </div>	       
		        </div>
		       
					
		        <div class="row">
		          <div class="control-group span8 ">
		            <label class="control-label"><s>*</s>邮箱：</label>
		            <div id="range" class="controls">
		              <input name="email" class="e-mail" data-rules="{required:true,email : true}"  type="text"/>
		            </div>
		          </div>	       
		        </div>
		   
		        <div class="row">
		          <div class="control-group span8 ">
		            <label class="control-label"><s>*</s>联系方式：</label>
		            <div id="range" class="controls">
		              <input name="phone" class="input-normal control-text" data-rules="{required:true}"  type="text"/>
		            </div>
		          </div>	       
		        </div>
		        
		        <div class="row">
		          <div class="span9 doc-content">
			 	 	<label class="control-label">状态：</label>
			 	 		<div class="controls">
              			<select name="status"  data-rules="{required:true}"><option value="">请选择</option>
              				<c:forEach items="${ztList }" var="zt">
              					<option value="${zt.c_code }">${zt.c_name }</option> 
              					</c:forEach></select> 
              				
            			</div>
			 	 </div>       
		        </div>
		        <div class="row">
		        <div class="span9 doc-content">
			 	 	<label class="control-label">用户类型：</label>
			 	 		<div class="controls">
              			<select name="type" data-rules="{required:true}" ><option value="">请选择</option>
              				<c:forEach items="${yhlxList }" var="yhlx">
              					<option value="${yhlx.c_code }">${yhlx.c_name }</option> 
              					</c:forEach></select> 
            			</div>
			 	 </div>
			 	 </div>
		        
		      </form>	      
		    </div>
		    
		    <div id="detail" class="hide">
				<form action="detail" method="post" class="form-horizontal">

					<div class="row">
						<div class="control-group span9">
							<label class="control-label">用户名：</label>
							<div class="controls">
								<input name="user_name" type="text" 
									class="input-normal control-text" readonly="readonly"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">邮箱：</label>
							<div class="controls">
								<input name="email" type="text" 
									class="input-normal control-text" readonly="readonly"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span9 ">
							<label class="control-label">联系方式：</label>
							<div class="controls">
                                <input name="phone" type="text" 
									class="input-normal control-text" readonly="readonly"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">状态：</label>
							<div class="controls">
								<input name="statusname" type="text"
								    class="input-normal control-text" readonly="readonly"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label">用户类型：</label>
							<div class="controls">
                                <input name="typename" type="text" 
									class="input-normal control-text" readonly="readonly"/>
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
		        	if("${Type }"=="ZHUGUAN"){
		        		columns = [
		   						{title:'用户名',dataIndex:'user_name',width:150,elCls : 'center'},
		   						{title:'邮件',dataIndex:'email',width:200, elCls : 'left'},
		   						{title:'联系电话',dataIndex:'phone',width:150,elCls : 'right'},
		   						{title:'状态code',dataIndex:'status',width:150,elCls : 'center',visible : false},
		   						{title:'状态',dataIndex:'statusname',width:150,elCls : 'center'},
		   						{title:'用户类型code',dataIndex:'type',width:150,elCls : 'center',visible : false},
		   						{title:'用户类型',dataIndex:'typename',width:150,elCls : 'center'},
		   						{title:'创建时间',dataIndex:'create_time',width:160,renderer:Grid.Format.dateRenderer,elCls : 'center'},
		   						{title : '操作',width : '10%',renderer : function(){
		   						 return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-edit">编辑</span><span class="grid-command btn-del" title="删除活动信息">删除</span>'
		   						},height : 20}] 
		        	}
		        	else{columns = [
						{title:'用户名',dataIndex:'user_name',width:150,elCls : 'center'},
						{title:'邮件',dataIndex:'email',width:200, elCls : 'left'},
						{title:'联系电话',dataIndex:'phone',width:150,elCls : 'right'},
						{title:'状态',dataIndex:'status',width:150,elCls : 'center'},
						{title:'用户类型',dataIndex:'type',width:150,elCls : 'center'},
						{title:'创建时间',dataIndex:'create_time',width:160,renderer:Grid.Format.dateRenderer,elCls : 'right'},  						
		            ]};
		            var editing = new Grid.Plugins.DialogEditing({
		            	listeners:{
		                	accept:function(ev){
		                		store.load();
		                		alert("添加成功");
		                	},	
		                	cancel:function(ev){
		                		store.load();
		                	},	
		                },	                
		                contentId : 'content',//设置隐藏的Dialog内容
		                
		                autoSave : true, //添加数据或者修改数据时，自动保存
	        		  	editor : {
	          		      	title : '编辑用户'
	          		  	},
		                triggerCls : 'btn-edit' ,   //触发显示Dialog的样式
		              })
		            var detail = new Grid.Plugins.DialogEditing(
							{
								contentId : 'detail',
								editor : {
									title : '详情',
									buttons : [/*  {
																							text : '关闭',
																							elCls : 'button',
																							handler : function() {
																								window.top.location
																										.reload();
																							}
																						}  */],
								},
								triggerCls : 'btn-detail',
							})
		            var store = new BUI.Data.Store({
		                remoteSort : false,
		                pageSize:10,
		                proxy : {
		                    save : { //也可以是一个字符串，那么增删改，都会往那么路径提交数据，同时附加参数saveType
		                        addUrl : 'user/updateUser',
		                        updateUrl : 'user/updateUser',		                       
		                      },
		                      method : 'POST',
		                    pageStart : 1
		                  },
		                url : 'user/allUser',
		                autoLoad:true,
		                autoSync : true    //保存数据后，自动更新
		                
		            });
		            
		            var grid = new Grid.Grid({
		              contentId : 'content',
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
			                }
	                	,{
			                  btnCls : 'button button-small',
			                  text : '<i class="icon-white icon-trash"></i>批量刪除',
			                  listeners : {			                	  
			                    'click' : delFunction
			                  }
			                }
	                	]
			            },
			            
		              bbar:{
		                  // pagingBar:表明包含分页栏
		                  pagingBar:true
		              },
		              plugins : [BUI.Grid.Plugins.AutoFit],
		              plugins : [editing,detail,Grid.Plugins.CheckSelection],
		              store : store
		            });			
		         
		           
		            grid.on('click', function(){ 
		            	
		            	
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
			          var newData = {'user_name' : ''};			           
			          editing.edit(newData,0); //添加记录后，直接编辑			          
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
			                  url : 'user/delUser/'+ ids,
			                  success : function(data){
			                    if(data.success){ //删除成功
			                        BUI.Message.Alert('删除成功！');
			                        store.remove(items);
			                        top.topManager.reloadPage();
			                    }else{ //删除失败
			                      BUI.Message.Alert('删除失败！');
			                    }
			                  }
			              });
			              });
			            }
			          }
			          
			          
			          
			        //监听事件，删除一条记录
			        grid.on('cellclick',function(ev){
			          var sender = $(ev.domTarget); //点击的Dom
			          if(sender.hasClass('btn-del')){
			            var record = ev.record;
			            delItems([record]);
			          }
			        });
			        grid.on('click', function(){
						detail.show();
					});
			        
		        });
		        function downlandFile (){
					var url = "downloadActivity";
					$('body').append($('<iframe>').attr('src', url).attr('style', 'display: none;'));
		        }

			</script>
		</div>
	</div>
</body>
</html>