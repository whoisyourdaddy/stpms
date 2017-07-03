package com.tengxiang.controller;

import java.io.UnsupportedEncodingException;

import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.render.FreeMarkerRender;
import com.tengxiang.common.Util;
import com.tengxiang.interceptor.CheckLoginInterceptor;
import com.tengxiang.model.admin.User;

import freemarker.template.TemplateModelException;

public class LoginController extends Controller {
	public void index() {
		render("login.jsp");
	}

	@Before(LoginValidator.class)
	public void checkLogin() throws TemplateModelException {

		User res = User.dao
				.checkLogin(getPara("username"), getPara("password"));

		if (!Util.isEmpty(res) && !Util.isEmpty(res.get("id"))) {
			setAttr("userInfo", res);
			setSessionAttr("user", res);
			setSessionAttr("userName", res.get("user_name"));
			setSessionAttr("userID", res.get("id"));
			setSessionAttr("token", res.get("token"));
			FreeMarkerRender.getConfiguration().setSharedVariable("userID",
					res.get("user_name").toString());
			// redirect("/first");
			redirect("/showIndex");

		} else {
			setAttr("loginMsg", "用户名或密码错误，  请核对后再试！");
			render("login.jsp");
		}

	}

	@Before(CheckLoginInterceptor.class)
	public void showIndex() {
		String flag = "0";
		User re = new User();
		if (re.getAllType(getSessionAttr("userName")).get(0).get("type")
				.equals("ZHUGUAN")) {
			flag = "1";
			// render("main.jsp");
		} /*
		 * else if (re.getAllType(getSessionAttr("userName")).get(0).get("type")
		 * .equals("ZHUANYUAN")) { render("main2.jsp"); } else { }
		 */
		setSessionAttr("flag", flag);
		render("main.jsp");// flag设置权限

	}

	public void logout() {
		// getSession().setAttribute("userID", null);
		getSession().invalidate();
		render("login.jsp");
	}

	@Before(CheckLoginInterceptor.class)
	public void importHired() {
		render("importHired.jsp");
	}

	/*
	 * public void revise(){ String username=getPara("username");
	 * setAttr("username", username); render("/WEB-INF/view/first.jsp");
	 * 
	 * render("/admin"); }
	 */

	/*
	 * @Before(CheckLoginInterceptor.class) public void uploadHiredList(){
	 * 
	 * String datePath = Util.getDate("yyyyMMdd"); // 文件保存目录URL String urlPath =
	 * "/upload/"; urlPath += datePath + "/"; // 文件保存目录路径 String savePath =
	 * PathKit.getWebRootPath() + urlPath;
	 * 
	 * 
	 * Map <String, Object>results = new HashMap<String, Object>();
	 * 
	 * List<UploadFile> fileList = null; fileList = getFiles(savePath);
	 * 
	 * List<String> nameList = Util.upload(fileList, savePath, "file");
	 * 
	 * System.out.println(savePath); System.out.println(nameList);
	 * 
	 * if(fileList != null && fileList.size() > 0){ if (nameList.isEmpty() ==
	 * false) { urlPath += nameList.get(0);
	 * 
	 * results.put("url", urlPath);
	 * 
	 * HiredFileList hfl = getModel(HiredFileList.class);
	 * 
	 * hfl.set("file_path", savePath + nameList.get(0)); hfl.set("create_user",
	 * getSessionAttr("userID"));
	 * 
	 * hfl.save();
	 * 
	 * System.out.println(urlPath); renderJson(results); return;
	 * 
	 * } } results.put("msg", "上传失败，请确认文件是否符合要求后再试。"); renderJson(results); }
	 * 
	 * @Before(CheckLoginInterceptor.class) public void importHiredList(){
	 * 
	 * Map <String, Object>results = new HashMap<String, Object>();
	 * 
	 * HiredFileList hfl = getModel(HiredFileList.class).getLastFile();
	 * 
	 * if(hfl != null && Util.isEmpty(hfl.get("id")) == false){ String filePath
	 * = hfl.getStr("file_path");
	 * 
	 * List<HiredList> temp =
	 * getModel(HiredList.class).getByFileId(hfl.get("id"));
	 * 
	 * if(temp == null || temp.size() > 0){
	 * 
	 * results.put("msg", "该文件已导入，如需更新请重新上传文件！"); renderJson(results);
	 * 
	 * return; }
	 * 
	 * filePath.replace('/', '\\'); System.out.println(filePath); ExcelReader
	 * excelReader = new ExcelReader(filePath);
	 * 
	 * 
	 * String[] title = excelReader.readExcelTitle();
	 * System.out.println("获得Excel表格的标题:"); System.out.print( " | "); for
	 * (String s : title) { System.out.print(s + " | "); }
	 * 
	 * System.out.println(); List<String[]> content =
	 * excelReader.readExcelContent();
	 * 
	 * for(String [] row : content){ System.out.print( " | "); for(String cell :
	 * row){ System.out.print(cell + " | "); } System.out.println(); }
	 * getModel(HiredList.class).delAll(); for(String [] row : content){
	 * HiredList hl = getModel(HiredList.class); hl.set("name", row[0]);
	 * hl.set("college", row[1]); hl.set("major", row[2]); hl.set("test_no",
	 * row[3]); hl.set("student_id", row[4]); hl.set("file_id", hfl.get("id"));
	 * hl.save(); }
	 * 
	 * } else {
	 * 
	 * System.out.println("null"); } results.put("msg", "导入成功，请至查询页面查看导入结果！");
	 * renderJson(results);; }
	 */
	public void requirement1() {
		render("/WEB-INF/view/requirement/requirement1.jsp");
	}

	public void require() {
		// getSession().invalidate();
		redirect("/requirement");
	}

	@ClearInterceptor
	public void revise() {
		String username = getPara("username");
		try {
			username = new String(username.getBytes("iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		setAttr("username", username);
		render("/WEB-INF/view/modifycode.jsp");
	}

	@ClearInterceptor
	public void isexit() {
		String userName = getPara("userName");
		boolean flag = User.dao.checkname(userName);
		if (flag) {
			renderJson("userName", 1);
		} else {
			renderJson("userName", 0);
		}

	}

	@ClearInterceptor
	public void checkOldPwd() {
		String userName = getPara("userName");
		String oldPwd = getPara("oldPwd");
		User user = User.dao.checkLogin(userName, Util.getMD5Str(oldPwd));
		if (null == user) {
			renderJson("userName", 0);
		} else {
			renderJson("userName", 1);
		}

	}

	@ClearInterceptor
	public void updatepassword() {
		String userName = getPara("userName");
		String newPwd = getPara("newPwd");
		if (userName != null && newPwd != null) {
			int k = Db.update(
					"update t_user set password=? where user_name=? ", Util.getMD5Str(newPwd),
					userName);
			renderJson("count", k);
		} else {
			renderJson("count", 0);
		}
	}
}
