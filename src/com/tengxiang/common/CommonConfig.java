package com.tengxiang.common;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.tengxiang.controller.*;
import com.tengxiang.model.admin.*;

/**
 * API引导式配置
 */
public class CommonConfig extends JFinalConfig {

	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		loadPropertyFile("config.properties");
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
	}

	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		me.add("/", LoginController.class, "/WEB-INF/view/");
		me.add("/tree", TreeController.class, "/WEB-INF/view/tree");
		me.add("/common", CommonController.class);
		me.add("/user", UserController.class, "/WEB-INF/view/user");
		me.add("/requirement", RequirementController.class,
				"/WEB-INF/view/requirement");
		me.add("/project", ProjectController.class, "/WEB-INF/view/project");
		me.add("/applicant", ApplicantController.class,
				"/WEB-INF/view/applicant");
		me.add("/first", FirstController.class, "/WEB-INF/view/");
		me.add("/businesspersonal", BusinessPersonalController.class,
				"/WEB-INF/view/businesspersonal");
		me.add("/khzb", KhzbController.class, "/WEB-INF/view/khzb");
		me.add("/fpxs", FpxsController.class, "/WEB-INF/view/fpxs");
		me.add("/businessteam", BusinessTeamController.class,
				"/WEB-INF/view/businessteam");
		me.add("/personal", PersonalController.class, "/WEB-INF/view/personal");
		me.add("/teamsaleprice", TeamSalePriceController.class,
				"/WEB-INF/view/teamsaleprice");
		me.add("/lyry", LyryController.class, "/WEB-INF/view/lyry");
		me.add("/teamprice", TeampriceController.class,
				"/WEB-INF/view/teamprice");
		me.add("/projecttarget", ProjecttargetController.class,
				"/WEB-INF/view/projecttarget");
		me.add("/saleresult", SaleResultController.class,
				"/WEB-INF/view/saleresult");
		me.add("/meeting", MeetingController.class, "/WEB-INF/view/meeting");

	}

	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		 C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"),
		 getProperty("user"), getProperty("password").trim());
		 me.add(c3p0Plugin);
		 // 配置ActiveRecord插件
		 ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		 me.add(arp);

		/* Oracle 配置 */
//		C3p0Plugin cp = new C3p0Plugin(getProperty("jdbcUrl"),
//				getProperty("user"), getProperty("password").trim());
//		// 配置Oracle驱动
//		cp.setDriverClass("oracle.jdbc.driver.OracleDriver");
//		me.add(cp);
//		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
//		me.add(arp);
//		// 配置Oracle方言
//		arp.setDialect(new OracleDialect());
//		// 配置属性名(字段名)大小写不敏感容器工厂
//		arp.setContainerFactory(new CaseInsensitiveContainerFactory());

		arp.setShowSql(getPropertyToBoolean("devMode", false));

		// 用户表
		arp.addMapping("t_user", User.class);
		// 数据字典
		arp.addMapping("t_category", Category.class);
		// 用户需求表
		arp.addMapping("t_requirement", Requirement.class);
		// 项目信息表
		arp.addMapping("t_project", Project.class);
		// 应聘者管理表
		arp.addMapping("t_applicant", Applicant.class);
		// 用户需求表
		arp.addMapping("t_requirement", First.class);

		// 年度考核指标表
		arp.addMapping("t_khzb", Khzb.class);
		// 分配系数表
		arp.addMapping("t_fpxs", Fpxs.class);
		// 个人分成
		arp.addMapping("t_saletarget_person_ratio", BusinessPersonal.class);
		// 菜单表
		// arp.addMapping("t_menu", Menu.class);
		// 角色表
		// arp.addMapping("t_role", Role.class);
		// 角色菜单表
		// arp.addMapping("t_rolemenu", RoleMenu.class);
		// 用户角色表
		// arp.addMapping("t_userrole", UserRole.class);
		//
		arp.addMapping(" t_saletarget_team_ratio", BusinessTeam.class);
		// 个人接单
		arp.addMapping("t_saletarget_person", Personal.class);
		// 销售分红(团队)
		arp.addMapping("t_saletarget_team", SaleTargetTeam.class);
		arp.addMapping("t_khzb", Teamprice.class);
		// 项目接单
		arp.addMapping("t_projecttarget", Projecttarget.class);
		// 会议记录导入
		arp.addMapping("t_meeting", Meeting.class);
	}

	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {

	}

	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {

	}

}
