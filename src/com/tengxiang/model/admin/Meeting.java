package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

public class Meeting extends Model<Meeting>{
	
	public static final Meeting dao = new Meeting();
	public List<Meeting> getAllMeeting() {
		String sql = "select id,userid,create_time,creator,update_time,updator,beizhu,date,record from t_meeting where flag='1'" ;
		return dao.find(sql);
	}
	public Page<Meeting> getPageList(int pageNumber, int pageSize, String userid,
			String date) {
		String sql = "select a.id,userid,a.create_time,a.creator,b.user_name,a.update_time,a.updator,a.beizhu,a.date,a.record";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append("  from t_meeting  a left join  t_user  b  on a.userid  =b.id "
				+ "where  a.flag='1'" );
		
		if (!Util.isEmpty(userid)) {
			sqlExceptSelect.append(" and a.userid = ").append("'")
					.append(userid).append("'");
		}
		if (!Util.isEmpty(date)) {
			sqlExceptSelect.append(" and a.date = ").append("'")
					.append(date).append("'");
		}
		return dao.paginate(pageNumber, pageSize, sql, sqlExceptSelect.toString());
	}
	
}
