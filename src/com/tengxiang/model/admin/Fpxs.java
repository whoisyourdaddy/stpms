package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class Fpxs extends Model<Fpxs>{
	public static final Fpxs dao = new Fpxs();
	
	public List<Fpxs> getAllFpxs() {
		String sql = "select id,userid,type,violate_time,create_time,creator,update_time,updator,beizhu from t_fpxs where flag='1'" ;
		return dao.find(sql);
	}

	public Page<Fpxs> getPageList(int pageNumber, int pageSize, String userid,
			String create_time, String type) {
		String sql = "select a.id,userid,a.violate_time,c.c_name type_name,a.type, a.create_time,a.creator,b.user_name,a.update_time,a.updator,a.beizhu";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append("  from t_fpxs  a left join  t_user  b  on a.userid  =b.id "
				+ "LEFT JOIN t_category c ON a.type = c.c_code "
				+ "where  a.flag='1'" );
		
		if (!Util.isEmpty(userid)) {
			sqlExceptSelect.append(" and a.userid = ").append("'")
					.append(userid).append("'");
		}
		if (!Util.isEmpty(type)) {
			sqlExceptSelect.append(" and c.c_code = ").append("'")
					.append(type).append("'");
		}
		return dao.paginate(pageNumber, pageSize, sql, sqlExceptSelect.toString());
	}
}
