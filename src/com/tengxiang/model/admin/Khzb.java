package com.tengxiang.model.admin;


import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class Khzb extends Model<Khzb> {

	public static final Khzb dao = new Khzb();

	public Page<Khzb> getPageList(int pageNumber, int pageSize, String type,
			String user_name,String year) {

		String sql = "SELECT a.id, a.year, a.month,a.count, a.creator, a.create_time,a.beizhu ,b.id creator,b.user_name ,a.updator,a.update_time";

		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_khzb a left join t_user b on a.creator =b.id where  a.flag = '1'");
		
		if ( !Util.isEmpty(year)) {
			sqlExceptSelect.append(" and year =  ").append("'")
					.append(year).append("'");
		}

		sqlExceptSelect.append(" order by year,month asc");

		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}

	

	
}
