package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.mysql.jdbc.StringUtils;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class Applicant extends Model<Applicant> {
	public static final Applicant dao = new Applicant();

	// 查询出应聘者一览里的数据
	public Page<Applicant> getPageList(int pageNumber, int pageSize,
			String interview_id, String is_interview, String requirement_name,
			String is_ok,String applicant_name, String user_name, String mobile,String advice) {

		String sql = "select id, name, age, email, number, graduate_time, "
				+ "level, work_year, japan_level, "
				+ "postion, interview_id, interview_time, interview_man, is_interview,  "
				+ "is_ok, report_time1, report_time2, salary, reason, user_name, advice,requirement_name,reinterview_time,"
				+ "offer_data,firetime,zhuanzheng_time,shiyong_salary,data_resource,update_time";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_applicant where flag='1'");

		if (!Util.isEmpty(interview_id)) {
			sqlExceptSelect.append(" and interview_id = ").append("'")
					.append(interview_id).append("'");
		}
		if (!Util.isEmpty(is_interview)) {
			sqlExceptSelect.append(" and is_interview = ").append("'")
					.append(is_interview).append("'");
		}
		if (!Util.isEmpty(requirement_name)) {
			sqlExceptSelect.append(" and requirement_name like ").append("'%")
					.append(requirement_name).append("%'");
		}
		if (!Util.isEmpty(is_ok)) {
			sqlExceptSelect.append(" and is_ok = ").append("'").append(is_ok)
					.append("'");
		}
		if (!Util.isEmpty(applicant_name)) {
			sqlExceptSelect.append(" and name like").append("'%").append(applicant_name)
					.append("%'");
		}
		if (!Util.isEmpty(user_name)) {
			sqlExceptSelect.append(" and user_name like ").append("'%")
					.append(user_name).append("%'");
		}
		if (!Util.isEmpty(mobile)) {
			sqlExceptSelect.append(" and number like ").append("'%")
					.append(mobile).append("%'");
		}
		if (!Util.isEmpty(advice)) {
			sqlExceptSelect.append(" and advice like ").append("'%")
					.append(advice).append("%'");
		}
		sqlExceptSelect.append(" order by offer_data desc");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	// 查询出需求详情中显示的应聘者信息
	public Page<Applicant> getPageListrequire(int pageNumber, int pageSize,
			String requirement_name) {

		String sql = "select id, name, age, email, number, graduate_time, "
				+ "level, work_year, japan_level, "
				+ "postion, interview_id, interview_time, interview_man, is_interview,  "
				+ "is_ok, report_time1, report_time2, salary, reason, user_name, advice,requirement_name,"
				+ "reinterview_time,offer_data ,firetime,zhuanzheng_time,shiyong_salary,update_time";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_applicant where flag='1'");

		if (!Util.isEmpty(requirement_name)) {
			sqlExceptSelect.append(" and requirement_name like ").append("'%")
					.append(requirement_name).append("%'");
		}

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	public List<Applicant> getListByName(String name) {
		StringBuffer sql = new StringBuffer(
				"select id,name,number from t_applicant where flag = '1' ");
		if (!StringUtils.isEmptyOrWhitespaceOnly(name)) {
			sql.append(" and name like ").append("'%").append(name)
					.append("%'");
		}
		return dao.find(sql.toString());
	}

	/**
	 * 根据应聘者名字和手机号码查询
	 * 
	 * @param name
	 * @return
	 */
	public List<Applicant> getApplicantByName(String name, String mobile) {
		StringBuffer sql = new StringBuffer(
				"select id,name,number,work_year,report_time2 from t_applicant where flag = '1' ");
		if (!StringUtils.isEmptyOrWhitespaceOnly(name)) {
			sql.append(" and name = ").append("'").append(name).append("'");
		}
		if (!StringUtils.isEmptyOrWhitespaceOnly(mobile)) {
			sql.append(" and number = ").append("'").append(mobile).append("'");
		}
		return dao.find(sql.toString());
	}

	public List<Applicant> getRequirementname(String c) {
		String sql = "select requirement_name from t_applicant where flag = '1' and id=?";
		return dao.find(sql, c);
	}

	// 查询出录用人员一览里的数据
	public Page<Applicant> getPageListLyry(int pageNumber, int pageSize,
			String user_name) {
		String sql = "select t.id,t.name,t.report_time1,t.report_time2,t.zhuanzheng_time,t.user_name,"
				+ "t.shiyong_salary,t.salary,t.is_ok,t.firetime,t.number";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect
				.append("  from t_applicant  t "
						+ "where  t.flag='1' and"
						+ "((is_ok ='到职'  and datediff(now(),date_add(report_time2, interval 1 month))>=0 )"
						+ "or(is_ok ='离职'  and datediff(date_add(report_time2, interval 1 month),firetime)<=0 ))");
		if (!Util.isEmpty(user_name)) {
			sqlExceptSelect.append(" and t.user_name = ").append("'")
					.append(user_name).append("'");
		}
		// 录用人员只计算应聘者数据来源为本公司
		sqlExceptSelect.append(" and t.data_resource = 'SELF_COMPANY' ");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	// 查询出录用人员一览里的数据
	public List<Applicant> getListLyry(String fromtime, String totime) {
		StringBuffer sql = new StringBuffer(
				"select t.id,t.name,t.report_time1,t.report_time2,t.zhuanzheng_time,t.user_name,t.shiyong_salary,t.salary,t.is_ok,t.firetime");
		sql.append("  from t_applicant  t "
				+ "where  t.flag='1' and"
				+ "((is_ok ='到职'  and datediff(now(),report_time2)>=0 )"
				+ "or(is_ok ='离职'  and datediff(date_add(report_time2, interval 1 month),firetime)<=0 ))");
		if (!Util.isEmpty(fromtime)) {
			sql.append(" and t.report_time2 >= ").append("'").append(fromtime)
					.append("'");
		}
		if (!Util.isEmpty(totime)) {
			sql.append(" and t.report_time2 <= ").append("'").append(totime)
					.append("'");
		}
		// 录用人员只计算应聘者数据来源为本公司
		sql.append(" and t.data_resource = 'SELF_COMPANY' ");
		return dao.find(sql.toString());
	}
	// 查询出招聘人员的数据
		public Page<Applicant> getPageListLyry1(int pageNumber, int pageSize,
				String jd1_time,String jd2_time) {
			String sql = "select t.id,t.name,t.report_time1,t.report_time2,t.zhuanzheng_time,t.user_name,"
					+ "t.shiyong_salary,t.salary,t.is_ok,t.firetime,t.number";
			StringBuffer sqlExceptSelect = new StringBuffer();
			sqlExceptSelect
					.append("  from t_applicant  t "
							+ "where  t.flag='1' and"
							+ "((is_ok ='到职'  and datediff(now(),report_time2)>=0 )"
							+ "or(is_ok ='离职'  and datediff(date_add(report_time2, interval 1 month),firetime)<=0 ))");
			if (!Util.isEmpty(jd1_time)) {
				sqlExceptSelect.append(" and t.report_time2 >= ").append("'").append(jd1_time)
						.append("'");
			}
			if (!Util.isEmpty(jd2_time)) {
				sqlExceptSelect.append(" and t.report_time2 <= ").append("'").append(jd2_time)
						.append("'");
			}
			// 录用人员只计算应聘者数据来源为本公司
			sqlExceptSelect.append(" and t.data_resource = 'SELF_COMPANY' ");

			return dao.paginate(pageNumber, pageSize, sql,
					sqlExceptSelect.toString());
		}
		
		/**
		 * 根据ids查找应聘者
		 * @param ids
		 * @return
		 */
		public List<Applicant> getListByIds(String[] ids,String username) {
			
			StringBuffer sql = new StringBuffer( "select id, name, age, email, number, graduate_time, "
					+ "level, work_year, japan_level, "
					+ "postion, interview_id, interview_time, interview_man, is_interview,  "
					+ "is_ok, report_time1, report_time2, salary, reason, user_name, advice,requirement_name,reinterview_time,"
					+ "offer_data,firetime,zhuanzheng_time,shiyong_salary,data_resource,update_time"
					+ " from t_applicant where flag='1' " );

			if(ids !=null){
				sql.append(" and id in (");
				for (int i = 0; i < ids.length; i++) {
					if(i==ids.length-1)
					sql.append(ids[i]).append(")");//4)
					else 
						sql.append(ids[i]).append(",");//1,2,3
				}
			}
			
			
			if(!StringUtils.isEmptyOrWhitespaceOnly(username)){
				sql.append(" and user_name= ").append("'").append(username).append("'");
			}
			
			
			System.out.println("++++++++"+sql+"++++++++");
			
			return dao.find(sql.toString());
		}
}
