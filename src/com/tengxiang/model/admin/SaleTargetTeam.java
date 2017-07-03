package com.tengxiang.model.admin;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class SaleTargetTeam extends Model<SaleTargetTeam> {

	public static final SaleTargetTeam dao = new SaleTargetTeam();

	public Page<SaleTargetTeam> getPageList(int pageNumber, int pageSize,
			 String year, String month) {

		String sql = "select  year,month, sum(price) monthsaleprice ,sum(price*ratio/100) monthsaleticheng";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_saletarget_team   where flag ='1' ");

		if (!Util.isEmpty(year)) {
			sqlExceptSelect.append(" and year =  ").append("'").append(year)
					.append("'");
		}

		if (!Util.isEmpty(month)) {
			sqlExceptSelect.append(" and month =  ").append("'").append(month)
					.append("'");
		}
		sqlExceptSelect
				.append(" GROUP BY year,month  order by  year desc ,month  desc  ");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}
	
	/**
	 * 人员销售业绩记录
	 * @param pageNumber
	 * @param pageSize
	 * @param year
	 * @param month
	 * @return
	 */
	public Page<SaleTargetTeam> getPageList2(int pageNumber, int pageSize,
			 String year, String month,String applicant_name) {

		String sql = "select a.id,a.year,a.month,a.applicantid,b.name applicantname,b.number, b.work_year,b.report_time2,c.id  projectid,c.name project_name , a.start_time,a.end_time,a.price,a.ratio,a.price*a.ratio/100 ticheng";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from  t_saletarget_team  a  left join t_applicant b on  a.applicantid =b.id  and b.flag='1'  left JOIN  t_project c  on a.projectid =c.id and c.flag='1' where  a.flag='1' ");

		if (!Util.isEmpty(year)) {
			sqlExceptSelect.append(" and a.year =  ").append("'").append(year)
					.append("'");
		}

		if (!Util.isEmpty(month)) {
			sqlExceptSelect.append(" and a.month =  ").append("'").append(month)
					.append("'");
		}
		if (!Util.isEmpty(applicant_name)) {
			sqlExceptSelect.append(" and   b.name =").append("'").append(applicant_name)
					.append("'");
		}
		sqlExceptSelect
				.append("   order by  a.year desc ,a.month  asc  ");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

}
