<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>业务方面（个人）</title>
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css" rel="stylesheet" />
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css" rel="stylesheet"/>
 
</head>
<body>

	<div class="demo-content" style="padding-left: 10px">

		<div class="demo-content">		
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
		            <label class="control-label"><s>*</s>最低（万元）：</label>
		            <div class="controls">
		              <input name="minsale" type="text" data-rules="{required:true ,number:true}" class="input-normal control-text"/>
		            </div>
		          </div>
		        </div> 
		        
		        <div class="row">
		          <div class="span9 doc-content">
			 	 	<label class="control-label"><s>*</s>到（万元）：</label>
			 	 		<div class="controls">
              				<input name="maxsale" type="text" data-rules="{required:true ,number:true}" class="input-normal control-text"/>
            			</div>
			 	 </div>       
		        </div>
		         <div class="row">
		          <div class="control-group span8">
		            <label class="control-label"><s>*</s>提成（百分比）：</label>
		            <div class="controls">
		              	<input name="ratio" type="text" data-rules="{required:true ,number:true}" class="input-normal control-text"></input>
		            </div>
		          </div>
		        </div>
		        <div class="row">
		          <div class="control-group span8">
		            <label class="control-label">备注：</label>
		            <div class="controls control-row4">
		              	<textarea name="beizhu"></textarea>
		            </div>
		          </div>
		        </div> 	 		        
		      </form>	      
		    </div>
		    
		    <div id="detail" class="hide">
				<form action="detail" method="post" class="form-horizontal">

					<div class="row">
						<div class="control-group span9">
							<label class="control-label">最低（万元）：</label>
							<div class="controls">
								<input name="minsale" type="text" 
									class="input-normal control-text" readonly="readonly"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">到（万元）：</label>
							<div class="controls">
								<input name="maxsale" type="text" 
									class="input-normal control-text" readonly="readonly"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span9 ">
							<label class="control-label">提成（百分比）：</label>
							<div class="controls">
                                <input name="ratio" type="text" 
									class="input-normal control-text" readonly="readonly"/>
							</div>
						</div>
					</div>
					<div class="row">
		          <div class="control-group span8">
		            <label class="control-label"><s></s>备注：</label>
		            <div class="controls control-row4">
		              	<textarea name="beizhu" data-rules="{required:false}"></textarea>
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
		   						{title:'最低（万元）',dataIndex:'minsale',width:'8%',elCls : 'center'},
		   						{title:'到（万元）',dataIndex:'maxsale',width:'8%', elCls : 'left'},	   					
		   						{title:'提成（%）',dataIndex:'ratio',width:'10%',elCls : 'center'},
		   						{title:'备注',dataIndex:'beizhu',width:'35%',elCls : 'center'},
		   						{title : '操作',width : '20%',renderer : function(){
		   						 return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-edit">编辑</span><span class="grid-command btn-del" title="删除活动信息">删除</span>'
		   						},height : 20}] 
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
								/*contentId : 'detail',
								autoSave : true,
								editor : {
									title : '显示详情'
								},*/
								triggerCls : 'btn-detail',
							})
		            var store = new BUI.Data.Store({
		                remoteSort : false,
		                pageSize:10,
		                proxy : {
		                    save : { //也可以是一个字符串，那么增删改，都会往那么路径提交数据，同时附加参数saveType
		                        addUrl : 'businesspersonal/updateBusinessPersonal',
		                        updateUrl : 'businesspersonal/updateBusinessPersonal',		                       
		                      },
		                      method : 'POST',
		                    pageStart : 1
		                  },
		                url : 'businesspersonal/allBusinessPersonal',
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
			        	var newData = {
								b : 0
							};

							editing.edit(newData, 'a');
							//添加记录后，直接编辑		      		          
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
			                  url : 'businesspersonal/delBusinessPersonal/'+ ids,
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
			        grid.render();
		        });
		        

			</script>
		</div>
	</div>
</body>
</html>