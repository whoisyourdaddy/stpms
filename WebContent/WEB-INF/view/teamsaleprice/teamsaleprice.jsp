<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>团队销售</title>
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
					<div class="span8 doc-content">
						<label class="control-label">月份：</label>
						<div class="controls">
							<input type="text" name="month" class="control-text" />
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
												title : '月销售总额(元)',
												dataIndex : 'monthsaleprice',
												width : '12%',
												elCls : 'center'

											},
											{
												title : '月销售提成(元)',
												dataIndex : 'monthsaleticheng',
												width : 'center%',
												elCls : 'center'

											},
											{
												title : '操作',
												width : '14%',
												renderer : function() {
													return '<span class="grid-command btn-detail">详情</span>'
												}
											} ];

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

									var store = new BUI.Data.Store(
											{
												remoteSort : false,
												pageSize : 10,
												proxy : {
													save : {
														addUrl : 'teamsaleprice/updateKhzb',
														updateUrl : 'teamsaleprice/updateKhzb',
													},
													method : 'POST',
													pageStart : 1
												},
												url : 'teamsaleprice/allTeamSalePrice',
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
												bbar : {
													pagingBar : true
												},
												plugins : [ BUI.Grid.Plugins.AutoFit ],
												plugins : [
														detail,
														Grid.Plugins.CheckSelection ],

												store : store

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
														var record = ev.record, rid = record.year+"_"+record.month;
														if (grid2 != null) {
															/* var child = control.getChild(grid2);
															control.removeChild(child); */
															grid2.remove(true);
														}
														columns2 = [
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
																	elCls : 'left',
																},
																{
																	title : '姓名',
																	dataIndex : 'applicantname',
																	width : '8%',
																	elCls : 'center'

																},
																
																{
																	title : '工作年限',
																	dataIndex : 'work_year',
																	width : '8%',
																	elCls : 'center'

																},
																{
																	title : '入职时间',
																	dataIndex : 'report_time2',
																	width : '10%',
																	elCls : 'left'

																},
																{
																	title : '项目现场',
																	dataIndex : 'project_name',
																	width : '15%',
																	elCls : 'center'

																},

																{
																	title : '进项目时间',
																	dataIndex : 'start_time',
																	width : '10%',
																	elCls : 'center'

																},
																{
																	title : '出项目时间',
																	dataIndex : 'end_time',
																	width : '10%',
																	elCls : 'center'

																},
																{
																	title : '单价(元)',
																	dataIndex : 'price',
																	width : '10%',
																	elCls : 'center'

																},
																{
																	title : '系数(%)',
																	dataIndex : 'ratio',
																	width : '8%',
																	elCls : 'center'

																},
																{
																	title : '提成(元)',
																	dataIndex : 'ticheng',
																	width : '15%',
																	elCls : 'center'

																} ];
														var store2 = new BUI.Data.Store(
																{
																	remoteSort : false,
																	pageSize : 10,
																	proxy : {
																		method : 'POST',
																		pageStart : 1
																	},
																	url : 'teamsaleprice/detail?id='
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