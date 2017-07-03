package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class User extends Model<User> {

	public static final User dao = new User();

	public List<User> getAllUser() {
		String sql = "select id,create_time,user_name,email,status,phone,type from t_user where flag='1'" ;
		return dao.find(sql);
	}

	public Page<User> getPageList(int pageNumber, int pageSize,
			String user_name, String create_time, String status, String type) {

		String sql = "select t_user.id,create_time,user_name,password,email,phone,a.c_name as typename ,a.c_code as type, b.c_name as statusname,b.c_code AS status";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_user left join t_category as a on a.c_code = t_user.type left join t_category as b on b.c_code = t_user.status where flag='1' ");

		if (!Util.isEmpty(user_name)) {
			sqlExceptSelect.append(" and user_name = ").append("'")
					.append(user_name).append("'");
		}
		if (!Util.isEmpty(create_time)) {
			sqlExceptSelect.append(" and create_time = ").append("'")
					.append(create_time).append("'");
		}
		if (!Util.isEmpty(status)) {
			sqlExceptSelect.append(" and status = ").append("'").append(status)
					.append("'");
		}
		if (!Util.isEmpty(type)) {
			sqlExceptSelect.append(" and type = ").append("'").append(type)
					.append("'");
		}

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	public User checkLogin(String userName, String password) {
		StringBuffer sql = new StringBuffer(" select * from t_user ");
		sql.append(" where USER_NAME = '" + userName + "'");
		sql.append(" and PASSWORD ='" + password + "'");
		sql.append(" and flag ='1'");
		System.out.println(sql.toString());
		return dao.findFirst(sql.toString());
	}

	public List<User> getUname() {
		String sql = "select * from t_user where type = 'ZHUANYUAN' and status = 'ZAIZHI' and flag = '1' ";
		List<User> list = find(sql);
		return list;
	}

	public List<User> getAllType(Object c) {
		String sql = "select id,create_time,user_name,email,status,phone,type from t_user where user_name=?" ;
		return dao.find(sql,c);
	}
	public boolean checkname(String userName) {
		boolean result = false;
		StringBuffer sql = new StringBuffer(
				" select * from T_user where flag='1'");
		sql.append(" and user_name =?");
		List<User> users = dao.find(sql.toString(), userName);
		if (users.size() > 0) {
			result = true;
		}
		return result;
	}
}
