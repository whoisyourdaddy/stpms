package com.tengxiang.model.admin;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.tengxiang.common.Util;

@SuppressWarnings("serial")
public class Project extends Model<Project>{
	public static final Project dao = new Project();
	
	public List<Project> getAllProject(){
		String sql = "select id,name,location,num,term,remark from t_project where flag='1'";
		return dao.find(sql);
	}
	
	public Page<Project> getPageList(int pageNumber, int pageSize, String name,String location,String num){
		
		String sql = "select id,name,location,num,term,remark ";
		
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_project where 1 = 1 and flag='1'" );
		
		if (!Util.isEmpty(name)) {
			sqlExceptSelect.append(" and name = ").append("'")
					.append(name).append("'");
		}
		if (!Util.isEmpty(location)) {
			sqlExceptSelect.append(" and location = ").append("'")
					.append(location).append("'");
		}
		if (!Util.isEmpty(num)) {
			sqlExceptSelect.append(" and num = ").append("'")
					.append(num).append("'");
		}
	
		
		return dao.paginate(pageNumber, pageSize, sql, sqlExceptSelect.toString());
	}
	
	public List<Project> getPname(){
		String sql = "select id,name,location,num,term,remark from t_project where flag ='1' ";
		List<Project> list = find(sql);
		return list;
	}	
	
	public Page<Project> getPageList(int pageNumber, int pageSize,String id){
		
		String sql = "select id,name,location,num,term,remark ";
		
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append(" from t_project where 1 = 1 and flag='1'" );
		
		if(!Util.isEmpty(id)){
			sqlExceptSelect.append(" and name = ").append("(")
			.append("select project_name from t_requirement where id =").append("'").append(id).append("'").append(")");
		}
		
		return dao.paginate(pageNumber, pageSize, sql, sqlExceptSelect.toString());
	}
	
}
