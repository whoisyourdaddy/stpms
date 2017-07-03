<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="ltr" lang="zh-cn">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/scripts/fancybox/jquery.fancybox-1.3.4.css"
	media="screen"></link>
 <script type="text/javascript" src="js/md5.js"></script> 
 <script type="text/javascript" >
  hash = hex_md5("password");
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$("[href='#']").click(function(){
			var result="";
			result=$(".username-text").val();
			/**修改密码  **/
		    $.fancybox({
		    	'href' :'/TXRMS/revise?username='+result,
		    	'width' : 350,
		        'height' :380,
		        'type' : 'iframe',
		        'hideOnOverlayClick' : false,
		        'showCloseButton' : true,
		        'onClosed' : function() { 
		        	window.location.href = '/TXRMS/login';
		        }
		    });
		});
		
		$("#userForm").submit(function(){
		     var hash = hex_md5($("#password").val()); 
		     $("#password").val(hash);
		});
	});
	
	function f(){
		var result=$("#username").val();
		/**修改密码  **/
	    /* $.fancybox({
	    	'href' :'/TXRMS/revise?username='+result,
	    	'width' : 350,
	        'height' :380,
	        'type' : 'iframe',
	        'hideOnOverlayClick' : false,
	        'showCloseButton' : true,
	        'onClosed' : function() { 
	        	window.location.href = '/TXRMS/login';
	        }
	    }); */
	    var url  ='/TXRMS/revise?username='+result;
	    window.location.href= url;
	}
	/* 
	function encryptionPassword(){              
	     var hash = MD5($("password").value);    
	     $("password").value = hash;    
	    }  
 */
</script> 
	<title>腾翔招聘管理系统</title>

	<!--- CSS --->
	<link rel="stylesheet" href="login/style.css" type="text/css" />


	<!--- Javascript libraries (jQuery and Selectivizr) used for the custom checkbox --->

	<!--[if (gte IE 6)&(lte IE 8)]>
		<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="selectivizr.js"></script>
		<noscript><link rel="stylesheet" href="fallback.css" /></noscript>
	<![endif]-->

	</head>

	<body>
		<div id="container">
			<form id="userForm" action="checkLogin"  method="post">
				<div class="login">招聘管理系统登陆</div>
				<div class="username-text">用户名:</div>
				<div class="password-text">密码:</div>
				<div class="username-field">
					<input type="text" name="username" id = "username" value="" />
				</div>
				<div class="password-field">
					<input type="password" name="password" id="password" value="" />
				</div>
				<input type="checkbox" name="remember-me" id="remember-me" /><label for="remember-me">记住用户</label>
				<div class="forgot-usr-pwd"><span   onclick="f()" >修改密码</span></div> 
				<input type="submit" name="submit" value="GO" onclick="encryptionPassword()" />
			</form>
		</div>
		<div>
				<div class="login">${loginMsg}</div>
		</div>
		<div id="footer">
			Copyright &copy; 2014.Company name All rights reserved.
		</div>
</body>
</html>