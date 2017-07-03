<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>腾翔招聘管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />

</head>
<body>

	<div class="header">

		<div class="dl-title">
			<a href="http://www.builive.com" title="文档库地址" target="_blank">
				<!-- 仅仅为了提供文档的快速入口，项目中请删除链接 --> <span class="dl-title-text">腾翔招聘管理系统</span>
			</a>
		</div>

		<div class="dl-log">
			欢迎您，<span class="dl-log-user">${userName}</span><a
				href="logout" title="退出系统" class="dl-log-quit">[退出]</a>
		</div>
	</div>
	<div class="content">
		<div class="dl-main-nav">
			<div class="dl-inform">
				<div class="dl-inform-title">
					贴心小秘书<s class="dl-inform-icon dl-up"></s>
				</div>
			</div>
			<ul id="J_Nav" class="nav-list ks-clear">
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-home">首页</div></li>
			</ul>
		</div>
		<ul id="J_NavContent" class="dl-tab-conten">

		</ul>
	</div>
	<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bui.js"></script>
	<script type="text/javascript" src="assets/js/config.js"></script>

	<script>
     BUI.use('common/main',function(){
    	
      var config = [{
          id:'menu', 
          homePage : 'first',       
          menu:[
                 {
                 text:'功能菜单',
                items:[
                {id:'first',text:'首页',href:'first'},
                
                <c:if test="${flag eq 1 }">
                {id:'userList',text:'用户管理',href:'user'},
                {id:'projectList',text:'项目信息',href:'project'},
                </c:if>
                
                {id:'requirement',text:'需求管理',href:'requirement'},
                {id:'applicant',text:'应聘者信息',href:'applicant'}
                
                 ]
                 },
                 
                 <c:if test="${flag eq 1 }">
              {
                  text:'系统设置',
                  items:[
                    {id:'tree',text:'数据树',href:'tree'}
                  ]
                },
              </c:if>
                
                {
                    text:'业务拓展',
                   items:[
                   {id:'lyry',text:'录用人员',href:'lyry'}, 
                   <c:if test="${flag eq 1 }">
                   {id:'teamprice',text:'季度-团队招人考核',href:'teamprice'},
                   {id:'teamsaleprice',text:'月-团队销售额',href:'teamsaleprice'},
                   {id:'saleresult',text:'销售业绩',href:'saleresult'},
                   {id:'projecttarget',text:'项目接单',href:'projecttarget'},
                   {id:'personal',text:'个人业务统计',href:'personal'},
                   {id:'khzb',text:'年度考核指标',href:'khzb'},
                   {id:'businessteam',text:'团队分成系数',href:'businessteam'},
                   {id:'businesspersonal',text:'个人业务提成系数',href:'businesspersonal'},
                   {id:'fpxs',text:'个人分配系数',href:'fpxs'},
                   {id:'meeting',text:'会议记录导入',href:'meeting'}
                   </c:if>
                    ]
                  }
              
              	]
          }];
      
      
      new PageUtil.MainPage({
          modulesConfig : config
        });
      }); 
  </script>


</body>
</html>
