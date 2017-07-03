<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>应聘者管理</title>
<link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/dpl.css"
	rel="stylesheet" />
<link href="http://g.alicdn.com/bui/bui/1.1.9/css/bs3/bui.css"
	rel="stylesheet" />
	<script type="text/javascript">
	function isHasForNam() {
		var name = $("#name").val();
		var number = $("#number").val();
		if (isNotEmpty(name) && isNotEmpty(number)) {
			$.ajax({
				url : "/TXRMS/applicant/isHasForNam",
				dataType : "json",
				data : {
					name : name,
					number:number
				},
				success : function(data) {
					var flag = data.app.flag;
					if (flag == "1") {
						BUI.Message.Alert('应聘者表中已有此人记录，无需添加!', 'warning');
						$("#name").val("");
						return  ;
					} /* else {
						BUI.Message.Alert('应聘者表中无此姓名和手机号码的信息，可以添加', 'warning');
					} */
				}
			});
		}
	}

	function isNotEmpty(strVal) {
		if (strVal == '' || strVal == null || strVal == undefined) {
			return false;
		} else {
			return true;
		}
	}

	
</script>

</head>
<body>

	<div class="demo-content" style="padding-left: 10px">
		<h2>检索条件</h2>
		<div class="demo-content">
			<form id="searchForm" class="form-horizontal" method="post">
			<div class="span8 doc-content">
						<label class="control-label">应聘者：</label>
						<div id="s2">
						</div>
					</div>
				<div class="row">
					<div class="span8 doc-content">
						<label class="control-label">招聘专员：</label>
						<div class="controls">
							<input type="text" name="user_name" class="control-text" />
						</div>
					</div>
					<div class="span9 doc-content">
						<label class="control-label">对应需求：</label>
						<div class="controls">
							<select name="project_name"><option value="">请选择</option>
								<c:forEach items="${zslist}" var="lx">
									<option value="${lx.text}">${lx.text}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="span9 doc-content">
						<label class="control-label">状态：</label>
						<div class="controls">
							<select name="is_ok">
								<option value="">请选择</option>
								<c:forEach items="${ztlist}" var="lx">
									<option value="${lx.c_name}">${lx.c_name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="span8 doc-content">
						<label class="control-label">应聘者手机号码：</label>
						<div class="controls">
							<input type="text" name="number" class="control-text" />
						</div>
					</div>
					<div class="span8 doc-content">
						<label class="control-label">工作意向(备注)：</label>
						<div class="controls">
							<input type="text" name="advice" class="control-text" />
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
			
			<!-- #grid data -->
			<div class="row">
				<div class="span34">
					<div id="grid"></div>
				</div>
			</div>

			<!-- 添加开始 -->
			<div id="content" class="hide" style="autoScroll: true">
				<form action="add" method="post" class="form-horizontal">

					<div class="row">
						<div class="control-group span8">
							<label class="control-label">姓名：</label>
							<div class="controls">
								 <input
									id="name" name="name" type="text"  onblur="isHasForNam()"
									class="input-normal control-text" data-rules="{required:true}" />
							</div>
						</div>
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>手机号码：</label>
							<div class="controls">
								<input id="number" name="number" type="text" onblur="isHasForNam()"
									class="input-normal control-text" data-rules="{required:true ,number:true}" />
							</div>

						</div>
						<div class="control-group span9">
							<label class="control-label">工作年限：</label>
							<div class="controls">
								<input name="work_year" type="text"
									class="input-normal control-text" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">年龄：</label>
							<div class="controls">
								<input name="age" type="text" data-rules="{number : true}"
									class="input-normal control-text" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">毕业时间：</label>
							<div class="controls">
								<input name="graduate_time" type="text" class="calendar" />
							</div>
						</div>

						<div class="control-group span9">
							<label class="control-label">Email：</label>
							<div class="controls">
								<input name="email" type="text" data-rules="{email : true}"
									class="input-normal control-text" />
							</div>
						</div>



					</div>
					<div class="row">

						<div class="span9 doc-content">
							<label class="control-label">学历：</label>
							<div class="controls">
								<select name="level">
									<c:forEach items="${xllist}" var="lx">
										<option value="${lx.c_name}">${lx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="span9 doc-content">
							<label class="control-label">日语等级：</label>
							<div class="controls">
								<select name="japan_level"><option value="">请选择</option>
									<c:forEach items="${rydjlist}" var="lx">
										<option value="${lx.c_name}">${lx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">转正薪资：</label>
							<div class="controls">
								<input name="salary" type="text"
									class="input-normal control-text" />
							</div>
						</div>

					</div>
					<div class="row">

						<div class="span9 doc-content">
							<label class="control-label">试用薪资：</label>
							<div class="controls">
								<div class="controls">
								<input name="shiyong_salary" type="text"
									class="input-normal control-text" />
							</div>
							</div>
						</div>

						<div class="span9 doc-content">
							<label class="control-label">转正日期：</label>
							<div class="controls">
								<input name="zhuanzheng_time" type="text" class="calendar" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">离职时间：</label>
							<div class="controls">
								<input name="firetime" type="text" class="calendar" />
							</div>
						</div>

					</div>


					<div class="row">
						<div class="control-group span9">
							<label class="control-label">职位：</label>
							<div class="controls">
								<input name="postion" type="text"
									class="input-normal control-text" />
							</div>
						</div>
						<div class="span9 doc-content">
							<label class="control-label">状态：</label>
							<div class="controls">
								<select name="is_ok">
									<option value="">请选择</option>
									<c:forEach items="${ztlist}" var="lx">
										<option value="${lx.c_name}">${lx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">面试官：</label>
							<div class="controls">
								<input name="interview_man" type="text"
									class="input-normal control-text" />
							</div>
						</div>

					</div>
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">初试方式：</label>
							<div class="controls">
								<select name="interview_id">
									<c:forEach items="${msfslist}" var="lx">
										<option value="${lx.c_name}">${lx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">初试时间：</label>
							<div class="controls">
								<input name="interview_time" type="text" class="calendar" />
							</div>
						</div>
						<div class="span9 doc-content">
							<label class="control-label">复试现场：</label>
							<div class="controls">
								<select name="is_interview">
									<option value="">请选择</option>
									<c:forEach items="${zslist}" var="lx">
										<option value="${lx.text}">${lx.text}</option>
									</c:forEach>
								</select>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">复试时间：</label>
							<div class="controls">
								<input name="reinterview_time" type="text" class="calendar" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">预计报道时间：</label>
							<div class="controls">
								<input name="report_time1" type="text" class="calendar" />
							</div>
						</div>
						<div class="control-group span9">
							<label class="control-label">实际报道时间：</label>
							<div class="controls">
								<input name="report_time2" type="text" class="calendar" />
							</div>
						</div>

					</div>
					<div class="row">
						<div class="control-group span9">
							<label class="control-label">面试结果：</label>
							<div class="controls  control-row4">
								<textarea name="reason"></textarea>
							</div>
						</div>

						<div class="control-group span9">
							<label class="control-label">备注（工作意向）：</label>
							<div class="controls  control-row4">
								<textarea name="advice"></textarea>
							</div>
						</div>
						
						<div class="span9 doc-content">
							<label class="control-label">对应需求：</label>
							<div class="controls">
								<div id="s1">
									<input type="hidden" id="hide" value="" name="requirement_name" />
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label"><s>*</s>应聘者数据来源：</label>
							<div class="controls">
								<select name="data_resource" data-rules="{required:true}">
									<option value="">请选择</option>
									<c:forEach items="${sjlylist}" var="lx">
										<option value="${lx.c_code}">${lx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- 添加结束-->

			<!-- 详情开始 -->
			<div id="detail" class="hide" style="autoScroll: true">
				<form action="detail" method="post" class="form-horizontal"  id="meetingform">

					<div class="row">
						<div class="control-group span6">
							<label class="control-label">姓名：</label>
							<div class="controls">
								<input name="name" type="text" class="input-small control-text"
									readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">联系方式：</label>
							<div class="controls">
								<input name="number" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">工作年限：</label>
							<div class="controls">
								<input name="work_year" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">年龄：</label>
							<div class="controls">
								<input name="age" type="text" class="input-small control-text"
									readonly="readonly" />
							</div>
						</div>

					</div>
					<div class="row">

						<div class="control-group span6">
							<label class="control-label">毕业时间：</label>
							<div class="controls">
								<input name="graduate_time" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">Email：</label>
							<div class="controls">
								<input name="email" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="span6 doc-content">
							<label class="control-label">学历：</label>
							<div class="controls">
								<input name="level" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>

						<div class="span6 doc-content">
							<label class="control-label">日语等级：</label>
							<div class="controls">
								<input name="japan_level" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>


					</div>
					<div class="row">


						<div class="control-group span6">
							<label class="control-label">转正薪资：</label>
							<div class="controls">
								<input name="salary" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">职位：</label>
							<div class="controls">
								<input name="postion" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="span6 doc-content">
							<label class="control-label">状态：</label>
							<div class="controls">
								<input name="is_ok" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">面试官：</label>
							<div class="controls">
								<input name="interview_man" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>

					</div>

					<div class="row">
						<div class="control-group span6">
							<label class="control-label">初试方式：</label>
							<div class="controls">
								<input name="interview_id" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">初试时间：</label>
							<div class="controls">
								<input name="interview_time" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="span6 doc-content">
							<label class="control-label">复试现场：</label>
							<div class="controls">
								<input name="is_interview" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">复试时间：</label>
							<div class="controls">
								<input name="reinterview_time" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>

					</div>
					<div class="row">

						<div class="control-group span6">
							<label class="control-label">预计报道时间：</label>
							<div class="controls">
								<input name="report_time1" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="control-group span6">
							<label class="control-label">实际报道时间：</label>
							<div class="controls">
								<input name="report_time2" type="text"
									class="input-small control-text" readonly="readonly" />
							</div>
						</div>
						<div class="span8 doc-content">
							<label class="control-label">创建时间：</label>
							<div class="controls">
								<input name="offer_data" type="text"
									class="input-normal control-text" readonly="readonly" />
							</div>
						</div>
						
					</div>
					<div class="row">
						
						<div class="control-group span12">
							<label class="control-label">面试结果：</label>
							<div class="controls control-row4">
								<textarea name="reason" readonly="readonly" style="width:160px"></textarea>
							</div>
						</div>
						<div class="control-group span12">
							<label class="control-label">备注（工作意向）：</label>
							<div class="controls control-row4">
								<textarea name="advice" readonly="readonly" style="width:160px" style="height: 24px"></textarea>
							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="span9 doc-content">
							<label class="control-label">应聘者数据来源：</label>
							<div class="controls">
								<select name="data_resource">
									<option value="">请选择</option>
									<c:forEach items="${sjlylist}" var="lx">
										<option value="${lx.c_code}">${lx.c_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					
					<!-- #grid2 -->
					<div class="row">
						<div class="control-group span3 ">
							<label class="control-label"> </label>
						</div>
						<div class="span24">
							<div id="grid2"></div>
						</div>
					</div>
				</form>
			</div>
			<!-- 详情结束 -->


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
						render : '#s2',
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

				BUI
						.use(
								[ 'bui/grid', 'bui/data', 'bui/form',
										'bui/select' ],
								function(Grid, Data, Form, Select) {
									columns = [
											{
												title : '姓名',
												dataIndex : 'name',
												width : '4%',
												elCls : 'left',
												height : 50,

											},
											{
												title : '年龄',
												dataIndex : 'age',
												width : '4%',
												elCls : 'right'
											},
											{
												title : '联系方式',
												dataIndex : 'number',
												width : '9%',
												elCls : 'right'
											},
											{
												title : '学历',
												dataIndex : 'level',
												width : '4%',
												elCls : 'left'
											},
											{
												title : '工作年限',
												dataIndex : 'work_year',
												width : '7%',
												elCls : 'left'
											},
											{
												title : '职位',
												dataIndex : 'postion',
												width : '7%',
												elCls : 'left'
											},
											{
												title : '录入时间',
												dataIndex : 'offer_data',
												width : '8%',
												elCls : 'center'
											},
											{
												title : '更新时间',
												dataIndex : 'update_time',
												width : '8%',
												elCls : 'center'
											},
											{
												title : '初试时间',
												dataIndex : 'interview_time',
												width : '8%',
												elCls : 'left'
											},
											{
												title : '复试时间',
												dataIndex : 'reinterview_time',
												width : '8%',
												elCls : 'left'
											},
											{
												title : '面试官',
												dataIndex : 'interview_man',
												width : '6%',
												elCls : 'left'
											},
											{
												title : '转正薪资',
												dataIndex : 'salary',
												width : '7%',
												elCls : 'left'
											},
											
											{
												title : '状况',
												dataIndex : 'is_ok',
												width : '4%',
												elCls : 'left',
												renderer : function(is_ok) {
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
												title : '面试结果',
												dataIndex : 'reason',
												//renderer:BUI.Grid.Format.cutTextRenderer(10),
												width : '8%',
												elCls : 'left'
											},
											{
												title : '招聘专员',
												dataIndex : 'user_name',
												width : '7%',
												elCls : 'left'
											},
											{
												title : '应聘者数据来源',
												dataIndex : 'data_resource',
												width : '1%',
												elCls : 'left',
												visible : false
											},
											{
												title : '备注',
												dataIndex : 'advice',
												renderer:BUI.Grid.Format.cutTextRenderer(5),
												width : '5%',
												elCls : 'left'
											},
											{
												title : '操作',
												width : '5%',
												renderer : function() {
													if ("${type}" != "ZHUANYUAN"){
														return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-edit">编辑</span><span class="grid-command btn-del" title="删除活动信息">删除</span>'
													}else{
														return '<span class="grid-command btn-detail">详情</span><span class="grid-command btn-edit">编辑</span>'
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

									var detail = new Grid.Plugins.DialogEditing(
											{
												listeners : {
													cancel : function(ev) {
														window.top.location
																.reload();
													},
												},
												contentId : 'detail',
												editor : {
													//title : '详情',
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
														addUrl : 'applicant/updateApplicant',
														updateUrl : 'applicant/updateApplicant',
													},
													method : 'POST',
													pageStart : 1
												},
												url : 'applicant/allApplicant',
												autoLoad : true,
												autoSync : true
											});

									var grid = new Grid.Grid(
											{
												render : '#grid',
												columns : columns,
												forceFit : true,
												innerBorder : true,
												loadMask : true,
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
															},
															{
																btnCls : 'button button-small',
																text : '<i class="icon-white icon-trash"></i>导出xls',
																listeners : {
																	'click' : exportFunction
																}
															} 
															]
												},
												bbar : {
													// pagingBar:表明包含分页栏
													pagingBar : true
												},
												plugins : [ BUI.Grid.Plugins.AutoFit ],
												plugins : [
														editing,
														detail,
														Grid.Plugins.CheckSelection ],
												store : store
											});

									var store2 = new Data.Store({
										url : 'requirement/allxqmc',
										autoLoad : true,
									}),

									select = new Select.Select({
										render : '#s1',
										valueField : '#hide',
										multipleSelect : true,
										store : store2
									});
									select.render();

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
									}
									
									
									function exportFunction(){
										var items = grid.getSelection();
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
										
										if(ids ==""){
											BUI.Message.Alert('请选择数据导出', 'warning');
											return ;
										}
										
										if (ids != "") {
											BUI.Message
											.Confirm(
													'您确定要导出吗？',
													function() {
														$("#meetingform").attr("action",
																"applicant/exportApplicant?ids=" + ids )
																.submit();
													}
													
											);
											
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
																			url : 'applicant/delApplicant/'
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
														var record = ev.record, rid = record.id;
														if (grid2 != null) {
															/* var child = control.getChild(grid2);
															control.removeChild(child); */
															grid2.remove(true);
														}
														columns2 = [
																{
																	title : '项目现场',
																	dataIndex : 'project_name',
																	width : '12.5%',
																	elCls : 'center'
																},
																{
																	title : '人员类型',
																	dataIndex : 'staff_leixing',
																	width : '12.5%',
																	elCls : 'center'
																},
																{
																	title : '工作方向',
																	dataIndex : 'work_direction',
																	width : '12.5%',
																	elCls : 'center'
																},
																{
																	title : '所需人数',
																	dataIndex : 'work_number',
																	width : '12.5%',
																	elCls : 'center'
																},
																{
																	title : '工作年限',
																	dataIndex : 'work_year',
																	width : '12.5%',
																	elCls : 'center'
																},
																{
																	title : '招聘专员',
																	dataIndex : 'user_name',
																	width : '10.5%',
																	elCls : 'center'
																},
																{
																	title : '创建时间',
																	dataIndex : 'create_time',
																	width : '14.5%',
																	elCls : 'center'
																},
																{
																	title : '截止时间',
																	dataIndex : 'stop_time',
																	width : '12.5%',
																	elCls : 'center'
																}, ];
														var store2 = new BUI.Data.Store(
																{
																	remoteSort : false,
																	pageSize : 1,
																	proxy : {
																		method : 'POST',
																		pageStart : 1
																	},
																	url : 'applicant/allRequirement?id='
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