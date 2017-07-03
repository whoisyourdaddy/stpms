package com.tengxiang.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;
import com.tengxiang.interceptor.CheckLoginInterceptor;
import com.tengxiang.model.admin.Category;
import com.tengxiang.model.admin.Menu;
import com.tengxiang.model.admin.User;

@Before(CheckLoginInterceptor.class)
public class UserController extends Controller {
	public void index() {
		setAttr("ztList", getModel(Category.class)
				.getChildByCode("STATUS_TYPE"));
		setAttr("yhlxList", getModel(Category.class)
				.getChildByCode("USER_TYPE"));
		setSessionAttr("name",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("user_name"));
		setSessionAttr("Type",
				getModel(User.class).getAllType(getSessionAttr("userName"))
						.get(0).get("type"));
		render("UserList.jsp");
	}

	public void allUser() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String user_name = getPara("user_name");
		String create_time = getPara("create_time");
		String status = getPara("status");
		String type = getPara("type");

		Page<User> users = getModel(User.class).getPageList(pageIndex, limit,
				user_name, create_time, status, type);

		results.put("rows", users.getList());
		results.put("results", users.getTotalRow());
		renderJson(JsonKit.toJson(results));

	}

	public void updateUser() {

		Map<String, Object> results = new HashMap<String, Object>();

		User user = getModel(User.class);
		user.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));
		user.put("create_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
		if (Util.isEmpty(user.get("id"))) {
			user.set("password",
					Util.getMD5Str(user.get("password").toString()));
			user.save();
		} else {
			user.update();
		}

		results.put("success", true);
	}

	public void delUser() {

		Map<String, Object> results = new HashMap<String, Object>();
		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			User project = getModel(User.class);
			project.set("id", getPara(i));
			project.set("flag", "0");
			project.update();
			i++;
		}
		results.put("success", true);
		renderJson(results);
	}

	/**
	 * 根据用户和点击的哪个模块异步加载zTree菜单
	 */
	public void ajaxMenu() {
		Map<String, Object> results = new HashMap<String, Object>();
		String contextPath = "/TXRMS";

		User user = getSessionAttr("user");
		List<Menu> menuList = getModel(Menu.class).getMenuForUserID(
				user.get("id").toString());

		String icon = "";

		if (null != menuList) {
			Integer parentIndex = 0;
			for (Menu menu : menuList) {
				String parentID = menu.get("parentid").toString();

				if ("0".equals(parentID)) {
					Integer menuIndex = menuList.indexOf(menu);
					if (0 == menuIndex) {
						menu.set("open", true);
						// menu.setOpen(true);
					}
					if (3 < parentIndex) {
						parentIndex = 1;
					}
					icon = contextPath + "/assets/img/ztree/" + parentIndex
							+ ".png";
					// menu.setIcon(icon);
					menu.set("icon", icon);
					parentIndex++;
				} else {
					icon = contextPath + "/assets/img/ztree/22.png";
					// menu.setIcon(icon);
					menu.set("icon", icon);
				}

			}
		}

		results.put("nodesData", menuList);

		renderJson(JsonKit.toJson(results));

	}

	public Map<String, Object> paraMap2ModelMap(Map<String, String[]> para,
			Enumeration<?> names) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String name;
		while (names.hasMoreElements()) {
			name = names.nextElement().toString();

			if ("b".equals(name)) {
				continue;
			}
			
			if ("typename".equals(name)) {
				continue;
			}
			
			if ("statusname".equals(name)) {
				continue;
			}

			try {
				modelMap.put(name, para.get(name)[0]);
			} catch (ActiveRecordException e) {
				continue;
			}
		}

		return modelMap;
	}

}
