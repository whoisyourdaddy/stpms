package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class Menu extends Model<Menu> {

	public static final Menu dao = new Menu();

	public List<Menu> getMenuForUserID(String userid) {
		List<UserRole> userroles = UserRole.dao.getUserRoles(userid);

		List menuids = RoleMenu.dao.getUserMenusForRoles(userroles);

		// " from Menu where resourceID in ('1','8','9','10','15' ) ";
		StringBuffer sb = new StringBuffer(" select t.resourceid,t.url,t.checked,t.parentid,t.resourcename ,t.icon  from t_menu t where 1=1 ");
		if (null == menuids || menuids.size() == 0) {
			// 无任何菜单权限
			sb.append(" and 1=2 ");
		} else {
			sb.append(" and  resourceID in (");
			for (int i = 0; i < menuids.size(); i++) {
				RoleMenu  rm  =(RoleMenu)menuids.get(i);
				sb.append(rm.get("menuid")).append(",");
			}
			sb.deleteCharAt(sb.toString().length() - 1);
			sb.append(" ) ");
		}
		return dao.find(sb.toString());
	}

}
