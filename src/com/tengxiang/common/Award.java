package com.tengxiang.common;

import java.util.Random;

public class Award {

	//抽奖并返回角度和奖项
	public static Object[] award(Object[][] prizeArr){
		//概率数组
		Integer obj[] = new Integer[prizeArr.length];
		for(int i=0;i<prizeArr.length;i++){
			obj[i] = (Integer) prizeArr[i][4];
		}
		Integer prizeId = getRand(obj); //根据概率获取奖项id
		//旋转角度
		int angle = new Random().nextInt((Integer)prizeArr[prizeId][2]-(Integer)prizeArr[prizeId][1])+(Integer)prizeArr[prizeId][1];
		String msg = Util.toString(prizeArr[prizeId][3]);//提示信息
		return new Object[]{angle,prizeArr[prizeId][0],msg};
	}
	
	// 根据概率获取奖项
	public static Integer getRand(Integer obj[]) {
		Integer result = null;
		try {
			int sum = 0;// 概率数组的总概率精度
			for (int i = 0; i < obj.length; i++) {
				sum += obj[i];
			}
			for (int i = 0; i < obj.length; i++) {// 概率数组循环
				int randomNum = new Random().nextInt(sum);// 随机生成1到sum的整数
				if (randomNum < obj[i]) {// 中奖
					result = i;
					break;
				} else {
					sum -= obj[i];
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
