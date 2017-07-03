package com.tengxiang.model.admin;

import java.util.List;
import java.util.Set;

import com.jfinal.plugin.activerecord.Model;
/**
 * 用户菜单
 * 
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class RoleMenu extends Model<RoleMenu> {

	public static final RoleMenu dao = new RoleMenu();

	/**
	 * 获得角色对应的菜单权限
	 * @param userroles
	 * @return
	 */
	public List getUserMenusForRoles(List<UserRole> userroles) {
		StringBuffer sb = new StringBuffer(
				" select distinct t.menuid from t_rolemenu t where 1=1 ");
		if (null == userroles || userroles.size() == 0) {
			// 无任何菜单权限
			sb.append(" and 1=2 ");
		} else {
			sb.append(" and  roleid in (");
			for (UserRole ur : userroles) {
				sb.append(ur.get("roleid")).append(",");
			}
			sb.deleteCharAt(sb.toString().length() - 1);
			sb.append(" ) ");
		}
		return dao.find(sb.toString());
	}
}
