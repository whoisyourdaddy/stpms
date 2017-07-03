package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.mysql.jdbc.StringUtils;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class BusinessTeam extends Model<BusinessTeam> {
	public static final BusinessTeam dao = new BusinessTeam();

	public List<BusinessTeam> businessTeam() {
		String sql = "select a.id,a.year,a.minsale,a.maxsale,a.ratio,a.creator,a.create_time,a.updator,a.update_time,a.beizhu from  t_saletarget_team_ratio a WHERE flag='1'";
		return dao.find(sql);
	}

	public Page<BusinessTeam> getPageList(int pageNumber, int pageSize,
			String year, String minsale, String maxsale, String ratio) {
		String sql = "select a.id,a.year,a.minsale,a.maxsale,a.ratio,a.creator,a.create_time,a.updator,a.update_time,a.beizhu  ";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect
				.append(" from  t_saletarget_team_ratio a WHERE flag='1'");

		if (!Util.isEmpty(year)) {
			sqlExceptSelect.append(" and a.year = ").append("'").append(year)
					.append("'");
		}

		sqlExceptSelect.append("  order by a.year,a.minsale,a.maxsale  asc ");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	/**
	 * 
	 * @param year
	 * @param price
	 * @return
	 */
	public BusinessTeam getRatio(String year, String price) {
		StringBuffer sql = new StringBuffer(
				"select year,ratio from t_saletarget_team_ratio WHERE flag='1'");
		if (!StringUtils.isEmptyOrWhitespaceOnly(year)) {
			sql.append(" and year = ").append("'").append(year).append("'");
		}

		if (!StringUtils.isEmptyOrWhitespaceOnly(price)) {
			double  s   = Double.parseDouble(price);
			sql.append(" and  minsale<= ").append(s * 12 / 10000);
			sql.append(" and  maxsale> ").append(s * 12 / 10000);

		}

		List<BusinessTeam> l = dao.find(sql.toString());
		if (null != l && l.size() > 0)
			return l.get(0);
		else
			return null;
	}
}
