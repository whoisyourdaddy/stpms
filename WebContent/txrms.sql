/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 60011
Source Host           : 127.0.0.1:3306
Source Database       : txrms

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2017-06-14 15:52:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_applicant
-- ----------------------------
DROP TABLE IF EXISTS `t_applicant`;
CREATE TABLE `t_applicant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_data` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `graduate_time` varchar(20) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `work_year` varchar(20) DEFAULT NULL,
  `japan_level` varchar(20) DEFAULT NULL,
  `postion` varchar(50) DEFAULT NULL,
  `interview_id` varchar(20) DEFAULT NULL,
  `interview_time` varchar(20) DEFAULT NULL,
  `reinterview_time` varchar(20) DEFAULT NULL,
  `interview_man` varchar(20) DEFAULT NULL,
  `is_interview` varchar(20) DEFAULT NULL,
  `is_ok` varchar(20) DEFAULT NULL,
  `report_time1` varchar(20) DEFAULT NULL COMMENT '预计报道时间',
  `report_time2` varchar(20) DEFAULT NULL COMMENT '实际报到时间',
  `salary` varchar(20) DEFAULT NULL COMMENT '转正工资',
  `reason` varchar(255) DEFAULT NULL,
  `advice` varchar(255) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `requirement_name` varchar(255) DEFAULT NULL,
  `requirement_id` int(11) DEFAULT NULL,
  `flag` varchar(255) DEFAULT '1',
  `firetime` varchar(20) DEFAULT NULL COMMENT '离职时间',
  `zhuanzheng_time` varchar(20) DEFAULT NULL COMMENT '转正时间',
  `shiyong_salary` varchar(20) DEFAULT NULL COMMENT '试用期工资',
  `update_time` date DEFAULT NULL COMMENT '更新时间',
  `data_resource` varchar(255) DEFAULT NULL COMMENT '应聘者数据来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_applicant
