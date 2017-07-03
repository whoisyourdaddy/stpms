package com.tengxiang.model.admin;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class Teamprice extends Model<Teamprice> {
	public static final Teamprice dao = new Teamprice();

	public Page<Teamprice> getPageList2(int pageNumber, int pageSize,
			String year, int month) {

		String sql = "select sum(a.count) yz_count,(select count(*) from t_applicant t "
				+ "where  t.flag='1' and ( "
				+ "date(report_time2)>'2016-1-1')and ((is_ok ='录用'  and datediff(now(),date_add(report_time2, interval 1 month))>=0 )"
				+ "or(is_ok ='离职' and datediff(date_add(report_time2, interval 1 month),firetime)<=0 ))"
				+ " ) sz_count ";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append("from t_khzb a ");
		sqlExceptSelect.append("where a.year=").append("'").append(year)
				.append("'");
		sqlExceptSelect.append("and a.month").append(">=").append(month)
				.append(" and a.month").append("<=").append(month + 2);
		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}
	
	public Page<Teamprice> getPageList(int pageNumber, int pageSize,
			String fromyear, String frommonth,String toyear,String tomonth) {

		String sql = "select  sum(count) yz_count ";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append("from t_khzb  where  flag  ='1'  ");
		
		
		if (!Util.isEmpty(fromyear)) {
			sqlExceptSelect.append(" and year>= ").append("'")
					.append(fromyear).append("'");
		}
		if (!Util.isEmpty(toyear)) {
			sqlExceptSelect.append(" and year<= ").append("'")
					.append(toyear).append("'");
		}
		
		if (!Util.isEmpty(frommonth)) {
			sqlExceptSelect.append(" and month>= ").append("'")
					.append(frommonth).append("'");
		}
		
		if (!Util.isEmpty(tomonth)) {
			sqlExceptSelect.append(" and month<= ").append("'")
					.append(tomonth).append("'");
		}
		
		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

}
