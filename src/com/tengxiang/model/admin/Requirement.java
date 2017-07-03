package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class Requirement extends Model<Requirement> {

	public static final Requirement dao = new Requirement();

	public Page<Requirement> getPageList(int pageNumber, int pageSize,
			String stafff_leixing, String work_year, String work_direction,
			String project_name, String create_time, String type,
			String user_name, String us, String ur) {

		String sql = "SELECT id, staff_leixing, work_year, work_direction, work_number,"
				+ " project_name, user_name, create_time, stop_time, remark, status";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" FROM t_requirement where flag = '1'");

		/*
		 * if (type.equals("ZHUANYUAN")) {
		 * 
		 * 
		 * sqlExceptSelect.append(" and user_name = ").append("'")
		 * .append(user_name).append("'"); }
		 */

		// 去除主管查询
		/*
		 * if (type.equals("ZHUGUAN") && !Util.isEmpty(us)) {
		 * sqlExceptSelect.append(" and user_name =  ").append("'")
		 * .append(user_name).append("'"); }
		 * 
		 * if (type.equals("ZHUGUAN") && !Util.isEmpty(ur)) {
		 * sqlExceptSelect.append(" and user_name ='未分配' "); }
		 */
		if ( !Util.isEmpty(us)) {
			sqlExceptSelect.append(" and user_name =  ").append("'")
					.append(user_name).append("'");
		}

		if (!Util.isEmpty(ur)) {
			sqlExceptSelect.append(" and user_name ='未分配' or user_name = '' ");
		}

		if (!Util.isEmpty(stafff_leixing)) {
			sqlExceptSelect.append(" and staff_leixing = ").append("'")
					.append(stafff_leixing).append("'");
		}

		if (!Util.isEmpty(work_year)) {
			sqlExceptSelect.append(" and work_year = ").append("'")
					.append(work_year).append("'");
		}

		if (!Util.isEmpty(work_direction)) {
			sqlExceptSelect.append(" and work_direction = ").append("'")
					.append(work_direction).append("'");
		}

		if (!Util.isEmpty(project_name)) {
			sqlExceptSelect.append(" and project_name = ").append("'")
					.append(project_name).append("'");
		}

		if (!Util.isEmpty(create_time)) {
			sqlExceptSelect.append(" and create_time like ").append("'%")
					.append(create_time).append("%'");
		}

		sqlExceptSelect.append(" group by t_requirement.id");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	// 查出个用户需求书
	public Requirement getAllRequire(String Require, String userName) {
		StringBuffer sql = new StringBuffer(
				" SELECT count(id) FROM t_requirement where flag = '1' ");
		sql.append(" and user_name = '" + userName + "'");
		return dao.findFirst(sql.toString());
	}

	public List<Requirement> getDirection() {
		String sql = "select id,work_year,work_direction from t_requirement where flag ='1' ";
		List<Requirement> list = find(sql);
		return list;
	}

	// 查出所有需求书
	public Requirement getRequire(String Require) {
		StringBuffer sql = new StringBuffer(
				" SELECT count(id) FROM t_requirement where flag = '1' ");
		return dao.findFirst(sql.toString());
	}

	// 查出未分配需求书
	public Requirement getRequire1(String Require) {
		StringBuffer sql = new StringBuffer(
				" SELECT count(id) FROM t_requirement where flag = '1' and user_name = '未分配' or user_name = ''");
		return dao.findFirst(sql.toString());
	}

	public List<Requirement> getxqmc() {
		String sql = new String(
				"SELECT DISTINCT CONCAT(a.project_name,'--',a.staff_leixing,'--',a.work_direction) as text,CONCAT(a.project_name,'--',a.staff_leixing,'--',a.work_direction) as value FROM t_requirement as a inner join t_requirement as b WHERE a.id = b.id and a.flag = '1'");
		List<Requirement> list = find(sql);
		return list;
	}

	// 查出个项目需求书
	public Requirement getAllrequire(String Require, String project_name) {
		StringBuffer sql = new StringBuffer(
				" SELECT project_name,count(id) FROM t_requirement where flag = '1' group by project_name ");
		sql.append(" and project_name = '" + project_name + "'");
		return dao.findFirst(sql.toString());
	}

	public List<Requirement> getId(Object c) {
		String sql = "select project_name from t_requirement where flag = '1' and id=?";
		return dao.find(sql, c);
	}

	public Page<Requirement> getPageList1(int pageNumber, int pageSize,
			String stafff_leixing, String work_year, String work_direction,
			String project_name, String create_time, String type,
			String user_name) {

		String sql = "SELECT id, staff_leixing, work_year, work_direction, work_number,"
				+ " project_name, user_name, create_time, stop_time, remark, status";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" FROM t_requirement where flag = '1'");
		sqlExceptSelect.append("  and user_name = '未分配'");

		sqlExceptSelect.append(" group by t_requirement.id");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	public List<Requirement> getrequirementname(Object c) {
		String sql = "select CONCAT(project_name,'--',staff_leixing,'--',work_direction) as requirement_name from t_requirement where flag = '1' and id = ?";
		return dao.find(sql, c);
	}

	public Page<Requirement> getPageList(int pageNumber, int pageSize, String id) {

		String sql = "SELECT id, staff_leixing, work_year, work_direction, work_number,project_name, user_name, create_time, stop_time,remark,status";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_requirement where  flag='1'");

		if (!Util.isEmpty(id)) {
			sqlExceptSelect.append(" and project_name = ").append("(")
					.append("select name from t_project where id =")
					.append("'").append(id).append("'").append(")");
		}

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	public Page<Requirement> getPageListforapplicant(int pageNumber,
			int pageSize, StringBuffer idsStr) {
		String sql = "SELECT id, staff_leixing, work_year, work_direction, work_number,project_name, user_name, create_time, stop_time,remark,status";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect
				.append(" from (select t_requirement.*, CONCAT(project_name,'--',staff_leixing,'--',work_direction) as requirement_name from t_requirement where flag = '1') as a where flag='1' ");

		if (!Util.isEmpty(idsStr)) {
			sqlExceptSelect.append(" and a.requirement_name in ").append("(")
					.append(idsStr).append(")");
		}
		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}
}
