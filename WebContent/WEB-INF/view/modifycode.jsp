<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<script type="text/javascript" src="scripts/jquery/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery/jquery-ui.min.js"></script>
<!--<style>
.ui_input_login {
	width: 135px;
	height: 30px;
	margin: 2px 2px 2px 5px;
	outline: 0;
	padding: 5px;
	border: 1px solid;
	border-color: #C0C0C0 #D9D9D9 #D9D9D9;
	border-radius: 2px;
	background: #FFF;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1), 0 1px 0
		rgba(255, 255, 255, 0.2);
	-webkit-transition: box-shadow, border-color .5s ease-in-out;
	-moz-transition: box-shadow, border-color .5s ease-in-out;
	-o-transition: box-shadow, border-color .5s ease-in-out;
}
</style>-->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//$("userName").val();
						/** 提交 */
						$("#submit")
								.click(
										function() {

											if ($("#userName").val() == "") {
												alert("用户名不能为空！");
												return;
											}
											if ($("#oldPwd").val() == "") {
												alert("原密码不能为空！");
												return;
											}
											if ($("#newPwd").val() == "") {
												alert("新密码不能为空！");
												return;
											}
											if ($("#TwoPwd").val() == "") {
												alert("确认密码不能为空！");
												return;
											}
											if ($("#newPwd").val().length < 8) {
												alert("新密码不能少于8位！");
												return;
											}
											var reg = new RegExp(
													"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$");
											if (!reg.test($("#newPwd").val())) {
												alert("新密码必须由英文数字组成！");
												return;
											}
											checkUser();
										});

						$('#cancle').click(function() {
							window.parent.$.fancybox.close();
						})

					});
	/** 检测用户是否存在  **/
	function checkUser() {
		$.ajax({
			url : "/TXRMS/isexit",
			type : "post",
			data : {
				userName : $("#userName").val()
			},
			success : function(data) {
				if (data.userName == 0) {
					alert("此用户不存在!");
					return;
				} else {//判断密码是否正确
					$.ajax({
						url : "/TXRMS/checkOldPwd",
						type : "post",
						data : {
							userName : $("#userName").val(),
							oldPwd : $("#oldPwd").val()
						},
						success : function(data) {
							if (data.userName == 0) {
								alert("原密码输入错误!");
								return;
							} else {
								checknewPwd();
							}
						}

					});
				}
			}
		});
	}

	/** 检测两次输入密码是否一致  **/
	function checknewPwd() {
		var newPwd = $("#newPwd").val();
		var TwoPwd = $("#TwoPwd").val();
		if (newPwd == TwoPwd) {
			$.ajax({
				url : "/TXRMS/updatepassword",
				type : "post",
				data : {
					userName : $("#userName").val(),
					newPwd : $("#newPwd").val()
				},
				success : function(data) {
					if (data.count != 0) {
						alert("修改成功！");
						window.location.href = "/TXRMS/admin";
					} else {
						alert("修改失败！");
					}
				}

			});
		} else {
			alert("两次输入的密码不相同");
			return;
		}
	}
</script>

</head>
<body style="overflow-y: hidden">
	<form id="submitForm" name="submitForm"
		action="/xngzf/archives/initFangyuan.action" method="post">
		<input type="hidden" name="fyID" value="14458625716623" id="fyID" />
		<div id="container">
			<div id="nav_links"
				style="background: rgb(4, 69, 153); height: 50px;">
				当前位置：<span style="color: #ffffff;">&nbsp;&nbsp;<span
					style="color: #ffffff;">修改密码</span>
			</div>
			<div class="ui_content">
				<form method="post" id="submitForm">
					<table cellspacing="0" cellpadding="0" height="100%" width="100%"
						border="0">
						<tr>
							<td height="20" class="ui_text_rt" width="40%" align="right">&nbsp;</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td width="235" height="48" class="ui_text_rt"><div
									align="right">&nbsp;&nbsp;&nbsp;用户名：</div></td>
							<td colspan="2"><input type="text" id="userName"
								class="ui_input_login" value="${username}" maxlength="10" /></td>
						</tr>
						<tr>
							<td class="ui_text_rt" width="235"><div align="right">
									&nbsp;&nbsp;&nbsp;原密码：</div></td>
							<td colspan="2"><input type="password" id="oldPwd"
								class="ui_input_login" maxlength="16" /></td>
						</tr>
						<tr id="you3">
							<td class="ui_text_rt" width="235"><div align="right">
									&nbsp;&nbsp;&nbsp;新密码：</div></td>
							<td colspan="2"><input type="password" id="newPwd"
								class="ui_input_login" maxlength="16" /></td>
						</tr>
						<tr id="you">
							<td class="ui_text_rt" width="235"><div align="right">
									&nbsp;&nbsp;&nbsp;确认密码：</div></td>
							<td colspan="2"><input type="password" id="TwoPwd"
								class="ui_input_login" maxlength="16" /></td>
						</tr>
						<tr>
							<td class="ui_text_rt">&nbsp;</td>
							<td colspan="2">&nbsp;</td>
						</tr>
						<tr id="you2">
							<td colspan="3" align="center">&nbsp;&nbsp;&nbsp;<input
								id="submit" type="button" value="提交" class="ui_input_btn01" /> <input
								id="cancle" type="button" value="取消" class="ui_input_btn01" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</form>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>