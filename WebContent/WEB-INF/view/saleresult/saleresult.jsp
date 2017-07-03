<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>销售业绩</title>
<link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css"
	rel="stylesheet" />
<link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-1.7.1.js"></script>
	
<script type="text/javascript">
	function isHasForName() {
		var applicantname = $("#applicantname").val();
		var number = $("#number").val();
		if (isNotEmpty(applicantname) && isNotEmpty(number)) {
			$.ajax({
				url : "/TXRMS/applicant/isHasForName",
				dataType : "json",
				data : {
					name : applicantname,
					number:number
				},
				success : function(data) {
					var flag = data.app.flag;
					if (flag == "0") {
						BUI.Message.Alert('应聘者表中无此姓名和手机号码的信息，请添加后再试。添加注意区分是本公司应聘人员还是外协人员', 'warning');
						$("#applicantname").val("");
						$("#work_year").val("");
						$("#report_time2").val("");
						$("#msg").val("");
						$("#applicantid").val("");//隐藏域应聘者id
					} else {
						$("#applicantid").val(data.app.id);
						$("#work_year").val(data.app.work_year);
						$("#report_time2").val(data.app.report_time2);
					}
				}
			});
		}else{
			BUI.Message.Alert('姓名、手机号码必须填写才能得到工作年限和入职时间', 'warning');
			return;
		}
	}

	function isNotEmpty(strVal) {
		if (strVal == '' || strVal == null || strVal == undefined) {
			return false;
		} else {
			return true;
		}
	}

	function getRatio() {
		var year = $("#year").val();
		var report_time2 = $("#report_time2").val();
		var price = $("#price").val();
		if (isNotEmpty(year) && isNotEmpty(report_time2) && isNotEmpty(price)) {
			$.ajax({
				url : "/TXRMS/applicant/getRatio",
				dataType : "json",
				data : {
					year : year,
					report_time2 : report_time2,
					price : price
				},
				success : function(data) {
					var str = data.app.ratio.split(";");
					$("#msg").text(str[0]);
					$("#ratio").val(str[1]);
				}
			});
		} else {
			BUI.Message.Alert('姓名、入职时间、单价必须填写才能计算系数', 'warning');
			return;
		}
	}
