<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>需求管理</title>
<link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css"
	rel="stylesheet" />
<link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.7.1.js"></script>
</head>
<body>

	<div class="demo-content" style="padding-left: 10px">
		<div class="demo-content">
			<h2>检索条件：</h2>
			<form id="searchForm" class="form-horizontal" method="post">
				<div class="row">
					<div class="span9 doc-content">
						<label class="control-label">人员类型:</label>
						<div class="controls">
							<select name="staff_leixing"><option value="">请选择</option>
								<c:forEach items="${rylxlist}" var="lx">
									<option value="${lx.c_name}">${lx.c_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="span9 doc-content">
						<label class="control-label">工作方向：</label>
						<div class="controls">
							<select name="work_direction"><option value="">请选择</option>
								<c:forEach items="${gzfxlist}" var="lx">
									<option value="${lx.c_name}">${lx.c_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="span9 doc-content">
						<label class="control-label">项目现场：</label>
						<div class="controls">
							<select name="project_name"><option value="">请选择</option>
								<c:forEach items="${xmmclist}" var="lx">
									<option value="${lx.name}">${lx.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="span8 doc-content">
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
						<div class="control-group span9">
							<label class="control-label"><s>*</s>人员类型：</label>
							<div class="controls">
								<select name="staff_leixing" data-rules="{required:true}">
									<option value="">请选择</option>
									<c:forEach items="${rylxlist}" var="rylx">
										<option value="${rylx.c_name}">${rylx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">工作年限：</label>
							<div class="controls">
								<input name="work_year" type="text"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span9 ">
							<label class="control-label">工作方向：</label>
							<div class="controls">
								<select name="work_direction"><option value="">请选择</option>
									<c:forEach items="${gzfxlist}" var="gzfx">
										<option value="${gzfx.c_name}">${gzfx.c_name}</option>
									</c:forEach></select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label" data-rules="{required:true,number:true}">所需人数：</label>
							<div class="controls">
								<input name="work_number" type="text"
									data-rules="{number : true}" class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>项目现场：</label>
							<div class="controls">
								<select name="project_name" data-rules="{required:true}"><option
										value="">请选择</option>
									<c:forEach items="${xmmclist}" var="lx">
										<option value="${lx.name }">${lx.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">截止时间：</label>
							<div class="controls">
								<input name="stop_time" type="text" class="calendar" />
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="span9 doc-content">
							<label class="control-label">状态：</label>
							<div class="controls">
								<select name="status"><option value="">请选择</option>
									<c:forEach items="${wcztlist}" var="wczt">
										<option value="${wczt.c_name }">${wczt.c_name}</option>
									</c:forEach></select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8 ">
							<label class="control-label">备注：</label>

							<div class="controls  control-row4">
								<textarea name="remark"></textarea>
							</div>
						</div>
					</div>
				</form>

			</div>


			<div id="detail" class="hide">
				<form action="detail" method="post" class="form-horizontal">
					<div class="row">
						<div class="control-group span3 ">
							<label class="control-label"> </label>
						</div>
						<!-- 				</div>
				<div class="row"> -->
						<div class="span24">
							<div id="grid2"></div>
						</div>
					</div>
					<br />
					<div></div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">人员类型：</label>
							<div class="controls">
								<input name="staff_leixing" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
						<!-- 					</div>
					<div class="row"> -->
						<div class="control-group span8">
							<label class="control-label">工作年限：</label>
							<div class="controls">
								<input name="work_year" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
						<!-- 					</div>
					<div class="row"> -->
						<div class="control-group span8 ">
							<label class="control-label">工作方向：</label>
							<div class="controls">
								<input name="work_direction" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">所需人数：</label>
							<div class="controls">
								<input name="work_number" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
						<!-- 					</div>
					<div class="row"> -->
						<div class="control-group span8">
							<label class="control-label">创建时间：</label>
							<div class="controls">
								<input name="create_time" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
						<!-- 					</div>
					<div class="row"> -->
						<div class="control-group span8">
							<label class="control-label">截止时间：</label>
							<div class="controls">
								<input name="stop_time" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">招聘专员：</label>
							<div class="controls">
								<input name="user_name" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
						<!-- 					</div>
					<div class="row"> -->
						<!-- 						<div class="span9 doc-content">
							<label class="control-label">完成状态：</label>
							<div class="controls">
								<input name="status" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div> -->
						<!-- 					</div>
					<div class="row"> -->
						<div class="control-group span98">
							<label class="control-label">备注：</label>

							<div class="controls">
								<textarea name="remark" readonly="readonly" style="height: 24px"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span3 ">
							<label class="control-label"> </label>
						</div>
						<!-- 				</div>
				<div class="row"> -->
						<div class="span24">
							<div id="grid3"></div>
						</div>
					</div>
				</form>
			</div>


			<div id="zhuangtai" class="hide">
				<form action="zhuangtai" method="post" class="form-horizontal">


					<div class="hide">
						<div class="control-group span9">
							<label class="control-label"><s>*</s>人员类型：</label>
							<div class="controls">
								<select name="staff_leixing" data-rules="{required:true}">
									<c:forEach items="${rylxlist}" var="rylx">
										<option value="${rylx.c_name}">${rylx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span9">
							<label class="control-label">工作年限：</label>
							<div class="controls">
								<input name="work_year" type="text"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span9 ">
							<label class="control-label">工作方向：</label>
							<div class="controls">
								<select name="work_direction"><option value="">请选择</option>
									<c:forEach items="${gzfxlist}" var="gzfx">
										<option value="${gzfx.c_name}">${gzfx.c_name}</option>
									</c:forEach></select>
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span8">
							<label class="control-label">所需人数：</label>
							<div class="controls">
								<input name="work_number" type="text"
									data-rules="{number : true}" class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>项目现场：</label>
							<div class="controls">
								<select name="project_name" data-rules="{required:true}">
									<c:forEach items="${xmmclist}" var="lx">
										<option value="${lx.name }">${lx.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span9">
							<label class="control-label">截止时间：</label>
							<div class="controls">
								<input name="stop_time" type="text" class="calendar" />
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span8 ">
							<label class="control-label">备注：</label>

							<div class="controls  control-row4">
								<textarea name="remark"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label">状态：</label>
							<div class="controls">
								<select name="status"><option value="">请选择</option>
									<c:forEach items="${wcztlist}" var="lx">
										<option value="${lx.c_name }">${lx.c_name}</option>
									</c:forEach></select>
							</div>
						</div>
					</div>
				</form>
			</div>


			<div id="fenpei" class="hide">
				<form action="fenpei" method="post" class="form-horizontal">

					<div class="hide">
						<div class="control-group span9">
							<label class="control-label"><s>*</s>人员类型：</label>
							<div class="controls">
								<select name="staff_leixing" data-rules="{required:true}">
									<c:forEach items="${rylxlist}" var="rylx">
										<option value="${rylx.c_name}">${rylx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span9">
							<label class="control-label">工作年限：</label>
							<div class="controls">
								<input name="work_year" type="text"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span9 ">
							<label class="control-label">工作方向：</label>
							<div class="controls">
								<select name="work_direction"><option value="">请选择</option>
									<c:forEach items="${gzfxlist}" var="gzfx">
										<option value="${gzfx.c_name}">${gzfx.c_name}</option>
									</c:forEach></select>
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span8">
							<label class="control-label">所需人数：</label>
							<div class="controls">
								<input name="work_number" type="text"
									data-rules="{number : true}" class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>项目现场：</label>
							<div class="controls">
								<select name="project_name" data-rules="{required:true}">
									<c:forEach items="${xmmclist}" var="lx">
										<option value="${lx.name }">${lx.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span9">
							<label class="control-label">截止时间：</label>
							<div class="controls">
								<input name="stop_time" type="text" class="calendar" />
							</div>
						</div>
					</div>
					<div class="hide">
						<div class="control-group span8 ">
							<label class="control-label">备注：</label>

							<div class="controls  control-row4">
								<textarea name="remark"></textarea>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="control-group span9">
							<label class="control-label">招聘专员：</label>
							<div class="controls">
								<select name="user_name"><option value="">请选择</option>
									<c:forEach items="${zpzylist}" var="lx">
										<option value="${lx.user_name}">${lx.user_name}</option>
									</c:forEach></select>
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
				var rid = 1;
				var grid2 = null;
				var grid3 = null;
				BUI
						.use(
								[ 'bui/grid', 'bui/data', 'bui/form',
										'bui/overlay' ],
								function(Grid, Data, Form, Overlay) {
									columns = [
											{
												title : '人员类型',
												dataIndex : 'staff_leixing',
												width : '6%',
												elCls : 'left',
												height : 50
											},
											{
												title : '工作年限',
												dataIndex : 'work_year',
												width : '6%',
												elCls : 'right',
											},
											{
												title : '工作方向',
												dataIndex : 'work_direction',
												width : '6%',
												elCls : 'left'

											},
											{
												title : '所需人数',
												dataIndex : 'work_number',
												width : '6%',
												elCls : 'right'
											},
											{
												title : '项目现场',
												dataIndex : 'project_name',
												width : '12%',
												elCls : 'left'
											},
											{
												title : '招聘专员',
												dataIndex : 'user_name',
												width : '6%',
												elCls : 'left'
											},
											{
												title : '创建时间',
												dataIndex : 'create_time',
												width : '12%',
												elCls : 'center'
											},
											{
												title : '截止时间',
												dataIndex : 'stop_time',
												width : '8%',
												elCls : 'center'
											},
											/* 											{
											 title : '已招聘人数',
											 dataIndex : 'status',
											 width : '6%',
											 elCls : 'left',
											 height : 50
											 }, */
											{
												title : '备注',
												dataIndex : 'remark',
												width : '24%',
												elCls : 'left'
											},
											{
												title : '操作',
												width : '14%',
												renderer : function() {
													if ("${type}" != "ZHUANYUAN") {
														return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-edit">编辑</span><span class="grid-command btn-del" title="删除活动信息">删除</span><span class="grid-command btn-fenpei" title="分配招聘专员">分配</span><span class="grid-command btn-qiang" title="抢任务">我要抢</span>'
													} else {
														return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-qiang" title="抢任务">我要抢</span>';
													}
												}
											} ];

									var editing = new Grid.Plugins.DialogEditing(
											{
												listeners : {
													accept : function(ev) {
														store.load();
													},
													cancel : function(ev) {
														store.load();
													},
												},
												contentId : 'content',
												autoSave : true,
												editor : {
													title : '编辑需求'
												},
												triggerCls : 'btn-edit'
											})

									var zhuangtai = new Grid.Plugins.DialogEditing(
											{
												listeners : {
													accept : function(ev) {
														store.load();
													},
													cancel : function(ev) {
														store.load();
													},
												},
												contentId : 'zhuangtai',
												autoSave : true,
												editor : {
													title : '完成状态'
												},
												triggerCls : 'btn-zhuangtai',
											})

									var fenpei = new Grid.Plugins.DialogEditing(
											{
												listeners : {
													accept : function(ev) {
														store.load();
													},
													cancel : function(ev) {
														store.load();
													},
												},
												contentId : 'fenpei',
												autoSave : true,
												editor : {
													title : '分配招聘专员'
												},
												triggerCls : 'btn-fenpei'
											})

									var detail = new BUI.Grid.Plugins.DialogEditing(
											{
												listeners : {
													cancel : function(ev) {
														window.top.location
																.reload();
													},
												},
												contentId : 'detail',
												editor : {
													title : '查看详情',
													buttons : [ {
														text : '关闭',
														elCls : 'button',
														handler : function() {
															window.top.location
																	.reload();
														}
													} ],
												},
												triggerCls : 'btn-detail',
											})

									var store = new BUI.Data.Store(
											{
												remoteSort : false,
												pageSize : 10,
												proxy : {
													save : {
														addUrl : 'requirement/updateRequirement',
														updateUrl : 'requirement/updateRequirement',
													},
													method : 'POST',
													pageStart : 1
												},
												url : 'requirement/allRequirement',
												autoLoad : true,
												autoSync : true

											});

									grid = new Grid.Grid(
											{
												render : '#grid',
												columns : columns,
												forceFit : true,
												innerBorder : true,
												emptyDataTpl : '<div class="centered"><h2>暂时没有数据</h2></div>',
												// 底部工具栏
												tbar : { //添加、删除
													items : [
															{
																btnCls : 'button button-small',
																text : '<i class="icon-plus"></i>添加',
																listeners : {
																	'click' : addFunction

																}
															},
															{
																btnCls : 'button button-small',
																text : '<i class="icon-white icon-trash"></i>批量刪除',
																listeners : {
																	'click' : delFunction
																}
															} ]
												},
												bbar : {
													pagingBar : true
												},
												plugins : [ BUI.Grid.Plugins.AutoFit ],
												plugins : [
														editing,
														detail,
														fenpei,
														zhuangtai,
														Grid.Plugins.CheckSelection ],

												store : store

											});

									//创建表单，表单中的日历，不需要单独初始化
									var form = new BUI.Form.HForm({
										srcNode : '#searchForm',
										method : {
											view : true,
											value : 'post'
										}
									}).render();

									form.on('beforesubmit', function(ev) {
										//序列化成对象
										var obj = form.serializeToObject();
										obj.start = 0; //返回第一页
										store.load(obj);
										return false;
									});

									//添加记录
									function addFunction() {
										var newData = {
											b : 0
										};

										editing.edit(newData, 'a');
										//添加记录后，直接编辑

									}

									/**
									    抢任务
									 **/
									function qiangItems(items) {
										var ids = "";
										var count = 0;
										var username = "";
										BUI.each(items, function(item) {
											if (count == 0) {
												ids = item.id;
												username = item.user_name;
											} else {
												ids += "-" + item.id;
												username += "_"
														+ item.user_name;
											}
											count++;
										});
										if (username != "" && username != "未分配") {
											BUI.Message.Alert('需求已有招聘专员负责',
													'warning');
											return;
										}
										if (ids != "") {
											BUI.Message
													.Confirm(
															'确认要抢走此任务吗？',
															function() {
																$
																		.ajax({
																			url : 'requirement/qiangRequirement/'
																					+ ids,
																			success : function(
																					data) {
																				if (data.success) {
																					BUI.Message
																							.Alert('任务抢成功！');
																					//store
																					//		.remove(items);
																					window.top.location
																							.reload();
																				} else {
																					BUI.Message
																							.Alert('任务抢失败！');
																					window.top.location
																							.reload();
																				}
																			}
																		});
															});
										}
									}

									//删除选中的记录
									function delFunction() {
										var selections = grid.getSelection();
										delItems(selections);
									}

									function delItems(items) {
										var ids = "";
										var count = 0;
										BUI.each(items, function(item) {
											if (count == 0) {
												ids = item.id;
											} else {
												ids += "-" + item.id;
											}
											count++;
										});
										if (ids != "") {
											BUI.Message
													.Confirm(
															'确认要删除选中的记录么？',
															function() {
																$
																		.ajax({
																			url : 'requirement/delRequirement/'
																					+ ids,
																			success : function(
																					data) {
																				if (data.success) {
																					BUI.Message
																							.Alert('删除成功！');
																					store
																							.remove(items);
																					window.top.location
																							.reload();
																				} else {
																					BUI.Message
																							.Alert('删除失败！');
																					window.top.location
																							.reload();
																				}
																			}
																		});
															});
										}
									}

									//监听事件，删除一条记录
									grid
											.on(
													'cellclick',
													function(ev) {

														var sender = $(ev.domTarget);

														if (sender
																.hasClass('btn-del')) {
															var record = ev.record;
															delItems([ record ]);
														}
														if (sender
																.hasClass('btn-qiang')) {
															var record = ev.record;
															qiangItems([ record ]);
														}

														var record = ev.record, rid = record.id;
														if (grid2 != null) {
															/* var child = control.getChild(grid2);
															control.removeChild(child); */
															grid2.remove(true);
														}
														if (grid3 != null) {
															/* var child = control.getChild(grid3);
															control.removeChild(child); */
															grid3.remove(true);
														}

														columns2 = [
																{
																	title : '项目现场',
																	dataIndex : 'name',
																	width : '33%',
																	elCls : 'center'
																},
																{
																	title : '项目地点',
																	dataIndex : 'location',
																	width : '33%',
																	elCls : 'center'
																},
																{
																	title : '项目人数',
																	dataIndex : 'num',
																	width : '33%',
																	elCls : 'center'
																}, ];

														columns3 = [
																{
																	title : '姓名',
																	dataIndex : 'name',
																	width : '10%',
																	elCls : 'left',
																},
																{
																	title : '联系方式',
																	dataIndex : 'number',
																	width : '10%',
																	elCls : 'right'
																},
																{
																	title : '薪资',
																	dataIndex : 'salary',
																	width : '10%',
																	elCls : 'center'
																},
																{
																	title : '工作年限',
																	dataIndex : 'work_year',
																	width : '10%',
																	elCls : 'right'
																},
																{
																	title : '职位',
																	dataIndex : 'postion',
																	width : '10%',
																	elCls : 'left'
																},
																{
																	title : '初试时间',
																	dataIndex : 'interview_time',
																	width : '10%',
																	elCls : 'left'
																},
																{
																	title : '复试时间',
																	dataIndex : 'reinterview_time',
																	width : '10%',
																	elCls : 'center'
																},
																{
																	title : '面试官',
																	dataIndex : 'interview_man',
																	width : '10%',
																	elCls : 'left'
																},
																{
																	title : '状态',
																	dataIndex : 'is_ok',
																	width : '10%',
																	elCls : 'left'
																},
																{
																	title : '招聘专员',
																	dataIndex : 'user_name',
																	width : '10%',
																	elCls : 'left'
																}, ];

														store2 = new BUI.Data.Store(
																{
																	remoteSort : false,
																	pageSize : 1,
																	proxy : {
																		method : 'POST',
																		pageStart : 1
																	},
																	url : 'requirement/allProject?id='
																			+ rid,
																	autoLoad : true,
																	autoSync : true

																});

														grid2 = new Grid.Grid(
																{
																	render : '#grid2',
																	columns : columns2,
																	forceFit : true,
																	emptyDataTpl : '<div class="centered"><h2>暂时没有数据</h2></div>',
																	store : store2

																});

														grid2.render();

														var store3 = new BUI.Data.Store(
																{
																	remoteSort : false,
																	pageSize : 1,
																	proxy : {
																		method : 'POST',
																		pageStart : 1
																	},
																	url : 'requirement/allApplicant?id='
																			+ rid,
																	autoLoad : true,
																	autoSync : true

																});

														grid3 = new Grid.Grid(
																{
																	render : '#grid3',
																	columns : columns3,
																	forceFit : true,
																	emptyDataTpl : '<div class="centered"><h2>该需求没有与之对应的应聘者</h2></div>',
																	bbar : {
																		pagingBar : true
																	},
																	store : store3

																});

														grid3.render();

													});
									grid.render();
								});
			</script>
		</div>
	</div>
</body>
</html>