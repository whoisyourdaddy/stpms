package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class Personal extends Model<Personal>{
	public static final Personal dao = new Personal();
	
	public List<Personal> getAllPersonal() {
		String sql = "SELECT a.*,a.salemoney*(b.ratio*0.01)*10000 ticheng FROM(SELECT t.*,x.user_name from t_saletarget_person t,t_user x where t.userid=x.id) a JOIN t_saletarget_person_ratio b ON a.salemoney>b.minsale AND a.salemoney<=b.maxsale and a.flag=1" ;
		return dao.find(sql);
	}

	public Page<Personal> getPageList(int pageNumber, int pageSize, String userid,
			String money,String ratio) {
		String sql = "SELECT a.*,a.salemoney*(b.ratio*0.01)*10000 ticheng";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append("FROM(SELECT t.*,x.user_name from t_saletarget_person t,t_user x where t.userid=x.id) a JOIN t_saletarget_person_ratio b ON a.salemoney>b.minsale AND a.salemoney<=b.maxsale and a.flag=1" );
		if (!Util.isEmpty(userid)) {
			sqlExceptSelect.append(" and userid = ").append("'")
					.append(userid).append("'");
		}
		return dao.paginate(pageNumber, pageSize, sql, sqlExceptSelect.toString());
	}
	
}
