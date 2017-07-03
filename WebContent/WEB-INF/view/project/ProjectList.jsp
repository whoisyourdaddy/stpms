<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目信息</title>
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css" rel="stylesheet"/>
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css" rel="stylesheet"/>
</head>
<body>
<div class="demo-content" style="padding-left: 10px">
		<div class="demo-content">
		
		<h2>检索条件：</h2>
		<form id="searchForm" class="form-horizontal" method="post">
			<div class="row">
					<div class="span8 doc-content">
						<label class="control-label">项目现场：</label>
						<div class="controls">
							<input type="text" name="name" class="control-text" />
						</div>
					</div>
					<div class="span9 doc-content">
						<label class="control-label">项目地点：</label>
						<div class="controls">
							<select name="location"  ><option value="">请选择</option>
              				<c:forEach items="${xmddList }" var="xmdd">
              					<option value="${xmdd.c_name }">${xmdd.c_name }</option> 
              					</c:forEach></select> 
						</div>
					</div>
						
					<div class="span8 doc-content">
						<label class="control-label">项目人数：</label>
						<div class="controls">
							<input type="text" name="num" class="control-text" />
						</div>
					</div>												    			   			
				</div>				   
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
		          <div class="control-group span8">
		            <label class="control-label"><s>*</s>项目现场：</label>
		            <div class="controls">
		              <input name="name" type="text" data-rules="{required:true}" class="span4 span-width control-text" />
		            </div>
		          </div>
		        </div>  
		        <div class="row">
		          <div class="control-group span9 ">
		            <label class="control-label"><s>*</s>项目地点：</label>
		            <div id="range" class="controls">
		              <select name="location" data-rules="{required:true}" ><option value="">请选择</option>
              				<c:forEach items="${xmddList }" var="xmdd">
              					<option value="${xmdd.c_name }">${xmdd.c_name }</option> 
              					</c:forEach></select> 
		            </div>
		          </div>		       
		        </div>
		        <div class="row">
		          <div class="control-group span8 ">
		            <label class="control-label"><s>*</s>项目人数：</label>
		            <div id="range" class="controls">
		              <input name="num" class="control-text" data-rules="{required:true}"  type="text"/>
		            </div>
		          </div>
		        </div>
		        
		        <div class="row">
		          <div class="control-group span8">
		            <label class="control-label"><s>*</s>备注：</label>
		            <div class="controls control-row4">
		              	<textarea name="remark" data-rules="{required:true}"></textarea>
		            </div>
		          </div>
		        </div> 
		      </form>
		    </div>

		    
		    <div id="detail" class="hide" >
		      <form action="detail" method="post" class="form-horizontal">
		        
		        
		        <div class="row">
		          <div class="control-group span9">
		            <label class="control-label"><s>*</s>项目现场：</label>
		            <div class="controls">
		              <input name="name" type="text"  class="input-normal control-text" readonly="readonly"/>
		            </div>
		          </div>		          		     
		          <div class="control-group span9 ">
		            <label class="control-label"><s>*</s>项目地点：</label>
		            <div id="range" class="controls">
		              <input name="location" type="text"  class="input-normal control-text" readonly="readonly"/>
		            </div>
		          </div>		       
		        </div>
		        
		        <div class="row">
		          <div class="control-group span9 ">
		            <label class="control-label"><s>*</s>项目人数：</label>
		            <div id="range" class="controls">
		              <input name="num" class="control-text"  type="text" readonly="readonly"/>
		            </div>
		          </div>

		          <div class="control-group span9">
		            <label class="control-label"><s>*</s>备注：</label>
		            <div class="controls">
								<textarea name="remark" readonly="readonly" style="height: 24px"></textarea>
							</div>
		          </div>
		         </div>
		        
		        
		        
		       <!-- <label class="control-label ">该项目有多少需求：</label> -->
				<div class="row">
					<div class="control-group span8 ">
						<a href="requirement?id = 1"><label class="control-label">对应需求：</label></a>
					</div>
				</div>
				
					<div class="span15">
						<div id="grid2"></div>
					</div>
				
		      </form>
		    </div>
			<script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
			<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
			<script src="http://g.alicdn.com/bui/bui/1.1.17/config.js"></script>
			<script type="text/javascript">
				
				var tempFields;
				var rid = 1;
				var grid2=null;
		        BUI.use(['bui/grid','bui/data','bui/form'],function(Grid,Data,Form){
		        	
		        	if("${Type }"=="ZHUGUAN"){columns = [
		    						{title:'项目现场',dataIndex:'name',width : '20%',elCls : 'center'},
		    						{title:'项目地点',dataIndex:'location',width : '10%',elCls : 'center'},
		    						{title:'项目人数',dataIndex:'num',width : '10%',elCls : 'right'},
		    						/* {title:'开发测试',dataIndex:'direction',width : '10%',elCls : 'center'},  */
		    						{title:'备注',dataIndex:'remark',width : '50%',renderer:Grid.Format.dateRenderer,elCls : 'left'},
 		    						/* {title:'工作方向',dataIndex:'language',width : '10%',elCls : 'center'},  */
		    						{title : '操作',width : '10%',elCls : 'center',renderer : function(){
		    							 return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-edit">编辑</span><span class="grid-command btn-del" title="删除活动信息">删除</span>'
		    							}}
		    		            ]}else{
		            columns = [
						{title:'项目名称',dataIndex:'name',width:200,elCls : 'center'},
						{title:'项目地点',dataIndex:'location',width:150,elCls : 'center'},
						{title:'项目人数',dataIndex:'num',width:100,elCls : 'right'},
						{title:'备注',dataIndex:'remark',width:600,renderer:Grid.Format.dateRenderer,elCls : 'center'},
						
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
		                
		                contentId : 'content', //设置隐藏的Dialog内容
		                autoSave : true, //添加数据或者修改数据时，自动保存
	        		  	editor : {
	          		      	title : '编辑项目'
	          		  	},
		                triggerCls : 'btn-edit' //触发显示Dialog的样式
		                
		              })
		            var detail = new Grid.Plugins.DialogEditing(
							{
								contentId : 'detail',
								autoSave : true,
								editor : {
									title : '显示详情',
										  buttons : [
						      		                 {
										                text:'关闭',
										                elCls : 'button',
										                handler : function(){
										                	window.top.location.reload();
										                }
										              }
						      		  ],
								},
								triggerCls : 'btn-detail',
							})
		            var store = new BUI.Data.Store({
		                remoteSort : false,
		                pageSize:10,
		                proxy : {
		                    save : { //也可以是一个字符串，那么增删改，都会往那么路径提交数据，同时附加参数saveType
		                        addUrl : 'project/updateProject',
		                        updateUrl : 'project/updateProject',
		                       /*  callback : function(date){
		                        	alert(data.success);
		                        	store.load();
		                        } */
		                      },
		                      method : 'POST',
		                    pageStart : 1
		                  },
		                url : 'project/allProject',
		                autoLoad:true,
		                autoSync : true//保存数据后，自动更新

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
			                  text : '<i class="icon-plus" data-type="reload"></i>添加',
			                  listeners : {
			                    'click' : addFunction
			                  }
			                },{
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
		              store : store,		              
		            });
							            		           

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
			          var newData = {'name' : '请输入'};		          		              
			          editing.edit(newData,'name');  //添加记录后，直接编辑	
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
			                  url : 'project/delProject/'+ ids,
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
			          store.on('save',  function(date){
                      	alert(data.success);
                    	store.load();
                    });
			        //监听事件，删除一条记录
			        grid.on('cellclick',function(ev){
			        	var sender = $(ev.domTarget);

						if (sender.hasClass('btn-del')) {
							var record = ev.record;
							delItems([ record ]);
						}

						var record = ev.record,
						rid = record.id;
						if(grid2 != null) {
							/* var child = control.getChild(grid2);
							control.removeChild(child); */
							grid2.remove(true);
			            }
						 columns2 = [ {
								title : '人员类型',
								dataIndex : 'staff_leixing',
								width : 100,
								elCls : 'center'
							}, {
								title : '工作方向',
								dataIndex : 'work_direction',
								width : 100,
								elCls : 'center'
							},
							{
								title : '所需人数',
								dataIndex : 'work_number',
								width : 100,
								elCls : 'center'
							},
							{
								title : '工作年限',
								dataIndex : 'work_year',
								width : 100,
								elCls : 'center'
							},
							{
								title : '招聘专员',
								dataIndex : 'user_name',
								width : 100,
								elCls : 'center'
							},
							];
						 var store2 = new BUI.Data.Store(
									{
										remoteSort : false,
										pageSize : 3,
										proxy : {
											method : 'POST',
											pageStart : 1
										},
										url : 'project/allRequirement?id='+rid,
										autoLoad : true,
										autoSync : true

									});
						  grid2 = new Grid.Grid(
									{
										render : '#grid2',
										columns : columns2,
										forceFit : true,
										innerBorder : true,
										loadMask : true,
										emptyDataTpl : '<div class="centered"><h2>暂时没有需求</h2></div>',
										plugins : [ BUI.Grid.Plugins.AutoFit ],
										store : store2

									});

							grid2.render();			            
						
			        });
		            grid.render();
			       
		        });

			</script>
		</div>
	</div>
</body>
</html>