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
					<div class="span8 doc-content">
						<label class="control-label">年份：</label>
						<div class="controls">
							<input type="text" name="year" class="control-text" />
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
							<label class="control-label">年份：</label>
							<div class="controls">
								<input name="year" type="text" data-rules="{required:true ,number:true }"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">月份：不输入按年计</label>
							<div class="controls">
								<input name="month" type="text" data-rules="{required:true ,number:true}"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">预计招聘人数：</label>
							<div class="controls">
								<input name="count" type="text" data-rules="{required:true ,number:true}"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<!-- <div class="row">
						<div class="control-group span9">
							<label class="control-label">录入时间：</label>
							<div class="controls">
								<input name="create_time" type="text" class="calendar" />
							</div>
						</div>
					</div> -->
					<div class="row">
						<div class="control-group span8 ">
							<label class="control-label">备注：</label>
							<div class="controls  control-row4">
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
							<label class="control-label">年份：</label>
							<div class="controls">
								<input name="year" type="text" class="input-normal control-text"
									readonly="readonly" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">月份：</label>
							<div class="controls">
								<input name="month" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span8">
							<label class="control-label">预计招聘人数：</label>
							<div class="controls">
								<input name="count" type="text" readonly="readonly"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<!-- <div class="row">
						<div class="control-group span9">
							<label class="control-label">录入时间：</label>
							<div class="controls">
								<input name="create_time" type="text" class="calendar" readonly="readonly" />
							</div>
						</div>
					</div> -->
					<div class="row">
						<div class="control-group span8 ">
							<label class="control-label">备注：</label>
							<div class="controls  control-row4">
								<textarea name="beizhu" readonly="readonly"></textarea>
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
												title : '年度',
												dataIndex : 'year',
												width : '6%',
												elCls : 'left',
												height : 50
											},
											{
												title : '月份',
												dataIndex : 'month',
												width : '6%',
												elCls : 'right',
											},
											{
												title : '预计招聘人数',
												dataIndex : 'count',
												width : '12%',
												elCls : 'right'

											},
											{
												title : '创建人',
												dataIndex : 'user_name',
												width : '12%',
												elCls : 'center'

											},
											{
												title : '创建人id',
												dataIndex : 'creator',
												width : '12%',
												elCls : 'center',
												visible : false
											},

											{
												title : '创建时间',
												dataIndex : 'create_time',
												width : '12%',
												elCls : 'center'
											},
											{
												title : '备注',
												dataIndex : 'beizhu',
												width : '24%',
												elCls : 'left'
											},
											{
												title : '操作',
												width : '14%',
												renderer : function() {
													if ("${type}" != "ZHUANYUAN") {
														return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-edit">编辑</span><span class="grid-command btn-del" title="删除活动信息">删除</span>'
													} else {
														return '<span class="grid-command btn-detail">详情</span>';
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
										pageSize : 10,
										proxy : {
											save : {
												addUrl : 'hkzb/updateKhzb',
												updateUrl : 'khzb/updateKhzb',
											},
											method : 'POST',
											pageStart : 1
										},
										url : 'khzb/allKhzb',
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
									grid.render();
								});
			</script>
		</div>
	</div>
</body>
</html>