</script>
</head>
<body>

	<div class="demo-content" style="padding-left: 10px">

		<div class="demo-content">
			<h2>检索条件：</h2>
			<form id="searchForm" class="form-horizontal" method="post">
				<div class="row">
				<div class="span8 doc-content">
						<label class="control-label">应聘者：</label>
						<div id="s1">
						</div>
					</div>
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

			<div id="content" class="hide">
				<form action="add" method="post" class="form-horizontal">
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">年份：</label>
							<div class="controls">
								<input id="year" name="year" type="text"
									data-rules="{required:true ,number:true }"  class="input-normal control-text" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">月份：</label>
							<div class="controls">
								<input id="month" name="month" type="text"
									data-rules="{required:true ,number:true}" class="input-normal control-text" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">姓名：</label>
							<div class="controls">
								<input type="hidden" id="applicantid" name="applicantid" /> <input
									id="applicantname" name="applicantname" type="text"  onblur="isHasForName()"
									class="input-normal control-text" data-rules="{required:true}" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>手机号码：</label>
							<div class="controls">
								<input id="number" name="number" type="text" onblur="isHasForName()"
									class="input-normal control-text" data-rules="{required:true ,number:true}" />
							</div>

						</div>
						<div class="control-group span9">
							<label class="control-label">工作年限：</label>
							<div class="controls">
								<input id="work_year" name="work_year" type="text"
									class="input-normal control-text"  readonly="readonly"/>
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">入职时间：</label>
							<div class="controls">
								<input id="report_time2" name="report_time2" type="text"  readonly="readonly"
									 />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>项目现场：</label>
							<div class="controls">
								<select name="projectid" data-rules="{required:true}">
									<option value="">请选择</option>
									<c:forEach items="${xmmclist}" var="lx">
										<option value="${lx.id }">${lx.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">进项目时间：</label>
							<div class="controls">
								<input name="start_time" type="text" class="calendar" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">出项目时间：</label>
							<div class="controls">
								<input name="end_time" type="text" class="calendar" />
							</div>
						</div>
					</div>


					<div class="row">
						<div class="control-group span9">
							<label class="control-label">单价(元)：</label>
							<div class="controls">
								<input id="price" name="price" type="text" onblur="getRatio()"
									class="input-normal control-text" data-rules="{required:true}" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">系数(%)：</label>
							<div class="controls">
								<input id="ratio" name="ratio" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>

						</div>


						<div class="control-group span9">
							<span id="msg"></span>
						</div>

					</div>


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
								<input  name="year" type="text"
									readonly="readonly" class="input-normal control-text" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">月份：</label>
							<div class="controls">
								<input  name="month" type="text"
									 class="input-normal control-text" />
							</div>
						</div>
						<div class="control-group span8">
							<label class="control-label">姓名：</label>
							<div class="controls">
								 <input
									 name="applicantname" type="text"  
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>手机号码：</label>
							<div class="controls">
								<input  name="number" type="text" readonly="readonly"
									class="input-normal control-text" />
							</div>

						</div>
						<div class="control-group span9">
							<label class="control-label">工作年限：</label>
							<div class="controls">
								<input  name="work_year" type="text"
									class="input-normal control-text"  readonly="readonly"/>
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">入职时间：</label>
							<div class="controls">
								<input  name="report_time2" type="text"  readonly="readonly"
									 />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>项目现场：</label>
							<div class="controls">
								<select name="projectid" >
									<option value="">请选择</option>
									<c:forEach items="${xmmclist}" var="lx">
										<option value="${lx.id }">${lx.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">进项目时间：</label>
							<div class="controls">
								<input name="start_time" type="text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">出项目时间：</label>
							<div class="controls">
								<input name="end_time" type="text" readonly="readonly" />
							</div>
						</div>
					</div>


					<div class="row">
						<div class="control-group span9">
							<label class="control-label">单价(元)：</label>
							<div class="controls">
								<input  name="price" type="text" 
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">系数(%)：</label>
							<div class="controls">
								<input name="ratio" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>

						</div>

					</div>

					<div class="row">
						<div class="control-group span8 ">
							<label class="control-label">备注：</label>
							<div class="controls  control-row4" >
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
				BUI.use([ 'bui/select', 'bui/data' ], function(Select, Data) {

					var store = new Data.Store({
						url : 'applicant/getListByName',
						root : 'ypzs' //设置数组对应的字段 list
					});
					var suggest = new Select.Suggest({
						render : '#s1',
						name : 'applicant_name',
						store : store,
						list : {
							itemTpl : '<li>{name}</li>' // 设置列表模板
						},
						cacheable : true
					});
					suggest.render();
				});
			</script>
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
												elCls : 'left',
											},
											{
												title : '姓名',
												dataIndex : 'applicantname',
												width : '6%',
												elCls : 'center'

											},
											{
												title : '姓名id',
												dataIndex : 'applicantid',
												width : '1%',
												elCls : 'center',
												visible : false
											},
											{
												title : '手机号码',
												dataIndex : 'number',
												width : '12%',
												elCls : 'right'

											},
											{
												title : '工作年限',
												dataIndex : 'work_year',
												width : '6%',
												elCls : 'center'

											},
											{
												title : '入职时间',
												dataIndex : 'report_time2',
												width : '8%',
												elCls : 'left'

											},
											{
												title : '项目现场',
												dataIndex : 'project_name',
												width : '10%',
												elCls : 'center'

											},
											{
												title : '项目现场id',
												dataIndex : 'projectid',
												width : '1%',
												elCls : 'center',
												visible : false
											},

											{
												title : '进项目时间',
												dataIndex : 'start_time',
												width : '8%',
												elCls : 'center'

											},
											{
												title : '出项目时间',
												dataIndex : 'end_time',
												width : '8%',
												elCls : 'center'

											},
											{
												title : '单价(元)',
												dataIndex : 'price',
												width : '6%',
												elCls : 'center'

											},
											{
												title : '系数(%)',
												dataIndex : 'ratio',
												width : '6%',
												elCls : 'center'

											},
											{
												title : '提成(元)',
												dataIndex : 'ticheng',
												width : '6%',
												elCls : 'center'

											},
											{
												title : '操作',
												width : '14%',
												renderer : function() {
													if ("${type}" != "ZHUANYUAN") {
														return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-edit">编辑</span><span class="grid-command btn-del">删除</span>'
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
													title : '编辑销售业绩'
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

									var store = new BUI.Data.Store(
											{
												remoteSort : false,
												pageSize : 10,
												proxy : {
													save : {
														addUrl : 'saleresult/updateSaleResult',
														updateUrl : 'saleresult/updateSaleResult',
													},
													method : 'POST',
													pageStart : 1
												},
												url : 'saleresult/allSaleResult',
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
											b : 0,
											"ratio" : "由年份、姓名、单价自动算出"
										};
										$("#applicantname").val("");
										$("#work_year").val("");
										$("#report_time2").val("");
										$("#msg").text("");
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
																			url : 'saleresult/delSaleResult/'
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