-- ----------------------------
INSERT INTO `t_applicant` VALUES ('1', '2015-07-28', '周磊', '', '', '18796001252', '2010-7-1', '研究生', '4', '', '', '电话面试', '', '', '', '', '', '', '', '', '', '', '王月', '苏州久保田--开发--Java', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('2', '2015-07-29', '王浩', '22', '', '15618790097', '', '本科', '1', '', '软件工程师', '电话面试', '2015-07-30', null, '唐文玉', '未面试', '', '', '', '', '', '', '唐文玉', null, null, '0', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('3', '2015-07-24', '朱冰', '25', 'z901214b@163.com', '18155717232', '2015-07-01', '专科', '2', '', 'java工程师', '电话面试', '2015-07-17', null, '俞老师', '', '', '', '', '8K', '31号电话面试', '', null, null, null, '0', null, null, null, null, 'OTHER_COMPANY');
INSERT INTO `t_applicant` VALUES ('4', '2015-07-29', '陈浩', '22', '15618790097@163.com', '15618790097', '2014-07-16', '本科', '1', 'N1', '软件工程师', '电话面试', '2015-08-01', '', '', '', '不录用', '', '', '12K', '因在职原因，过几天面试', '', '吴滢', '南京苏宁--开发--Java,南京雨润--开发--.Net', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('5', '2015-07-29', '郭宏金', '25', 'gsshine@126.com', '15262418675', '2012-06-01', '专科', '2', '', '软件工程师', '电话面试', '2015-07-29', null, '俞老师', '已面试', '', '', '', '5.8K', '电话面试未过', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('6', '2015-07-29', '刘明', '24', '', '13182299575', '2012-7-1', '专科', '3', '', 'java软件工程师', '电话面试', '2015-07-29', '', '', '', '不录用', '', '', '', '不来公司面试了', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('7', '2015-07-29', '吴海勇', '24', '18168276719@163.com', '18168276719', '2014.7.15', '专科', '1', 'N1', '软件工程师', '电话面试', '2015-08-04', null, '', '未面试', '不录用', '', '', '6-7K', '因在职原因，过几天面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('8', '2015-07-29', '胡晓飞', '30', 'asd0825@163.com', '13776541608', '2002.9.16', '本科', '7', 'N1', '程序开发', '电话面试', '2015-08-08', null, '', '未面试', '不录用', '', '', '', '因在职原因，过几天面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('9', '2015-07-23', '朱冰', '25', 'z901214b@163.com', '18155717232', '2015-07-01', '专科', '2', '', '软件工程师', '电话面试', '', null, '俞老师', '未面试', '不录用', '', '', '', '待现场面试', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('10', '2015-07-30', '陈文杰', '25', '532571266@qq.com', '13685219845', '2011-07-01', '专科', '2', '', '软件测试', '电话面试', '2015-08-03', null, '俞老师', '', '', '', '', '6.5K', '现场面试', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('11', '2015-07-30', '张亮', '28', '2655904102@qq.com', '13739242969', '2010-07-01', '专科', '', '', 'java工程师', '电话面试', '2015-07-30', null, '俞老师', '', '', '', '', '7K', '31号到项目现场面试', '', '陈蓉', null, null, '0', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('12', '2015-07-30', '潘平', '24', '1182998449@qq.com', '15623859351', '2014.7.6', '专科', '1', '', 'java软件工程师', '电话面试', '2015-07-30', '', '王月', '', '不录用', '', '', '7K', '已经找到工作了，嫌我们远', '', '赵建', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('13', '2015-07-30', '吴海勇', '24', '18168276719@163.com', '18168276719', '2014.7.13', '专科', '1', 'N1', '软件工程师', '电话面试', '2015-07-30', null, '唐文玉', '已面试', '不录用', '', '', '', '未进行现场面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('14', '2015-07-30', '柳杨', '24', '1196613682@qq.com', '13370826695', '2013.7.18', '本科', '2', 'N1', '软件工程师', '电话面试', '', null, '', '未面试', '不录用', '', '', '', '待面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('15', '2015-07-30', '杨先生', '35', '114914988@qq.com', '15064007139', '2005.7.6', '本科', '7', '', '软件工程师', '', '', null, '', '', '', '', '', '', '待面试', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('19', '2015-07-31', '唐文玉', '22', '', '13814486619', '', '专科', '', 'N1', '', '电话面试', '', null, '', '未面试', '不录用', '', '', '', '', '', '唐文玉', null, null, '0', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('20', '2015-07-30', '张亮', '28', '2655904102@qq.com', '13739242969', '2010-07-01', '专科', '2年', '', 'java工程师', '电话面试', '2015-07-30', '', '俞老师', '', '到职', '2015-08-04', '2015-08-10', '7.5K', '家里有事，下周二三报到,直接录用', '', '陈蓉', '', null, '1', '', '2015-11-04', '', null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('21', '2015-07-31', '苗笑笑', '24', 'miaochenxiao@163.com', '18855348086         ', '2015.6.22', '专科', '0.5', '', '软件工程师', '电话面试', '2015-07-31', null, '唐文玉', '已面试', '不录用', '', '', '', '技术不行', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('22', '2015-07-31', '王玉冬', '26', '1014470255@qq.com', '13260986183', '2012-06-01', '专科', '2', '', 'java工程师', '电话面试', '2015-07-31', null, '陈蓉', '', '', '', '', '', '考虑一下，下周一回复', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('23', '2015-07-31', '王星贵', '24', '13392839263@163.com', '13392839263', '2013.6.28', '专科', '2', 'N1', '软件工程师', '', '2015-07-31', null, '唐文玉', '已面试', '不录用', '', '', '8K', '未安排现场面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('24', '2015-07-31', '曹俊', '24', '250433460@qq.com', '13524222623', '2012.7.6', '专科', '3', 'N1', '.net软件工程师', '电话面试', '2015-07-31', null, '', '未面试', '不录用', '', '', '', '在考虑薪资，礼拜一给我答复', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('25', '2015-07-31', '熊溪', '24', 'xiongxi1990@sina.com', '15951889282', '2013.7.6', '本科', '2', 'N1', '软件测试', '电话面试', '2015-07-31', null, '', '', '', '', '', '', '电话面试没有打通，礼拜一再沟通', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('26', '2015-08-03', '王满菊', '24', '1083721744@qq.com', '18362634937', '2013.7.6', '本科', '1.5', '', 'java软件工程师', '电话面试', '2015-08-03', null, '', '未面试', '不录用', '', '', '', '电话面试产品知识不清楚', '', '王月', null, null, '0', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('27', '2015-08-03', '黄胜', '24', '1120683933@qq.com', '15152291978', '2012.7.15', '专科', '1.5', 'N1', '软件工程师', '电话面试', '2015-08-03', null, '唐文玉', '已面试', '不录用', '', '', '1.5K', '工资太高', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('28', '2015-08-03', '王大权', '25', '582525842@qq.com', '18151293961', '2011-07-01', '专科', '2', '', 'java工程师', '电话面试', '2015-08-03', null, '陈蓉', '', '', '', '', '6k', '未去项目现场面试', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('29', '2015-08-03', '唐文玉', '22', '1059240096@qq.COM', '13814486619', '2012.6.18', '专科', '2', 'N1', '软件工程师', '电话面试', '2015-08-03', null, '王月', '已面试', '不录用', '', '', '', '', '', '王月', null, null, '0', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('30', '2015-08-03', '王满菊', '24', '1083721744@qq.com', '18362634937', '2013.7.6', '本科', '1.5', '', 'java软件工程师', '电话面试', '2015-08-03', null, '', '未面试', '不录用', '', '', '6k', 'java软件知识不熟', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('31', '2015-08-03', '丁胜蓝', '22', '1343105014@qq.com', '13053775611', '2012.12.8', '专科', '1', 'N1', '软件工程师', '电话面试', '2015-08-03', null, '王月', '已面试', '不录用', '', '', '', '未现场面试', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('32', '2015-08-03', '刘洋', '24', '', '15701353950', '2014.7.15', '专科', '1.5', 'N1', '软件工程师', '电话面试', '2015-08-03', null, '陈蓉', '已面试', '不录用', '', '', '', '未现场面试', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('33', '2015-08-04', '曹德恩 ', '25', 'caodeencom@sina.com', '13073380580', '2013.6.29', '专科', '4', '', '测试', '', '', null, '', '', '', '', '', '', '月薪8k，四年测试经验，明天面试', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('34', '2015-08-04', '岳彩强', '26', '354973599@qq.com', '13962154014', '2012.7.6', '本科', '4', '', 'java', '电话面试', '2015-08-05', '', '', '', '到职', '2015-01-04', '2015-01-07', '', '明天下午面试，下周一可以到项目组报道，期望工资是8k', '', '王月', '', null, '1', '', '', '', null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('35', '2015-08-04', '章罕', '25', '18756289281@163.com', '18756289281', '2014.7.2', '专科', '0.5', 'N1', '软件工程师', '电话面试', '', null, '', '未面试', '不录用', '', '', '', '简历收到，今天没时间面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('36', '2015-08-04', '施捷', '25', 'ookswyou@163.com', '15950562214', '2011.7.13', '本科', '3', 'N1', '软件工程师', '电话面试', '', null, '', '未面试', '不录用', '', '', '', '不方便接电话  明天面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('37', '2015-08-04', '皮应成', '23', '402922013@qq.com', '15620636581', '2015.7.13', '本科', '0', 'N1', '软件工程师', '电话面试', '', null, '', '未面试', '不录用', '', '', '', '在校生', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('38', '2015-08-05', '苏俊', '26', '1010211420@qq.com', '18788823595', '2013.7.18', '专科', '0.4', 'N1', '安卓开发工程师', '电话面试', '', null, '', '未面试', '不录用', '', '', '', '在扣扣上交谈过，想在上海做安卓，经验太少，只有四个月', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('39', '2015-08-05', '马骁源', '25', '1173212413@qq.com', '13671155084 ', '2013.7.12', '专科', '1', 'N1', '软件工程师', '电话面试', '2015-08-05', null, '唐文玉', '已面试', '不录用', '', '', '', '一直在纠结，人现在在北京，想上海有宿舍必须不超过5人，或者租房要补贴', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('40', '2015-08-05', '宋琪', '22', '', '18351883731', '2015.6.14', '本科', '0', 'N1', '测试人员', '电话面试', '', null, '', '未面试', '不录用', '', '', '', '没用工作经验，在学校培训过，跟在老师后面做过', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('41', '2015-08-05', '郑廉', '28', '575852269@qq.com', '18896736951', '2013.6.7', '研究生', '2', '', '安卓', '电话面试', '2015-08-05', null, '', '', '不录用', '', '', '8.5', '工资要求有点高', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('42', '2015-08-05', '黄小燕', '25', '573715686@qq.com', '13770775052', '2011.7.6', '本科', '4', 'N1', '测试人员', '电话面试', '2015-08-07', null, '', '未面试', '不录用', '', '', '6-7K', '一个月内上岗，周五面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('43', '2015-08-05', '黄森', '29', '83506059@qq.com', '13851501112', '2008.7.6', '本科', '3', '', 'java', '电话面试', '2015-08-05', null, '', '', '不录用', '', '', '9k', '一个月之后才能上岗', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('44', '', '钟超', '24', '', '18020126838', '', '本科', '4', '', '', '', '', null, '', '', '', '', '', '12-13K', '星期五俞老师电话面试', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('45', '', '周中华', '25', '', '18861473674', '', '专科', '4', '', '', '电话面试', '', null, '俞老师', '', '', '', '', '8-9K', '星期五项目组面试', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('46', '2015-08-06', '宋涛', '28', '', '18651080917', '', '专科', '2', '', '', '电话面试', '2015-08-06', null, '', '', '', '', '', '7K', '等待项目现场面试', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('47', '2015-08-06', '朱佳涛 ', '25', '350016917@qq.com', '13862400703', '2014.7.6', '本科', '1', '', 'java软件工程师', '电话面试', '2015-08-06', '', '', '', '', '', '', '5K', '就是做的项目太少了', '', '王月', '', null, '1', '', '', '', null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('48', '2015-08-06', '陈婷 ', '26', '', '18505241816', '2012.6.28', '本科', '3', '', '安卓', '电话面试', '2015-08-06', null, '', '', '', '', '', '', '产品知识不行', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('49', '2015-08-06', '张虎', '23', '', '15005174126', '2014.6.12', '专科', '1', '', '软件工程师', '电话面试', '2015-08-06', null, '唐文玉', '已面试', '不录用', '', '', '', '未现场面试', '', '唐文玉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('50', '', '杨丹丹', '25', '', '15005187554', '', '本科', '4', '', '测试', '', '', null, '', '', '', '', '', '5K', '下周一电话面试', '', '陈蓉', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('51', '2015-08-07', '张蒙', '24', '840227161@qq.com', '15295599028', '2013.7.4', '本科', '2', 'N4', '安卓师', '电话面试', '', '', '', '', '录用', '2016-02-15', '2016-01-01', '12K', '薪资太高，不录用', '哈哈', '唐文玉', '', null, '1', '', '', '', '2016-05-05', 'OTHER_COMPANY');
INSERT INTO `t_applicant` VALUES ('52', '2015-08-07', '邢秀', '26', 'xingxiu1989@163.com', '15062462991', '2010.7.6', '本科', '4', '', '测试', '电话面试', '', '', '', '', '到职', '', '2016-01-02', '7k', '今天晚上八点给她面试', '哈哈', '王月', '', null, '1', '', '', '', '2016-03-31', 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('53', '2015-08-07', '邓文涛', '23', 'abeldeng361@sina.com', '15189832859', '2014.7.6', '本科', '1', '', 'java一年', '电话面试', '', null, '', '', '', '', '', '8k', '礼拜六下午电话面试', '', '王月', null, null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('54', null, '孔露露', '', '', '15961058754', '', '本科', '4年', '', '.net工程师', '电话面试', '', '', '', '', '', '', '', '6K', '明天来公司面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('55', null, '杜婷', '24', 'dt9154@163.com', '18013920747', '2013.6.30', '本科', '2', '', '测试', '电话面试', '2015-08-10', '', '王月', '', '不录用', '', '', '6k', '问的问题一个都没回答出来', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('56', null, '朱书森', '25', 'z_webapps@163.com', '13776646593', '2012.6.30', '本科', '4', '', 'Java软件工程师', '电话面试', '2015-08-10', '', '', '', '未面试', '', '', '8.5k', '不选择外包公司', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('57', null, '蒋玉红', '30', 'jyh10112000@163.com ', '15951843887', '2009.7.3', '本科', '一年半', 'N1', '软件测试', '电话面试', '', '', '', '', '离职', '', '2016-01-10', '6K', '未电话面试', '', '唐文玉', '', null, '1', '2016-02-22', null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('58', null, '陈祝清', '25', '427717672@qq.com', '18013894018', '', '本科', '两年多', '', 'C++', '电话面试', '', '', '', '', '未面试', '', '', '6500+', '未电话面试', '', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('59', null, '丁胜蓝', '25', '1343105014@qq.com', '13053775611', '2014.6.12', '本科', '1', 'N1', '软件工程师', '电话面试', '', '', '', '', '不录用', '', '', '', '', '未电话面试，虽然年限一年，不过是应届生', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('60', null, '王敏', '25', '1006824860@qq.com', '18516285867', '2012.6.30', '本科', '3', '', '软件测试', '电话面试', '2015-08-11', '', '王月', '', '复试中', '', '', '6.5k', '电话面试蛮好的，等待去现场面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('61', null, '史丽莎', '26', '1653864769@qq.com', '15105161512', '2013.6.30', '本科', '2', '', '软件测试', '电话面试', '2015-08-11', '', '王月', '', '复试中', '', '', '5k', '等待现场面试，电话面试说的蛮好的', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('62', null, '张瑜', '23', '846099277@qq.com', '15105161512', '2014.6.30', '本科', '1', '', 'java', '电话面试', '2015-08-11', '', '王月', '', '复试中', '', '', '5k', '电话面试还可以，等待到项目组面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('63', null, '宋保明', '25', '', '13818969644', '2011.6.11', '本科', '4年', 'N1', '软件工程师', '电话面试', '', '', '', '', '未面试', '', '', '13K', '', '没有电话面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('64', null, '曹成林', '', '', '1123', '', '本科', '', '', '', '电话面试', '', '', '', '', '', '', '', '', '', '', '王月', '', null, '0', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('65', null, '于贾龄', '', '', '17715278340', '', '本科', '4', '', '', '电话面试', '', '', '', '', '', '', '', '6K', '明天去项目组面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('66', null, '徐宗田', '21', '', '15850781158', '2014.7.6', '专科', '1', '', 'java', '电话面试', '2015-08-12', '', '', '', '', '', '', '5k', '电话面试通过。等待现场面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('67', null, '陈钰', '28', '', '18251365379', '', '本科', '3', '', '', '电话面试', '', '', '俞老师', '', '', '', '', '6-8K', '下周一去苏州公司报到', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('68', null, '于贾龄', '', '', '17715278340', '', '本科', '3', '', '', '电话面试', '', '', '', '', '', '', '', '6K', '南京五台山面试等结果', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('69', null, '张云和', '24', '', '15083542397', '2012.6.30', '专科', '3', '', '', '电话面试', '2015-08-13', '2015-08-14', '', '', '', '2015-08-14', '', '14', '电话面试通过，等待现场面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('70', null, '李世申 ', '26', 'lishes@126.com', '17712166679', '2011.6.30', '专科', '4', '', '。net', '电话面试', '', '', '', '', '未面试', '', '', '9-10k', '下周电话面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('71', null, '王志伟', '23', '277502468@qq.com', '15371878232', '2014.6.30', '本科', '1年3个月', '', 'java', '电话面试', '', '', '', '', '未面试', '', '', '5k', '下周三电话面试，周五安排去项目组面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('72', null, '黄程', '21', '314771251@qq.com', '13410658464', '2014.6.12', '专科', '1年', '', '软件工程师', '电话面试', '', '', '', '', '不录用', '', '', '', '', '没有电话面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('73', null, '黄全有', '28', '', '13951785172', '', '本科', '3', '', '', '电话面试', '', '', '', '', '', '', '', '8K', '待俞老师电话面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('74', null, '张彬', '', '', '15121050486', '', '本科', '2', '', '', '电话面试', '', '', '', '', '', '', '', '9.5k', '待项目现场面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('75', null, '蔡厚琦', '22', 'Caihouqi789@126.com', '18170708028', '2014.6.30', '专科', '1', '', 'java', '电话面试', '2015-08-17', '', '', '', '', '', '', '5k', '电话面试还行，等待现场面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('76', null, '卫阳阳', '20', '1010474315@qq.com ', '18092630463', '', '专科', '1年', '', '软件工程师', '电话面试', '', '', '', '', '不录用', '', '', '6.5K', '', '未电话面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('77', null, '李齐 ', '30', ' 348738492@qq.com', '18516099964', '2008.6.30', '本科', '3', '', 'java', '电话面试', '', '', '', '', '未面试', '', '', '8k以上', '晚上给他面试，辞职要两周，下周一可以去项目组面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('78', null, '张彬', '', '', '15121050486', '', '本科', '', '', '', '电话面试', '', '', '', '', '', '', '', '9.5K', '19号项目组面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('79', null, '卫阳阳', '20', '1010474315@qq.com', '18092630463', '2014.7.11', '专科', '1年', '', '软件工程师', '电话面试', '', '', '', '', '不录用', '', '', '6.5K', '', '电话聊了一会  不接受外包', '唐文玉', '', null, '0', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('80', null, '施春雨', '', '', '18625161045', '', '本科', '', '', '', '电话面试', '', '', '', '', '', '', '', '9K', '20号去南京项目组面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('81', null, '刘中胤', '26', 'lanceliuzy@126.com', ' 18827390447', '2014.7.12', '专科', '1年', '', '软件工程师', '电话面试', '2015-08-18', '', '唐文玉', '', '不录用', '', '', '', '回答基本不会，不录用', '', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('82', null, '杨涛', '25', '1007221242@qq.com', '15996207360', '2012.9.12', '本科', '3年', '', '安卓师', '电话面试', '', '', '', '', '不录用', '', '', '10000', '', '不接受外包', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('83', null, '黄全有', '', '', '13951785172', '', '本科', '', '', '', '电话面试', '', '', '', '', '', '', '', '8K', '直接录用', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('84', null, '刘博', '25', '550983464@qq.com', '18681856523', '', '本科', '3年', '', 'Java软件工程师', '电话面试', '2015-08-21', '', '', '', '未面试', '', '', '7K', '', '未电话面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('85', null, '聂文奇', '24', '648986225@qq.com', '13545112215', '2013.6.30', '专科', '2', '', 'java', '电话面试', '', '', '', '', '', '', '', '8k', '月底回来去南京项目组面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('86', null, '刘小晨', '26', '', '18518372087', '2014-07-01', '本科', '1', '', 'Java软件工程师', '电话面试', '', '', '余志鹏', '', '复试中', '', '', '', '', '', '赵建', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('87', null, '顾先生', '25', 'kobe2614@163.com', '13773274590', '2012.6.30', '本科', '2', '', 'Java软件工程师', '电话面试', '', '', '', '', '未面试', '', '', '7.5k', 'Java2年多，办离职需要一个月，薪资是7.5k，现在在苏州，周六上午安排电话面试，周一下午有空到公司面试。', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('88', null, '徐刚', '', '', '18962214875', '', '本科', '', '', '.net', '电话面试', '', '', '', '', '', '', '', '12K', '下周二去上海面试', '', null, '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('89', null, '朱思雨 ', '24', 'ziciyue@163.com', '15180347829 ', '2014.6.12', '本科', '1年', '', 'C#', '电话面试', '', '', '', '', '不录用', '', '', '5K', '', '上海招至少两年Java，他一年的经验', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('90', null, '李亮', '25', '306652058@qq.com', '18951818211', '2010.6.14', '专科', '5年', '', '软件工程师', '电话面试', '2015-08-25', '', '', '', '未面试', '', '', '13K', '', '明天面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('91', null, '树志平', '', '', '18016302696', '', '本科', '', '', '', '电话面试', '', '', '', '', '', '', '', '', '下周一来公司面试', '薪资到时候再谈', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('92', null, '陈当雷', '', '', '13584801182', '', '本科', '', '', '', '电话面试', '', '', '', '', '', '', '', '13K', '周五去宝钢面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('93', null, '李泽文', '25', '529013398@Qq.com', '18662450384', '2011.6.30', '本科', '3', '', '.net', '电话面试', '', '', '', '', '未面试', '', '', '6k', '今天晚上回去电话面试，现在已经辞职，随时上班', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('94', null, '许婷婷', '', '', '18651100972', '', '本科', '4', '', 'Android工程师', '电话面试', '', '', '', '', '', '', '', '10K以上', '星期四面试\r\n', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('95', null, '左卿 ', '28', '328103224@qq.com', '18994380927', '2010.6.30', '专科', '3', '', 'PHP、', '电话面试', '', '', '', '', '', '', '', '8k', '明天下午去项目现场面试。', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('96', null, '江绪雨', '25', '1065711826@qq.com', '15395094848', '2013.6.14', '本科', '一年多', '', '软件工程师', '电话面试', '2015-08-25', '2015-08-27', '唐文玉', '', '复试中', '', '', '4500-5000', '', '等现场面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('97', null, '蒋召昆 ', '23', '', '18855521061', '2014.6.30', '本科', '1.5', '', 'php', '电话面试', '', '', '', '', '', '', '', '7k', '等待项目现场通知去面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('98', null, '徐江平', '25', 'simtest@163.com', '18752088782', '2009.6.30', '专科', '4', '', '软件测试', '电话面试', '', '', '', '', '未面试', '', '', '4k', '今天有点忙，明天联系，办离职要一个星期，要在建邺区', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('99', null, '郑娜娜', '', ' 865236169@qq.com', '15150515497', '', '本科', '1', '', '', '电话面试', '', '', '', '', '', '', '', '7K', '明天下午去项目组面试\r\n', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('100', null, '明文维', '', '', '18252079432', '', '本科', '1', '', 'Java工程师', '电话面试', '', '', '', '', '离职', '', '2016-01-10', '5.5K', '明天俞老师电话面试', '已经离职 ，随时可以入职', '陈蓉', '', null, '1', '2016-01-15', null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('101', null, '吴昊', '26', '2827713867@qq.com', '15851723937', '2013.7.12', '本科', '三年', '', '软件工程师', '电话面试', '', '', '', '', '未面试', '', '', '待定', '', '等电话面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('102', null, '肖常有 ', '24', 'clareshaw@163.com ', '18684686578', '2013.6.30', '本科', '2', '', '安卓', '电话面试', '', '', '', '', '', '', '', '10k', '明天去现场面试宝山', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('103', null, '费金喜', '25', '463265414@qq.com', '15051880997', '2008.7.14', '本科', '两年半', '', '软件工程师', '电话面试', '', '', '', '', '', '', '', '', '', '', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('104', null, '戈崇明', '', '', '13145210989', '', '本科', '2', '', 'Android工程师', '电话面试', '', '', '', '', '', '', '', '7-8K', '下周二电话面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('105', null, '吴敏', '', '', '13151535503', '', '本科', '2', '', '', '电话面试', '', '', '', '', '', '', '', '7K', '待确定是否安排去项目组面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('106', null, '林锋', '26', '1326647151@qq.com', '15190553126', '2014.6.12', '本科', '3.4年', '', '软件工程师', '电话面试', '', '', '', '', '未面试', '', '', '8K', '', '周六面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('107', null, '范佳麒', '', '', '13912608486', '', '本科', '4', '', '', '电话面试', '', '', '', '', '', '', '', '7-8K', '周二电话面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('108', null, '孟想', '25', '290834706@qq.com', '15555151512', '2014.6.15', '本科', '一年半', '', 'ios软件工程师', '电话面试', '', '2015-09-01', '', '', '复试中', '', '', '7K', '', '等着去现场去面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('109', null, '张磊', '', '', '15005161568', '', '本科', '3', '', '', '电话面试', '', '', '', '', '', '', '', '5', '待电话面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('110', null, '肖强强', '28', 'vmyspace@163.com', '15651974870', '2011.6.30', '本科', '5', '', 'net java', '电话面试', '', '', '', '', '', '', '', '9k', '.net三年半，java一年半，现在已经离职，期望薪资是9k，在南京，明天上午安排电话面，试，假期过后安排项目组面试，随时上班。决定做。net', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('111', null, '聂颜峰 ', '28', '474353556@qq.com', '15996259936', '2011.6.30', '专科', '4', '', 'Java', '电话面试', '2015-09-01', '', '', '', '未面试', '', '', '11-12k', '4年的 java 要求薪资是11-12k，已经离职，随时去上班，等待去项目组面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('112', null, '张磊2', '', '', '15005161568', '', '本科', '3', '', '', '电话面试', '', '', '', '', '', '', '', '5', '待去项目组面试\r\n', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('113', null, '童振国', '23', '282135617@qq.com', '15000607405', '2012.6.30', '专科', '2.4', '', 'java', '电话面试', '', '', '', '', '复试中', '', '', '8k', '上海java2年四个月，期望薪资8k，现在在职，办离职需要一周，随时去项目组面试，电话面试还行，明天早上去项目组面试\r\n \r\n', '', '王月', '上海宝钢--开发--Java,上海宝钢--开发--Ios', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('114', null, '杭亚运', '', '', '18261000740', '', '本科', '', '', '', '电话面试', '', '', '', '', '', '', '', '6K', '6号电话面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('115', null, '陈蕾', '', '', '15295568577', '', '本科', '', '', '', '电话面试', '', '', '', '', '', '', '', '8.5k', '6号电话面试', '', '陈蓉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('116', null, '岳国建', '23', '', '18721189528', '2013.7.12', '本科', '2年', '', '软件工程师', '电话面试', '', '', '', '', '未面试', '', '', '8.5K', '', '等待面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('117', null, '周龙 ', '24', '13971633986@163.com', '18516593360', '2012.6.30', '本科', '3', '', 'java软件工程师', '电话面试', '', '', '', '', '复试中', '', '', '11k', '三年的java工作经验，现在在职，办离职需要两个礼拜，期望薪资是11k，6号可以去项目现场面试，晚上九点电话面试。', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('118', null, '张学谦 ', '24', 'xueqianzzz@163.com', '15026751997', '2013.6.30', '专科', '2', '', '', '电话面试', '', '', '', '', '', '', '', '8k', '2年java上海，办离职1-2周，期望薪资是8k，下午电话面试，随时去项目组面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('119', null, '洪圣文', '25', '83944980@qq.com', '15121052652', '2012.7.12', '本科', '2年', '', '软件工程师', '电话面试', '', '', '', '', '不录用', '', '', '7K', '', '现在在苏州，想来泰州的  又不考虑外包', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('120', null, '刘兴涛 ', '22', 'q453981759@sina.com', '13582265645', '2013.6.30', '本科', '2', '', 'java', '电话面试', '2015-09-07', '', '', '', '', '', '', '8k', 'Java两年，期望薪资是8k，现在已经离职，随时上班，已经电话面试，可以安排明天早上去项目组面试。期望工作地是上海，马上做简历。刚联系，明天下午才到上海，估计得是后天才能到项目现场面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('121', null, '李捷', '22', '15320554103@163.com', '17721304092', '2014.6.30', '本科', '1', '', '软件测试', '电话面试', '', '', '', '', '复试中', '', '', '5-6k', 'qq联系了一位软件测试1年的工作经验，期望薪资是5-6k，已经离职，随时上班， 会自动化性能测试，测试脚本，已经电话面试，安排明天去项目现场面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('122', null, '熊辉', '27', '1012350897@qq.com', '15021537881', '2012.2.14', '本科', '3年', '', '测试工程师', '电话面试', '', '', '', '', '未面试', '', '', '12K', '', '', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('123', null, '李洋', '28', '286410776@qq.com', '14785566450', '2010.6.30', '专科', '3', '', 'java', '电话面试', '', '', '', '', '未面试', '', '', '10k', 'java三年，期望工作地点是上海，期望薪资是10k，包住宿，已经离职，明天让俞老师面试。', '', null, '上海宝钢--开发--Ios', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('124', null, '侍海园', '25', '656575051@qq.com   ', '18860918451', '2014.7.12', '本科', '两年半', '', '软件工程师', '电话面试', '', '', '', '', '未面试', '', '', '待定', '', '等现场面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('125', '', '张鹏', '30', '', '15921793142', '2009.6.30', '本科', '4年', '', '软件测试', '电话面试', '', '', '', '', '', '', '', '6K', '软件测试  四年 ，期望薪资是6k，已经离职，随时去项目组面试。在南京建邺区，正在整理简历，发给我，帮他安排电话面试，周一下午安排项目现场面试', '建邺区', '王月', '', null, '1', '', '', '', '2016-03-08', 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('126', null, '付毅 ', '25', 'xx242127@163.com', '18502165194', '2012.6.30', '本科', '3', '', 'Java软件开发', '电话面试', '', '', '', '', '复试中', '', '', '13-14', '礼拜一下午到项目现场面试，已经离职，在上海陆家嘴', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('127', null, '朱小军', '29', '1941346182@qq.com', '18796412318', '2010.6.30', '专科', '5', '', 'ios培训生', '电话面试', '', '', '', '', '', '', '', '', '下午来公司面试的，明天下午给答复', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('128', null, '高银华 ', '24', 'gaoyinhua@yeah.net', '18551625609', '2012.6.30', '本科', '3', '', 'java', '电话面试', '', '', '', '', '', '', '', '9k', '等待俞老师面试，通过的话就到项目组上班，办离职需要一个月', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('129', null, '刘西凤 ', '23', '1010588239@qq.com', '17756068083', '2014.6.30', '本科', '1', '', 'java', '电话面试', '', '', '', '', '', '', '', '7.5k', 'Java  一年期望薪资是7.5k，在上海，安排下周二早上去上海陆家嘴软件园面试', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('130', null, '王瑞', '23', '906779145@qq.com', '13862563732', '2013.7.12', '本科', '2', '', '软件工程师', '电话面试', '', '', '', '', '复试中', '', '', '8K', '', '下周可能面试', '唐文玉', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('131', null, '廖双飞 ', '27', 'm18692212592@163.com', '18692212592', '2012.6.30', '本科', '1.5', '', 'php', '电话面试', '', '', '', '', '', '', '', '8k', '已经离职，后天早上十点有空去面试 1.5年的php经验，期望薪资是8k。离漕河泾近一点', '', '王月', '', null, '1', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('132', '', 'JAVA', '', '', '110', '', '本科', '', '', '', '电话面试', '', '', '', '测试项目--开发--Java', '', '', '', '', '', '', '吴滢', '测试项目--开发--Java', null, '0', null, null, null, null, 'SELF_COMPANY');
INSERT INTO `t_applicant` VALUES ('133', '2016-03-02', '周亚萍', '', '3053985022@qq.com', '17712924707', '2002-07-01', '本科', '10年以上', '', '美工', '现场面试', '', '', '', '', '到职', '2016-01-15', '2016-02-15', '3.5K', '2016.3.9号入职签合同，工作地点是在雨花区大数据软件园上班，一年半的包装成两年的，给的薪资是7k，三个月的试用期，交五险一金', '2016-2-15入职上班泰州公司', '吴滢', '', null, '0', '', '', '', '2016-03-08', 'SELF_COMPANY');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(150) DEFAULT NULL,
  `sup_id` int(11) DEFAULT NULL,
  `orderby` int(11) DEFAULT '1',
  `remark` varchar(200) DEFAULT NULL,
  `c_code` varchar(50) DEFAULT NULL,
  `state` char(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('21', '应聘者状态', '0', '1', null, 'ZHUANGTAI', '1');
INSERT INTO `t_category` VALUES ('22', '录用', '21', '3', null, 'LUYONG', '1');
INSERT INTO `t_category` VALUES ('23', '不录用', '21', '4', null, 'BULUYONG', '1');
INSERT INTO `t_category` VALUES ('24', '到职', '21', '5', null, 'DAOZHI', '1');
INSERT INTO `t_category` VALUES ('25', '离职', '21', '6', null, 'LIZHI', '1');
INSERT INTO `t_category` VALUES ('26', '未面试', '21', '1', null, 'WEIMIAN', '1');
INSERT INTO `t_category` VALUES ('27', '复试中', '21', '2', null, 'FUSHI', '1');
INSERT INTO `t_category` VALUES ('38', '物业类型', '0', '99', null, 'MANAGER_TYPE', '1');
INSERT INTO `t_category` VALUES ('39', '公寓', '38', '2', null, 'FLATS', '1');
INSERT INTO `t_category` VALUES ('40', '住宅', '38', '1', null, 'HOUSE', '1');
INSERT INTO `t_category` VALUES ('41', '商铺', '38', '3', null, 'SHOP', '1');
INSERT INTO `t_category` VALUES ('58', '地区', '0', '98', null, 'LOCALHOST', '1');
INSERT INTO `t_category` VALUES ('59', '泰州市', '66', '1', null, 'LOCALHOST_JIANGSU_TAIZHOU', '1');
INSERT INTO `t_category` VALUES ('60', '海陵区', '59', '1', null, 'LOCALHOST_JIANGSU_TAIZHOU_HAILIN', '1');
INSERT INTO `t_category` VALUES ('61', '高港区', '59', '2', null, 'LOCALHOST_JIANGSU_TAIZHOU_GAOGANG', '1');
INSERT INTO `t_category` VALUES ('62', '姜堰区', '59', '3', null, 'LOCALHOST_JIANGSU_TAIZHOU_JIANGYAN', '1');
INSERT INTO `t_category` VALUES ('64', '城南', '60', '1', null, 'LOCALHOST_JIANGSU_TAIZHOU_HAILIN_CHENGNAN', '1');
INSERT INTO `t_category` VALUES ('65', '城北', '60', '2', null, 'LOCALHOST_JIANGSU_TAIZHOU_HAILIN_CHENGBEI', '1');
INSERT INTO `t_category` VALUES ('66', '江苏省', '58', '1', null, 'LOCALHOST_JIANGSU', '1');
INSERT INTO `t_category` VALUES ('67', '年', '0', '999', null, 'YEAR', '1');
INSERT INTO `t_category` VALUES ('68', '1987', '67', '1987', null, '1987', '1');
INSERT INTO `t_category` VALUES ('69', '1988', '67', '1988', null, '1988', '1');
INSERT INTO `t_category` VALUES ('70', '1989', '67', '1989', null, '1989', '1');
INSERT INTO `t_category` VALUES ('71', '1990', '67', '1990', null, '1990', '1');
INSERT INTO `t_category` VALUES ('72', '月', '0', '1000', null, 'MONTH', '1');
INSERT INTO `t_category` VALUES ('73', '1', '72', '1', null, '1', '1');
INSERT INTO `t_category` VALUES ('77', '5', '72', '5', null, '5', '1');
INSERT INTO `t_category` VALUES ('78', '6', '72', '6', null, '6', '1');
INSERT INTO `t_category` VALUES ('79', '状态', '0', '7', null, 'STATUS_TYPE', '1');
INSERT INTO `t_category` VALUES ('80', '在职', '79', '1', null, 'STATUS_TYPE_ZAIZHI', '1');
INSERT INTO `t_category` VALUES ('81', '离职', '79', '2', null, 'STATUS_TYPE_LIZHI', '1');
INSERT INTO `t_category` VALUES ('82', '用户类型', '0', '10', null, 'USER_TYPE', '1');
INSERT INTO `t_category` VALUES ('83', '专员', '82', '1', null, 'ZHUANYUAN', '1');
INSERT INTO `t_category` VALUES ('84', '主管', '82', '2', null, 'ZHUGUAN', '1');
INSERT INTO `t_category` VALUES ('85', '项目地点', '0', '1', null, 'LOCATION', '1');
INSERT INTO `t_category` VALUES ('86', '泰州', '85', '1', null, 'TAIZHOU', '1');
INSERT INTO `t_category` VALUES ('87', '苏州', '85', '1', null, 'SUZHOU', '1');
INSERT INTO `t_category` VALUES ('88', '嘉兴', '85', '1', null, 'JIAXIN', '1');
INSERT INTO `t_category` VALUES ('89', '南京', '85', '1', null, 'NANJING', '1');
INSERT INTO `t_category` VALUES ('90', '无锡', '85', '1', null, 'WUXI', '1');
INSERT INTO `t_category` VALUES ('91', '上海', '85', '1', null, 'SHANGHAI', '1');
INSERT INTO `t_category` VALUES ('92', '杭州', '85', '1', null, 'HANGZHOU', '1');
INSERT INTO `t_category` VALUES ('93', '北京', '85', '1', null, 'BEIJING', '1');
INSERT INTO `t_category` VALUES ('116', '人员类型', '0', '116', null, 'STAFF_LEIXING', '1');
INSERT INTO `t_category` VALUES ('117', '销售', '116', '1', null, 'XIAOSHOU', '1');
INSERT INTO `t_category` VALUES ('118', '开发', '116', '2', null, 'KAIFA', '1');
INSERT INTO `t_category` VALUES ('119', '人事', '116', '3', null, 'RENSHI', '1');
INSERT INTO `t_category` VALUES ('120', '工作方向', '0', '120', null, 'WORK_DIRECTION', '1');
INSERT INTO `t_category` VALUES ('121', 'Java', '120', '1', null, 'Java_Chinese', '1');
INSERT INTO `t_category` VALUES ('122', '.Net', '120', '2', null, '.Net_Chinese', '1');
INSERT INTO `t_category` VALUES ('123', 'C++', '120', '3', null, 'C++', '1');
INSERT INTO `t_category` VALUES ('124', 'Android', '120', '4', null, 'Android', '1');
INSERT INTO `t_category` VALUES ('125', 'Ios', '120', '5', null, 'Ios', '1');
INSERT INTO `t_category` VALUES ('126', '学历', '0', '126', null, 'LEVEL', '1');
INSERT INTO `t_category` VALUES ('127', '本科', '126', '1', null, 'BENKE', '1');
INSERT INTO `t_category` VALUES ('128', '专科', '126', '2', null, 'ZUANKE', '1');
INSERT INTO `t_category` VALUES ('129', '研究生', '126', '3', null, 'YANJIUSHEN', '1');
INSERT INTO `t_category` VALUES ('130', '日语等级', '0', '130', null, 'JAPAN_LEVEL', '1');
INSERT INTO `t_category` VALUES ('131', 'N1', '130', '1', null, 'N1', '1');
INSERT INTO `t_category` VALUES ('132', 'N2', '130', '2', null, 'N2', '1');
INSERT INTO `t_category` VALUES ('133', 'N3', '130', '3', null, 'N3', '1');
INSERT INTO `t_category` VALUES ('134', 'N4', '130', '4', null, 'N4', '1');
INSERT INTO `t_category` VALUES ('135', 'N5', '130', '5', null, 'N5', '1');
INSERT INTO `t_category` VALUES ('136', '面试方式', '0', '136', null, 'INTERVIEW_ID', '1');
INSERT INTO `t_category` VALUES ('137', '电话面试', '136', '1', null, 'DAINHAU', '1');
INSERT INTO `t_category` VALUES ('138', '现场面试', '136', '2', null, 'XAINCHANG', '1');
INSERT INTO `t_category` VALUES ('139', '面试官', '0', '139', null, 'INTERVIEW_MAN', '1');
INSERT INTO `t_category` VALUES ('140', '吴莹', '139', '1', null, 'WUYIN', '1');
INSERT INTO `t_category` VALUES ('141', '俞智鹏', '139', '2', null, 'YUZHI', '1');
INSERT INTO `t_category` VALUES ('142', '赵建', '139', '3', null, 'ZHAOJIAN', '1');
INSERT INTO `t_category` VALUES ('143', '职业', '0', '143', null, 'WORK', '1');
INSERT INTO `t_category` VALUES ('144', 'JAVA软件工程师', '143', '1', null, 'JAVAGCS', '1');
INSERT INTO `t_category` VALUES ('145', '.NET软件工程师', '143', '2', null, 'NETGCS', '1');
INSERT INTO `t_category` VALUES ('146', '分配系数', '0', '146', null, 'FENPEIXISHU', '1');
INSERT INTO `t_category` VALUES ('147', '不服从上级安排，吩咐的事不愿意做或者带有情绪不能按时完成', '146', '1', null, 'FPXS1', '1');
INSERT INTO `t_category` VALUES ('148', '上班时间看电视、玩游戏、擅自离岗', '146', '2', null, 'FPXS2', '1');
INSERT INTO `t_category` VALUES ('149', '不积极参加招聘会、百般推脱', '146', '3', null, 'FPXS3', '1');
INSERT INTO `t_category` VALUES ('150', '一季度里招人最少', '146', '4', null, 'FPXS4', '1');
INSERT INTO `t_category` VALUES ('151', '一个月缺勤两天以上', '146', '5', null, 'FPXS5', '1');
INSERT INTO `t_category` VALUES ('152', '一个月迟到3次', '146', '6', null, 'FPXS6', '1');
INSERT INTO `t_category` VALUES ('153', '不互帮互助、互相团结，不把集体得失视为个人得失', '146', '7', null, 'FPXS7', '1');
INSERT INTO `t_category` VALUES ('154', '对客户不尊重，态度欠佳', '146', '8', null, 'FPXS8', '1');
INSERT INTO `t_category` VALUES ('155', '泄露公司机密给客户或其他不相关人员', '146', '9', null, 'FPXS9', '1');
INSERT INTO `t_category` VALUES ('156', '因个人疏忽没有及时安排人员面试或者没有跟客户协商好', '146', '10', null, 'FPXS10', '1');
INSERT INTO `t_category` VALUES ('157', '南京市', '66', '1', null, 'LOCALHOST_JIANGSU_NANJING', '1');
INSERT INTO `t_category` VALUES ('158', 'AA', '147', '1', null, 'LOCALHOST_JIANGSU_NANJING_AA', '1');
INSERT INTO `t_category` VALUES ('159', 'BB', '147', '2', null, 'LOCALHOST_JIANGSU_NANJING_BB', '1');
INSERT INTO `t_category` VALUES ('164', 'Php', '120', '6', null, 'Php', '1');
INSERT INTO `t_category` VALUES ('165', 'C', '120', '7', null, 'C', '1');
INSERT INTO `t_category` VALUES ('166', '测试', '120', '8', null, '测试', '1');
INSERT INTO `t_category` VALUES ('167', '常州', '85', '1', null, 'CHANGZHOU', '1');
INSERT INTO `t_category` VALUES ('168', '应聘者数据来源', '0', '1', null, 'APPLICANT_DATA_RESOURCE', '1');
INSERT INTO `t_category` VALUES ('169', '本公司', '168', '1', null, 'SELF_COMPANY', '1');
INSERT INTO `t_category` VALUES ('170', '外协', '168', '2', null, 'OTHER_COMPANY', '1');

-- ----------------------------
-- Table structure for t_fpxs
-- ----------------------------
DROP TABLE IF EXISTS `t_fpxs`;
CREATE TABLE `t_fpxs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL COMMENT '用户',
  `type` varchar(255) DEFAULT NULL COMMENT '标准类型①.不服从上级安排，吩咐的事不愿意做或者带有情绪不能按时完成者扣0.1分；\r\n②.上班时间看电视、玩游戏、擅自离岗者扣0.1分\r\n③.不积极参加招聘会、百般推脱者扣0.1分\r\n④.一季度里招人最少者扣0.1分\r\n⑤.一个月缺勤两天以上者扣0.1分\r\n⑥.一个月迟到3次者扣0.1分\r\n⑦.不互帮互助、互相团结，不把集体得失视为个人得失者扣0.1分\r\n⑧.对客户不尊重，态度欠佳者扣0.1分\r\n⑨.泄露公司机密给客户或其他不相关人员扣0.1分\r\n⑩.因个人疏忽没有及时安排人员面试或者没有跟客户协商好扣0.1分',
  `violate_time` date DEFAULT NULL COMMENT '违反时间',
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_fpxs
-- ----------------------------
INSERT INTO `t_fpxs` VALUES ('1', '26', 'FPXS2', '2016-02-18', '2016-02-18 17:14:31', '1', '2016-02-27 10:40:54', '1', '1', '的');
INSERT INTO `t_fpxs` VALUES ('2', '25', 'FPXS1', '2016-02-18', '2016-02-18 17:15:12', '1', '2016-02-27 10:41:11', '1', '1', '');

-- ----------------------------
-- Table structure for t_khzb
-- ----------------------------
DROP TABLE IF EXISTS `t_khzb`;
CREATE TABLE `t_khzb` (
  `year` int(4) NOT NULL COMMENT '年份',
  `month` int(2) NOT NULL COMMENT '月份',
  `count` int(11) DEFAULT NULL COMMENT '招聘人数',
  `creator` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `flag` varchar(1) DEFAULT '1',
  `beizhu` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_khzb
-- ----------------------------
INSERT INTO `t_khzb` VALUES ('2016', '2', '5', '1', '2016-02-16 00:00:00', '1', '2016-02-17 14:09:02', '1', null, '1');
INSERT INTO `t_khzb` VALUES ('2016', '3', '10', '1', '2016-02-08 00:00:00', '1', '2016-02-25 11:11:18', '1', '3月15日计划开培训班', '2');
INSERT INTO `t_khzb` VALUES ('2016', '4', '10', '1', '2016-02-16 00:00:00', '1', '2016-02-19 14:26:36', '1', '', '3');
INSERT INTO `t_khzb` VALUES ('2016', '5', '20', '1', '2016-02-16 00:00:00', '1', '2016-02-17 14:06:46', '1', '5月份计划开培训班', '4');
INSERT INTO `t_khzb` VALUES ('2016', '6', '12', '1', '2016-02-16 00:00:00', '1', '2016-02-19 14:26:43', '1', '', '5');
INSERT INTO `t_khzb` VALUES ('2016', '7', '5', '1', '2016-02-16 17:13:08', '1', '2016-02-17 14:07:00', '1', '', '6');
INSERT INTO `t_khzb` VALUES ('2016', '8', '10', '1', '2016-02-17 08:22:53', '1', '2016-02-19 14:26:40', '1', '', '7');
INSERT INTO `t_khzb` VALUES ('2016', '9', '10', '1', '2016-02-17 13:13:52', '1', '2016-02-19 14:26:50', '1', '', '8');
INSERT INTO `t_khzb` VALUES ('2016', '10', '5', '1', '2016-02-17 13:14:21', null, null, '1', '10月份计划开培训班', '9');
INSERT INTO `t_khzb` VALUES ('2016', '11', '3', '1', '2016-02-17 13:14:41', '1', '2016-02-19 14:26:47', '1', '', '10');
INSERT INTO `t_khzb` VALUES ('2016', '12', '2', '1', '2016-02-17 13:14:52', null, null, '1', '', '11');

-- ----------------------------
-- Table structure for t_meeting
-- ----------------------------
DROP TABLE IF EXISTS `t_meeting`;
CREATE TABLE `t_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `record` varchar(255) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_meeting
-- ----------------------------
INSERT INTO `t_meeting` VALUES ('1', '1', '1', '2016-03-08 11:57:18', null, '2016-03-08', null, '\\upload\\txrms_1461554902679.sql', '20160308会议', '1');
INSERT INTO `t_meeting` VALUES ('2', '1', '1', '2016-03-08 11:57:29', null, '2016-03-07', null, null, '2016-03-07', '1');
INSERT INTO `t_meeting` VALUES ('3', '1', '1', '2016-03-31 12:57:39', null, '2016-03-10', null, '\\upload\\反射实现多数据库切换_1459400259085.rar', '', '1');
INSERT INTO `t_meeting` VALUES ('4', '1', '1', '2016-05-18 16:58:39', null, '2016-05-18', null, '\\upload\\QQ图片20160518150831_1463561919385.jpg', '', '1');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `resourceid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `checked` varchar(255) DEFAULT NULL,
  `delflag` varchar(255) DEFAULT '1',
  `parentid` int(11) DEFAULT NULL,
  `resourcename` varchar(255) DEFAULT NULL,
  `resourceorder` varchar(255) DEFAULT NULL,
  `resourcetype` varchar(255) DEFAULT NULL,
  `open` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resourceid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', null, 'false', '1', '0', '功能菜单', null, null, null, null);
INSERT INTO `t_menu` VALUES ('2', 'first', 'false', '1', '1', '首页', null, null, null, null);
INSERT INTO `t_menu` VALUES ('3', 'user', 'false', '1', '1', '用户管理', null, null, null, null);
INSERT INTO `t_menu` VALUES ('4', 'project', 'false', '1', '1', '项目信息', null, null, null, null);
INSERT INTO `t_menu` VALUES ('5', 'requirement', 'false', '1', '1', '需求信息', null, null, null, null);
INSERT INTO `t_menu` VALUES ('6', '', 'false', '1', '0', '系统设置', null, null, null, null);
INSERT INTO `t_menu` VALUES ('7', 'tree', 'false', '1', '6', '数据树', null, null, null, null);
INSERT INTO `t_menu` VALUES ('8', null, 'false', '1', '6', '权限管理', null, null, null, null);
INSERT INTO `t_menu` VALUES ('9', null, 'false', '1', '8', '用户角色设置', null, null, null, null);
INSERT INTO `t_menu` VALUES ('10', null, 'false', '1', '8', '用户菜单设置', null, null, null, null);
INSERT INTO `t_menu` VALUES ('11', 'applicant', 'false', '1', '1', '应聘者信息', null, null, null, null);

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `num` varchar(255) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `remark` text,
  `flag` varchar(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1', '南京雨润', '南京', '10', '', '南京市建邺区泰山路8号舜天电子商务产业园 云中央办公区', '1');
INSERT INTO `t_project` VALUES ('2', '南京苏宁', '南京', '8', null, '南京玄武区', '1');
INSERT INTO `t_project` VALUES ('3', '南京华为', '南京', '若干', null, '南京软件大道', '1');
INSERT INTO `t_project` VALUES ('4', '上海宝钢', '上海', '10', null, '上海宝山区', '1');
INSERT INTO `t_project` VALUES ('5', '苏州久保田', '苏州', '5', null, '苏州', '1');
INSERT INTO `t_project` VALUES ('6', '南京联迪', '南京', '20', null, '南京联迪', '1');
INSERT INTO `t_project` VALUES ('7', '测试', '北京', '3', null, 'ceshi', '0');
INSERT INTO `t_project` VALUES ('8', '请输入', '杭州', '6', null, 'sdfaaf', '0');
INSERT INTO `t_project` VALUES ('9', '请输入', '上海', '33', null, '4444', '0');
INSERT INTO `t_project` VALUES ('10', '泰州腾翔', '泰州', '1', '', 'ios讲师、安卓讲师', '1');
INSERT INTO `t_project` VALUES ('11', '南京亚信', '南京', '1', null, '南京 五台山体育中心 或者在大行宫长发中心', '1');
INSERT INTO `t_project` VALUES ('12', '上海宝钢', '上海', '5', null, '上海宝山区', '1');
INSERT INTO `t_project` VALUES ('13', '江宁颐和美地', '南京', '5', null, '精通web和android测试技术；\r\n能够独立完成测试用例编写、测试实施等基本测试工作；\r\n具备测试分析能力；\r\n责任心强，拥有较强的沟通能力、业务理解能力；\r\n具备较强的SQL水平，熟练操作oracle数据库；\r\n熟练操作QC缺陷管理工具和svn；\r\n热爱测试工作，能接受加班或封闭；\r\n熟悉电力行业相关业务知识者优先；\r\n熟悉性能测试和自动化测试技术者优先\r\n', '1');
INSERT INTO `t_project` VALUES ('14', '测试项目', '泰州', '10', null, '测试', '1');

-- ----------------------------
-- Table structure for t_projecttarget
-- ----------------------------
DROP TABLE IF EXISTS `t_projecttarget`;
CREATE TABLE `t_projecttarget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `sale` varchar(255) DEFAULT NULL,
  `team_commission` double DEFAULT NULL COMMENT '团队提成',
  `personal_commission` double DEFAULT NULL COMMENT '个人提成',
  `starttime` varchar(20) DEFAULT NULL,
  `endtime` varchar(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `crete_time` datetime DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `flag` varchar(255) DEFAULT '1',
  `beizhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_projecttarget
-- ----------------------------
INSERT INTO `t_projecttarget` VALUES ('1', '25', 'aa', '5', '2.5', '3.5', '', '', '1', '2016-02-25 09:34:00', '1', '2016-02-25 09:49:31', '1', '');
INSERT INTO `t_projecttarget` VALUES ('2', '26', 'bb', '6', '2.5', '3.5', '', '', '1', '2016-02-25 09:42:56', '1', '2016-02-25 09:49:31', '1', '');

-- ----------------------------
-- Table structure for t_requirement
-- ----------------------------
DROP TABLE IF EXISTS `t_requirement`;
CREATE TABLE `t_requirement` (
  `staff_leixing` varchar(255) COLLATE utf8_bin NOT NULL,
  `work_year` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `work_direction` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `work_number` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `project_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(200) COLLATE utf8_bin DEFAULT '未分配',
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `flag` varchar(255) COLLATE utf8_bin DEFAULT '1',
  `stop_time` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direction` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_requirement
-- ----------------------------
INSERT INTO `t_requirement` VALUES ('开发', '1', 'Java', '1', '南京苏宁', '王月', '2016-02-20 14:01:48', '', '1', '', '', '1', null);
INSERT INTO `t_requirement` VALUES ('开发', '1', '.Net', '1', '南京雨润', 'jxf', '2015-07-29 10:05:43', '', '1', null, null, '2', null);
INSERT INTO `t_requirement` VALUES ('开发', '2', 'Java', '2', '苏州久保田', '吴滢', '2015-07-29 17:10:17', '', '1', null, null, '3', '开发');
INSERT INTO `t_requirement` VALUES ('开发', '1', 'Java', '10', '上海宝钢', '吴滢', '2015-08-20 09:00:08', '', '1', '', '', '4', null);
INSERT INTO `t_requirement` VALUES ('开发', '1', '.Net', '10', '南京联迪', '未分配', '2015-08-20 09:00:49', '', '1', '', '', '5', null);
INSERT INTO `t_requirement` VALUES ('开发', '1', 'Java', '1', '南京亚信', 'jxf', '2016-07-27 10:39:39', '', '1', '', '', '6', null);
INSERT INTO `t_requirement` VALUES ('开发', '3', 'Ios', '1', '泰州腾翔', '吴滢', '2015-08-20 09:06:07', '讲师', '1', '', '', '7', null);
INSERT INTO `t_requirement` VALUES ('开发', '3', 'Android', '1', '泰州腾翔', 'jxf', '2015-08-20 09:06:28', '讲师', '1', '', '', '8', null);
INSERT INTO `t_requirement` VALUES ('开发', '1', 'Ios', '5', '上海宝钢', 'admin', '2016-02-15 14:03:04', '', '1', '', '', '9', null);
INSERT INTO `t_requirement` VALUES ('开发', '1.5', '', '', '江宁颐和美地', '', '2015-08-26 16:56:51', '', '1', '', '', '10', null);
INSERT INTO `t_requirement` VALUES ('开发', '5', 'Java', '20', '测试项目', '吴滢', '2016-02-02 10:51:17', '测试1', '1', '', '', '11', null);
INSERT INTO `t_requirement` VALUES ('开发', '2', 'Android', '5', '测试项目', 'jxf', '2016-02-02 10:57:48', '测试2', '1', '', '', '12', null);
INSERT INTO `t_requirement` VALUES ('销售', '5', 'Ios', '6', '南京雨润', 'jxf', '2016-02-15 13:47:48', '测试', '1', '2016-02-20', '', '13', null);
INSERT INTO `t_requirement` VALUES ('销售', '', '', '2', '南京雨润', '未分配', '2016-02-17 14:55:10', '', '1', '', '', '14', null);
INSERT INTO `t_requirement` VALUES ('开发', '2', '测试', '2', '测试项目', '未分配', '2016-02-20 15:15:55', '', '1', '', '', '15', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `roledesc` varchar(255) DEFAULT NULL,
  `flag` varchar(1) DEFAULT '1',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '系统管理员', null, '1');
INSERT INTO `t_role` VALUES ('2', '主管', null, '1');
INSERT INTO `t_role` VALUES ('3', '专员', null, '1');
INSERT INTO `t_role` VALUES ('4', '测试', null, '1');

-- ----------------------------
-- Table structure for t_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `t_rolemenu`;
CREATE TABLE `t_rolemenu` (
  `roleid` int(11) DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL,
  KEY `roleid` (`roleid`),
  KEY `menuid` (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_rolemenu
-- ----------------------------
INSERT INTO `t_rolemenu` VALUES ('1', '1');
INSERT INTO `t_rolemenu` VALUES ('1', '2');
INSERT INTO `t_rolemenu` VALUES ('1', '3');
INSERT INTO `t_rolemenu` VALUES ('1', '4');
INSERT INTO `t_rolemenu` VALUES ('1', '5');
INSERT INTO `t_rolemenu` VALUES ('1', '6');
INSERT INTO `t_rolemenu` VALUES ('1', '7');
INSERT INTO `t_rolemenu` VALUES ('1', '8');
INSERT INTO `t_rolemenu` VALUES ('1', '9');
INSERT INTO `t_rolemenu` VALUES ('1', '10');
INSERT INTO `t_rolemenu` VALUES ('2', '11');
INSERT INTO `t_rolemenu` VALUES ('2', '1');

-- ----------------------------
-- Table structure for t_saletarget_person
-- ----------------------------
DROP TABLE IF EXISTS `t_saletarget_person`;
CREATE TABLE `t_saletarget_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL COMMENT '销售/招聘专员',
  `company` varchar(255) DEFAULT NULL COMMENT '客户',
  `salemoney` double DEFAULT NULL COMMENT '销售额万计',
  `start_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `flag` varchar(255) DEFAULT '1',
  `beizhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_saletarget_person
-- ----------------------------
INSERT INTO `t_saletarget_person` VALUES ('1', '27', '测试公司1', '25', null, null, null, null, null, null, '1', null);
INSERT INTO `t_saletarget_person` VALUES ('2', '27', '测试公司2', '15', null, null, null, null, null, null, '1', null);
INSERT INTO `t_saletarget_person` VALUES ('3', '25', '腾讯', '80', '', '', '1', '2016-02-25 09:24:07', '1', '2016-02-25 09:27:31', '1', '');

-- ----------------------------
-- Table structure for t_saletarget_person_ratio
-- ----------------------------
DROP TABLE IF EXISTS `t_saletarget_person_ratio`;
CREATE TABLE `t_saletarget_person_ratio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minsale` double DEFAULT NULL COMMENT '起始销售额万计',
  `maxsale` double DEFAULT NULL COMMENT '截止销售额万计',
  `ratio` double DEFAULT NULL COMMENT '销售系数 百分比',
  `creator` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `flag` varchar(255) DEFAULT '1',
  `beizhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_saletarget_person_ratio
-- ----------------------------
INSERT INTO `t_saletarget_person_ratio` VALUES ('4', '0', '30', '1.5', '1', '2016-02-19 14:15:08', null, null, '1', '销售额在0-30万元之间，则业务提成为销售额的1.5%');
INSERT INTO `t_saletarget_person_ratio` VALUES ('5', '30', '50', '2', '1', '2016-02-19 14:18:06', null, null, '1', '销售额在30万元-50万元之间，则业务提成为销售额的2%');
INSERT INTO `t_saletarget_person_ratio` VALUES ('6', '50', '90', '3', '1', '2016-02-19 14:18:27', null, null, '1', '销售额在50万元-90万元之间，则业务提成为销售额的3%');

-- ----------------------------
-- Table structure for t_saletarget_team
-- ----------------------------
DROP TABLE IF EXISTS `t_saletarget_team`;
CREATE TABLE `t_saletarget_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `applicantid` int(11) DEFAULT NULL COMMENT '员工id参照applicant表',
  `end_time` varchar(255) DEFAULT NULL COMMENT '出项目时间',
  `start_time` varchar(255) DEFAULT NULL COMMENT '进项目时间',
  `projectid` varchar(255) DEFAULT NULL COMMENT '项目现场',
  `price` double DEFAULT NULL COMMENT '单价按照元计算',
  `ratio` double DEFAULT NULL COMMENT '系数',
  `creator` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `flag` varchar(255) DEFAULT '1',
  `beizhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applicantid` (`applicantid`),
  CONSTRAINT `t_saletarget_team_ibfk_1` FOREIGN KEY (`applicantid`) REFERENCES `t_applicant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_saletarget_team
-- ----------------------------
INSERT INTO `t_saletarget_team` VALUES ('1', '2016', '1', '20', '', '', '1', '7500', '3.5', null, null, '1', '2016-02-26 10:59:57', '1', '');
INSERT INTO `t_saletarget_team` VALUES ('2', '2016', '2', '34', null, null, '3', '4500', '2', null, null, '1', '2016-02-26 10:59:27', '1', null);
INSERT INTO `t_saletarget_team` VALUES ('3', '2016', '3', '51', null, null, '6', '15000', '1.5', null, null, '1', '2016-02-26 10:59:27', '1', null);
INSERT INTO `t_saletarget_team` VALUES ('4', '2016', '4', '100', null, null, '6', '7000', '1.5', null, null, '1', '2016-02-26 10:59:27', '1', null);
INSERT INTO `t_saletarget_team` VALUES ('5', '2016', '2', '34', '', '', '1', '7500', '1.5', '', '2016-02-24 10:49:37', '1', '2016-02-26 10:59:27', '1', '');
INSERT INTO `t_saletarget_team` VALUES ('6', '2016', '5', '57', '', '2016-02-26', '4', '5600', '3.5', '1', '2016-02-26 11:24:09', null, null, '1', '哈哈');
INSERT INTO `t_saletarget_team` VALUES ('7', '2016', '3', '20', '2016-02-29', '2016-02-16', '2', '15000', '1.5', '1', '2016-02-26 11:59:18', null, null, '1', '');
INSERT INTO `t_saletarget_team` VALUES ('8', '2016', '3', '52', '', '', '4', '15000', '1.5', '1', '2016-03-02 15:39:41', null, null, '1', '');
INSERT INTO `t_saletarget_team` VALUES ('9', '2016', '5', '133', '', '', '10', '3500', '1.5', '1', '2016-03-02 19:12:38', null, null, '1', '');

-- ----------------------------
-- Table structure for t_saletarget_team_ratio
-- ----------------------------
DROP TABLE IF EXISTS `t_saletarget_team_ratio`;
CREATE TABLE `t_saletarget_team_ratio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(4) DEFAULT NULL,
  `minsale` double DEFAULT NULL COMMENT '销售起始额万计',
  `maxsale` double DEFAULT NULL COMMENT '销售终止额万计',
  `ratio` double DEFAULT NULL COMMENT '销售系数百分比',
  `creator` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updator` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `flag` varchar(255) DEFAULT '1',
  `beizhu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_saletarget_team_ratio
-- ----------------------------
INSERT INTO `t_saletarget_team_ratio` VALUES ('5', '2016', '0', '300', '1.5', '1', '2016-02-19 13:49:51', '1', '2016-02-26 12:52:09', '1', '16年销售额在0-300万元之间，则业务提成为销售额的1.5%');
INSERT INTO `t_saletarget_team_ratio` VALUES ('6', '2016', '300', '500', '2', '1', '2016-02-19 13:52:41', null, null, '1', '16年销售额在300万元-500万元之间，则业务提成为销售额的2%');
INSERT INTO `t_saletarget_team_ratio` VALUES ('7', '2016', '500', '900', '3', '1', '2016-02-19 13:52:59', null, null, '1', '16年销售额在500万元-900万元之间，则业务提成为销售额的3%');
INSERT INTO `t_saletarget_team_ratio` VALUES ('8', '2017', '0', '300', '0.75', '1', '2016-02-19 13:53:18', null, null, '1', '17年销售额在0-300万元之间，则业务提成为销售额的0.75%');
INSERT INTO `t_saletarget_team_ratio` VALUES ('9', '2017', '300', '500', '1', '1', '2016-02-19 13:53:34', null, null, '1', '17年销售额在300万元-500万元之间，则业务提成为销售额的1%');
INSERT INTO `t_saletarget_team_ratio` VALUES ('10', '2017', '500', '900', '1.5', '1', '2016-02-19 13:53:52', null, null, '1', '17年销售额在500万元-900万元之间，则业务提成为销售额的1.5%');
INSERT INTO `t_saletarget_team_ratio` VALUES ('11', '2018', '0', '300', '0.5', '1', '2016-02-19 13:55:20', null, null, '1', '18销售额在0-300万元之间，则业务提成为销售额的0.5%');
INSERT INTO `t_saletarget_team_ratio` VALUES ('12', '2018', '300', '500', '0.67', '1', '2016-02-19 13:55:37', null, null, '1', '18销售额在300万元-500万元之间，则业务提成为销售额的0.67%');
INSERT INTO `t_saletarget_team_ratio` VALUES ('13', '2018', '500', '900', '1', '1', '2016-02-19 13:55:55', null, null, '1', '18销售额在500万元-900万元之间，则业务提成为销售额的1%');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `type` varchar(12) DEFAULT NULL,
  `flag` varchar(10) NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '吴滢', 'e10adc3949ba59abbe56e057f20f883e', '1', '18082077792', 'tzhr@dingruiit.com', 'STATUS_TYPE_ZAIZHI', '1', 'ZHUGUAN', '1', '2016-05-19 16:06:00');
INSERT INTO `t_user` VALUES ('2', '赵建', 'e10adc3949ba59abbe56e057f20f883e', '1', '18082070717', 'aaaa@bbb.ccc', 'STATUS_TYPE_ZAIZHI', null, 'ZHUANYUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('3', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '111', 'aaa@bbb.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUGUAN', '1', '2017-06-14 15:35:16');
INSERT INTO `t_user` VALUES ('25', '陈蓉', 'e10adc3949ba59abbe56e057f20f883e', null, '1', '3149553263@qq.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUANYUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('26', '唐文玉', 'e10adc3949ba59abbe56e057f20f883e', null, '2', '780533872@qq.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUANYUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('27', '王月', 'e10adc3949ba59abbe56e057f20f883e', null, '3', '3309226384@qq.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUANYUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('28', '刘俊飞', 'e10adc3949ba59abbe56e057f20f883e', null, '18014006006', 'liujf@xiangruikj.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUGUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('29', '魏传海', 'e10adc3949ba59abbe56e057f20f883e', null, '13511600036', 'weich@xiangruikj.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUGUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('30', '朱怀凤', 'e10adc3949ba59abbe56e057f20f883e', null, '15262480302', 'hr@dingruiit.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUGUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('31', '陈航', 'e10adc3949ba59abbe56e057f20f883e', null, '2', '20@qq.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUANYUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('32', '杨芳芳', 'e10adc3949ba59abbe56e057f20f883e', null, '3', '2083@qq.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUGUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('33', '孙程倩', 'e10adc3949ba59abbe56e057f20f883e', null, '2', '807@qq.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUGUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('34', '朱玉琳', 'e10adc3949ba59abbe56e057f20f883e', null, '23', '3131774407@qq.com', 'STATUS_TYPE_lIZHI', null, 'ZHUANYUAN', '1', '2016-11-24 15:44:56');
INSERT INTO `t_user` VALUES ('35', 'jxf', 'e10adc3949ba59abbe56e057f20f883e', null, 'dd', 'jfx@163.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUANYUAN', '1', '2016-11-24 15:42:04');
INSERT INTO `t_user` VALUES ('36', 'aa', 'e10adc3949ba59abbe56e057f20f883e', null, 'aaa', 'aa@163.com', 'STATUS_TYPE_ZAIZHI', null, 'ZHUGUAN', '1', '2016-11-24 15:42:04');

-- ----------------------------
-- Table structure for t_userrole
-- ----------------------------
DROP TABLE IF EXISTS `t_userrole`;
CREATE TABLE `t_userrole` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_userrole
-- ----------------------------
INSERT INTO `t_userrole` VALUES ('1', '1');
INSERT INTO `t_userrole` VALUES ('2', '3');
INSERT INTO `t_userrole` VALUES ('1', '2');
