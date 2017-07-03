package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class First extends Model<First>{
	
	public static final First dao = new First();
	
	public List<First> getAllFirst() {
		String sql = "select user_name,count(id) from t_requirement where flag='1' group by user_name" ;
		return dao.find(sql);
	}
	
	public Page<First> getPageList(int pageNumber, int pageSize,
			String user_name) {

		String sql = "SELECT id, staff_leixing, work_year, work_direction, work_number,"
				+ " project_name, user_name, create_time, stop_time, remark, status";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect
				.append(" FROM t_requirement where flag = '1'");
		sqlExceptSelect.append(" and user_name = ").append("'")
		.append(user_name).append("'");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}
}
