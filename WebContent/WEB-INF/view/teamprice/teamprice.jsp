<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>业务奖惩(团队)</title>
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
					<div class="span8 doc-content">
						<label class="control-label">开始时间：</label>
						<div class="controls">
							<input name="start_time" type="text" class="calendar" />
						</div>
					</div>
					<div class="span8 doc-content">
						<label class="control-label">结束时间：</label>
						<div class="controls">
							<input name="end_time" type="text" class="calendar" />
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
			<div id="detail" class="hide">

				<!-- #grid2 -->
				<div class="row">
					<div class="control-group span3 ">
						<label class="control-label"> </label>
					</div>
					<div class="span24">
						<div id="grid2"></div>
					</div>
				</div>
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
												title : '开始时间',
												dataIndex : 'jd1_time',
												width : '20%',
												elCls : 'left',
												height : 50
											},
											{
												title : '结束时间',
												dataIndex : 'jd2_time',
												width : '20%',
												elCls : 'left',
											},
											{
												title : '预计照人',
												dataIndex : 'yz_count',
												width : '16%',
												elCls : 'center'

											},
											{
												title : '实际招人',
												dataIndex : 'sz_count',
												width : '16%',
												elCls : 'center'

											},
											{
												title : '奖惩金',
												dataIndex : 'jc_salary',
												width : '16%',
												elCls : 'center',
											},
											{
												title : '操作',
												width : '14%',
												renderer : function() {
													return '<span class="grid-command btn-detail">详情</span>';
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
													title : '编辑考核指标'
												},
												triggerCls : 'btn-edit'
											})

									var detail = new Grid.Plugins.DialogEditing(
											{
												contentId : 'detail',
												editor : {
													title : '详情',
													buttons : [/*  {
																																																			}  */],
												},
												triggerCls : 'btn-detail',
											})

									var store = new BUI.Data.Store(
											{
												remoteSort : false,
												pageSize : 10,
												proxy : {
													save : {
														addUrl : 'teamprice/updateTeamprice',
														updateUrl : 'teamprice/updateTeamprice',
													},
													method : 'POST',
													pageStart : 1
												},
												url : 'teamprice/allTeamprice',
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
												/* tbar : { //添加、删除
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
												}, */
												bbar : {
													pagingBar : false
												},
												plugins : [ BUI.Grid.Plugins.AutoFit ],
												plugins : [
														editing,
														detail,
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
																			url : 'khzb/delKhzb/'
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
									grid.on('cellclick', function(ev) {

										var sender = $(ev.domTarget);

										if (sender.hasClass('btn-del')) {
											var record = ev.record;
											delItems([ record ]);
										}

									});
									grid
											.on(
													'cellclick',
													function(ev) {
														/* var sender = $(ev.domTarget);
														if (sender
																.hasClass('btn-del')) {
															var record = ev.record;
															delItems([ record ]);
														} */
														var record = ev.record, rid = record.jd1_time
																+ "_"
																+ record.jd2_time;
														if (grid2 != null) {
															/* var child = control.getChild(grid2);
															control.removeChild(child); */
															grid2.remove(true);
														}
														columns2 = [
																{
																	title : '姓名',
																	dataIndex : 'name',
																	width : '10%',
																	elCls : 'left',
																	height : 50
																},
																{
																	title : '手机号码',
																	dataIndex : 'number',
																	width : '15%',
																	elCls : 'center',
																},
																{
																	title : '入职时间',
																	dataIndex : 'report_time2',
																	width : '15%',
																	elCls : 'center',
																},
																/* {
																	title : '一个月后时间',
																	dataIndex : 'onemonth_time',
																	width : '15%',
																	elCls : 'center'

																}, */
																{
																	title : '转正时间',
																	dataIndex : 'zhuanzheng_time',
																	width : '15%',
																	elCls : 'center'

																},
																{
																	title : '试用薪资',
																	dataIndex : 'shiyong_salary',
																	width : '13%',
																	elCls : 'center'

																},
																{
																	title : '转正薪资',
																	dataIndex : 'salary',
																	width : '13%',
																	elCls : 'center',
																},

																{
																	title : '离职时间',
																	dataIndex : 'firetime',
																	width : '14%',
																	elCls : 'center'
																},
																{
																	title : '状况',
																	dataIndex : 'is_ok',
																	width : '6%',
																	elCls : 'left',
																	renderer : function(
																			is_ok) {
																		if (is_ok == "到职") {
																			return '<span style="color:green;">'
																					+ is_ok
																					+ '</span>';
																		} else {
																			return is_ok;
																		}
																	}
																},
																{
																	title : '招聘专员',
																	dataIndex : 'user_name',
																	width : '9%',
																	elCls : 'left'
																}, ];
														var store2 = new BUI.Data.Store(
																{
																	remoteSort : false,
																	pageSize : 10,
																	proxy : {
																		method : 'POST',
																		pageStart : 1
																	},
																	url : 'teamprice/detail?id='
																			+ rid,
																	autoLoad : true,
																	autoSync : true

																});
														grid2 = new Grid.Grid(
																{
																	render : '#grid2',
																	columns : columns2,
																	forceFit : true,
																	/* emptyDataTpl : '<div class="centered"><h2>暂时没有需求</h2></div>', */
																	bbar : {
																		pagingBar : true
																	},
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