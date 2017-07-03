package com.tengxiang.model.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Category extends Model<Category>{

	public static final Category dao = new Category();
	
	public List<Category> getAllCategory(){
		String sql = "select id,c_name,sup_id,orderby,c_code,state from t_category";
		return dao.find(sql);
	}
	
	public List<Map<String, Object>> getTree(){
		List<Map<String, Object>> tree =getChild(0);
		return tree;
	}
	
	public List<Map<String, Object>> getChild(Object object){
		String sql = "select id,c_name,orderby,sup_id,c_code from t_category where sup_id=? order by orderby ";
		List<Category> list = find(sql,object);
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		for (Category category : list) {
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Object> map1 = new HashMap<String, Object>();
			map.put("id", category.get("id"));
			map.put("text", category.get("c_name"));
			map.put("c_code", category.get("c_code"));
			map1.put("sup_id", category.get("sup_id"));
			map1.put("orderby", category.get("orderby"));
			map.put("attributes", map1);
			
			map.put("children", getChild(category.get("id")));
			result.add(map);
		}
		return result;
	}
	
	public List<Category> getChildByCode(String code){
		String sql = "SELECT id,c_name,c_code FROM `t_category` WHERE SUP_ID=(	SELECT ID FROM `t_category`	WHERE C_CODE=? 	AND state = '1' )ORDER BY orderby, c_code";
		return find(sql, code);
	}
	
	public List<Category> getData(Object supid){
		String sql = "select id,c_name,orderby,sup_id,c_code from t_category where sup_id=? order by orderby ";
		List<Category> list = find(sql,supid);
		return list;
	}
	//分页
	public Page<Category> getPageList(int pageNumber, int pageSize){
		String sql="select id,c_name,sup_id,orderby,remark,c_code,state";
		StringBuffer sqlExceptSelect = new StringBuffer();
		sqlExceptSelect.append("from t_category");
		return dao.paginate(pageNumber, pageSize, sql,
				sqlExceptSelect.toString());
	}
	
}
