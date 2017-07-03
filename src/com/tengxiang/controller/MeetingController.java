package com.tengxiang.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import com.tengxiang.model.admin.FileOperateUtils;
import com.tengxiang.model.admin.CheckLoginInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.tengxiang.common.Util;
import com.tengxiang.model.admin.Meeting;
import com.tengxiang.model.admin.User;
/**
 * 会议记录录入
 * 
 */
@Before(CheckLoginInterceptor.class)
public class MeetingController extends Controller {
	public void index() {
		List<User> zpzylist = User.dao.getUname();// 招聘专员
		this.setAttr("zpzylist", zpzylist);
		render("meeting.jsp");
	}

	/*
	 * 会议记录一览
	 */
	public void allMeeting() {
		Map<String, Object> results = new HashMap<String, Object>();
		int pageIndex = Integer.valueOf(getPara("pageIndex"));
		int limit = Integer.valueOf(getPara("limit"));
		String userid = getPara("userid");

		String date = getPara("date");
		Page<Meeting> meeting = getModel(Meeting.class).getPageList(pageIndex,
				limit, userid, date);
		results.put("rows", meeting.getList());
		results.put("results", meeting.getTotalRow());
		renderJson(JsonKit.toJson(results));
	}

	/*
	 * 新增和编辑会议记录
	 */
	public void updateMeeting() throws IOException {
		Map<String, Object> results = new HashMap<String, Object>();
		Meeting meeting = getModel(Meeting.class);
		
			UploadFile uf = getFile("fujian");
			
			List<UploadFile>  ff =getFiles();
			
			if (null != uf) {
				String path = uf.getSaveDirectory();
				String fileName = uf.getFileName();// 处理过的文件名
				String orginalName = uf.getOriginalFileName();
				String orginalNamePre = orginalName.substring(0, orginalName
						.lastIndexOf(".") == -1 ? orginalName.length()
						: orginalName.lastIndexOf("."));
				String fileType = fileName.substring(
						fileName.lastIndexOf(".") + 1, fileName.length());
				String newName = orginalNamePre + "_"
						+ System.currentTimeMillis() + "." + fileType;
				File f = FileOperateUtils.createFile(path, newName);
				FileUtils.copyFile(uf.getFile(), f);
				String file = File.separator + "upload" + File.separator
						+ newName;
				meeting.set("record", file);
				if (uf.getFile().exists()) {
					uf.getFile().delete();
				}
			}
			
			meeting.setAttrs(paraMap2ModelMap(getParaMap(), getParaNames()));
			
			if (Util.isEmpty(meeting.get("id"))) {
				meeting.put("create_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
				meeting.put("creator", getSessionAttr("userID"));
				meeting.put("userid", getSessionAttr("userID"));
				meeting.put("flag", "1");
				meeting.save();
			} else {
				meeting.put("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
				meeting.put("updator", getSessionAttr("userID"));
				meeting.put("userid", getSessionAttr("userID"));
				meeting.update();
			}
			results.put("success", true);
			
			redirect("/meeting");
	}

	/*
	 * 删除会议记录
	 */
	public void delMeeting() {

		Map<String, Object> results = new HashMap<String, Object>();

		int i = 0;
		while (!Util.isEmpty(getPara(i))) {
			Meeting fpxs = getModel(Meeting.class);
			fpxs.set("id", getPara(i));
			fpxs.set("flag", "0");
			fpxs.set("update_time", Util.getDate("yyyy-MM-dd HH:mm:ss"));
			fpxs.set("updator", getSessionAttr("userID"));
			fpxs.update();
			i++;
		}
		results.put("success", true);
		renderJson(results);
	}
	
	
	public void download() {

		Meeting szzj = Meeting.dao.findById(getParaToInt("id"));
		String webdir = PathKit.getWebRootPath();
		String FUJIAN = szzj.getStr("record");
		String fullpath = webdir + FUJIAN;
		File file = new File(fullpath);
		if (file.exists()) {
			renderFile(file);
			return;
		} else {
			renderHtml("<div align='center' style='margin-top: 20%'>文件不存在！请联系管理员。&nbsp;<a href='javascript:void(0);'onclick='window.history.back();'>关闭</a></div>");
			return;
		}
	}

	public Map<String, Object> paraMap2ModelMap(Map<String, String[]> para,
			Enumeration<?> names) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String name;
		while (names.hasMoreElements()) {
			name = names.nextElement().toString();

			if ("b".equals(name)) {
				continue;
			}
			

			if ("file".equals(name)) {
				continue;
			}
			
			if("fujian".equals(name) ){
				continue;
			}
			if("id".equals(name) && Util.isEmpty(para.get(name)[0])){
				continue;
			}

			try {
				modelMap.put(name, para.get(name)[0]);
			} catch (ActiveRecordException e) {
				continue;
			}
		}
		return modelMap;
	}

}
