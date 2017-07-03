package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

public class Projecttarget extends Model<Projecttarget>{
	public static final Projecttarget dao = new Projecttarget();
	public List<Projecttarget> getAllProjecttarget() {
		String sql = "select id,userid,company,sale,creator,crete_time,updator,update_time,beizhu,team_commission,personal_commission,starttime,endtime,round(a.sale * (0.01 * a.personal_commission) * 10000) personalfencheng,round(a.sale * (0.01 * a.team_commission) * 10000) teamfencheng a FROM t_projecttarget a WHERE flag = '1'";
		return dao.find(sql);
	}
	public Page<Projecttarget> getPageList(int pageNumber, int pageSize, String userid,
			String company, String sale) {
		String sql = "select a.id,userid,a.company,a.sale,a.crete_time,a.creator,b.user_name,a.update_time,a.updator,a.beizhu,a.team_commission,a.personal_commission,a.starttime,a.endtime ,round(a.sale * (0.01 * a.personal_commission) * 10000) personalfencheng,round(a.sale * (0.01 * a.team_commission) * 10000) teamfencheng";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append("  from t_projecttarget  a left join  t_user  b  on a.userid  =b.id "
				+ "where  a.flag='1'" );
		
		if (!Util.isEmpty(userid)) {
			sqlExceptSelect.append(" and a.userid = ").append("'")
					.append(userid).append("'");
		}
		
		return dao.paginate(pageNumber, pageSize, sql, sqlExceptSelect.toString());
	}
}


