<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>首页</title>
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css" rel="stylesheet" />
  <link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css" rel="stylesheet"/>
  <script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript">
/* $(document).ready(function(){
	if("${Type }"!="ZHUGUAN"){
  $(".dl-log2").hide();}
}); */
/* $(document).ready(function(){
	if("${Type }"=="ZHUGUAN"){
  $(".dl-log").hide();}
}); */
</script>
</head>
<body>
	<div class="demo-content" style="padding-left: 10px">

		<div class="demo-content"><br/><br/>
		<div class="dl-log" style="font-size:20px" align="center"><span class="dl-log-user">
		您有<a href="requirement?us=1"> ${Require} 个任务</a>需要处理</span>
	 </div><br/>
	 <div class="dl-log2" style="font-size:20px" align="center">还有 <a href="requirement?ur=2">${Require2} 个任务</a>待分配
	 </div>	
			<br/>
			<div class="row">
				<div class="span34">
					<div id="grid">
					  
					</div>
				</div>
			</div>
			  <!-- 初始隐藏 dialog内容 -->
		    
		    
			<script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
			<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
			<script src="http://g.alicdn.com/bui/bui/1.1.17/config.js"></script>
			<script type="text/javascript">
				
				var tempFields;
			
		        BUI.use(['bui/grid','bui/data','bui/form'],function(Grid,Data,Form){
		        	columns = [
						{title:'招聘专员',dataIndex:'user_name',width:'22%',elCls : 'right'},
						{title : '项目现场',dataIndex : 'project_name',width : '20%',elCls : 'left'},
						{title : '所需人数',dataIndex : 'work_number',width : '14%',elCls : 'right'},
						{title : '创建时间',dataIndex : 'create_time',width : '22%',elCls : 'center'},
						{title : '截止时间',dataIndex : 'stop_time',width : '22%',elCls : 'center'},
		            ];
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
								autoSave : true,
								editor : {
									title : '显示详情'
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
		                url : 'first/allFirst',
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
		              emptyDataTpl : '<div class="centered"><h2>对不起，您暂时没有任务</h2></div>',
		              // 底部工具栏
			            
		              bbar:{
		                  // pagingBar:表明包含分页栏
		                  pagingBar:true
		              },
		              plugins : [BUI.Grid.Plugins.AutoFit],
		              /* plugins : [editing,detail,Grid.Plugins.CheckSelection], */
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
			          var newData = {'user_name' : '请输入用户名'};			           
			          editing.edit(newData,'user_name'); //添加记录后，直接编辑
			          store.addAt(newData,'b'); 
			          
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