package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class BusinessPersonal extends Model<BusinessPersonal>{
	public static final BusinessPersonal dao = new BusinessPersonal();
	
	public List<BusinessPersonal> getAllBusinessPersonal() {
		String sql = "select id,minsale,maxsale,ratio,beizhu from t_saletarget_person_ratio where flag=1" ;
		return dao.find(sql);
	}

	public Page<BusinessPersonal> getPageList(int pageNumber, int pageSize, String minsale,
			String create_time, String maxsale) {
		String sql = "select id,minsale,maxsale,ratio,beizhu,updator,update_time";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append("  from t_saletarget_person_ratio where flag=1" );
		
		return dao.paginate(pageNumber, pageSize, sql, sqlExceptSelect.toString());
	}
}
