package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Recruiters extends Model<Recruiters>{
	
	public static final Recruiters dao = new Recruiters();
	
	public List<Recruiters> getAllRecruiters(){
		String sql = "select id,name,age,sex,email,phone,status,types,cash,remark from t_recruiters";
		return dao.find(sql);
	}
	
	public Page<Recruiters> getPageList(int pageNumber, int pageSize){
		
		String sql = "select id,name,age,sex,email,phone,status,types,cash,remark ";
		
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_recruiters ");
		
		return dao.paginate(pageNumber, pageSize, sql, sqlExceptSelect.toString());
	}
}
