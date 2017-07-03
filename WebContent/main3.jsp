<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 腾翔招聘管理系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"
	href="assets/js/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="assets/js/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript"
	src="assets/js/jquery/jquery.treeTable.js"></script>
<script type="text/javascript"
	src="assets/js/zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="assets/js/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript">
	/* zTree插件加载目录的处理  */
	var zTree;

	var setting = {
		/*  check : {
			enable : true
		},  */
		view : {
			dblClickExpand : false,
			showLine : false ,
			expandSpeed : ($.browser.msie && parseInt($.browser.version) <= 6) ? ""
					: "fast" 
		},
		data : {
			key : {
				name : "resourcename",
			},
			simpleData : {
				enable : true,
				idKey : "resourceid",
				pIdKey : "parentid",
				rootPId : ""

			}
		},
		callback : {
			beforeExpand : beforeExpand,
			onExpand : onExpand,
			onClick : zTreeOnClick
		}
	};

	var curExpandNode = null;
	function beforeExpand(treeId, treeNode) {
		var pNode = curExpandNode ? curExpandNode.getParentNode() : null;
		var treeNodeP = treeNode.parentTId ? treeNode.getParentNode() : null;
		for (var i = 0, l = !treeNodeP ? 0 : treeNodeP.children.length; i < l; i++) {
			if (treeNode !== treeNodeP.children[i]) {
				zTree.expandNode(treeNodeP.children[i], false);
			}
		}
		while (pNode) {
			if (pNode === treeNode) {
				break;
			}
			pNode = pNode.getParentNode();
		}
		if (!pNode) {
			singlePath(treeNode);
		}

	}
	function singlePath(newNode) {
		if (newNode === curExpandNode)
			return;
		if (curExpandNode && curExpandNode.open == true) {
			if (newNode.parentTId === curExpandNode.parentTId) {
				zTree.expandNode(curExpandNode, false);
			} else {
				var newParents = [];
				while (newNode) {
					newNode = newNode.getParentNode();
					if (newNode === curExpandNode) {
						newParents = null;
						break;
					} else if (newNode) {
						newParents.push(newNode);
					}
				}
				if (newParents != null) {
					var oldNode = curExpandNode;
					var oldParents = [];
					while (oldNode) {
						oldNode = oldNode.getParentNode();
						if (oldNode) {
							oldParents.push(oldNode);
						}
					}
					if (newParents.length > 0) {
						for (var i = Math.min(newParents.length,
								oldParents.length) - 1; i >= 0; i--) {
							if (newParents[i] !== oldParents[i]) {
								zTree.expandNode(oldParents[i], false);
								break;
							}
						}
					} else {
						zTree.expandNode(oldParents[oldParents.length - 1],
								false);
					}
				}
			}
		}
		curExpandNode = newNode;
	}

	function onExpand(event, treeId, treeNode) {
		curExpandNode = treeNode;
	}

	/** 用于捕获节点被点击的事件回调函数  **/
	function zTreeOnClick(event, treeId, treeNode) {
		//$("#resourceID").val(treeNode.resourceID);//点击菜单对应的resourceID

		var zTree = $.fn.zTree.getZTreeObj("dleft_tab1");
		zTree.expandNode(treeNode, null, null, null, true);
		// 		zTree.expandNode(treeNode);
		// 规定：如果是父类节点，不允许单击操作
		if (treeNode.isParent) {
			//alert("父类节点无法点击哦...");

			//alert(treeNode.parentID + treeNode.resourceName +treeNode.resourceID);
			return false;
		}
		// 如果节点路径为空或者为"#"，不允许单击操作
		if (treeNode.accessPath == "" || treeNode.accessPath == "#") {
			//alert("节点路径为空或者为'#'哦...");
			return false;
		}
		// 跳到该节点下对应的路径, 把当前资源ID(resourceID)传到后台，写进Session
		//rightMain(treeNode.accessPath);

		if (treeNode.isParent) {
			//alert(treeNode.getParentNode().resourceName + treeNode.resourceName);
		} else {
			//alert("子节点:" + treeNode.resourceName + treeNode.resourceID
			//		+ treeNode.icon + "父节点:" + treeNode.parentID);
		}
	};

	$(document).ready(function() {
		/*   <s:if test='#session.user==null'">
		        alert("请先登录");
		        window.location.href="/self/login.jsp";
		  </s:if>
		  
		  <s:else> */
		$(document).ajaxStart(onStart).ajaxSuccess(onStop);
		loadMenu('YEWUMOKUAI', "dleft_tab1");
		// </s:else>

	});

	function loadMenu(resourceType, treeObj) {
		$.post("user/ajaxMenu",
				function(data) {
					var zNodes = data.nodesData;
					// 如果返回数据不为空，加载"业务模块"目录
					if (zNodes != null) {
						// 将返回的数据赋给zTree
						$.fn.zTree.init($("#" + treeObj), setting, zNodes);
						zTree = $.fn.zTree.getZTreeObj(treeObj);
						if (zTree) {
							// 默认展开所有节点
							zTree.expandAll(true);
						}
					}
				});
	}

	//ajax start function
	function onStart() {
		$("#ajaxDialog").show();
	}

	//ajax stop function
	function onStop() {
		// 		$("#ajaxDialog").dialog("close");
		$("#ajaxDialog").hide();
	}
</script>
 </head>
 <body>

  <div class="header">
    
      <div class="dl-title">
        <a href="http://www.builive.com" title="文档库地址" target="_blank"><!-- 仅仅为了提供文档的快速入口，项目中请删除链接 -->
          <span class="dl-title-text">腾翔招聘管理系统</span>
        </a>
      </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${userName}</span><a href="logout" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
  </div> 
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">首页</div></li>
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <div id="nav_resource">
		<ul id="dleft_tab1" class="ztree"></ul>
	</div>
 </body>
</html>




