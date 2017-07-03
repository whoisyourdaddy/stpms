package com.tengxiang.model.admin;

import java.util.List;
import java.util.Set;

import com.jfinal.plugin.activerecord.Model;
import com.mysql.jdbc.StringUtils;

/**
 * 用户角色
 * 
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
public class UserRole extends Model<UserRole> {

	public static final UserRole dao = new UserRole();

	/**
	 * 用户所属于角色
	 * @param userid
	 * @return
	 */
	public List<UserRole> getUserRoles(String userid) {
		StringBuffer sql = new StringBuffer(
				" select * from t_userrole where 1=1 ");
		if (!StringUtils.isEmptyOrWhitespaceOnly(userid)) {
			sql.append(" and userid  =").append("'").append(userid).append("'");
		}
		return dao.find(sql.toString());
	}
}
