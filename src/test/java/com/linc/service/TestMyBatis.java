package com.linc.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.gbin.domain.User;
import com.gbin.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)             //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestMyBatis {

	private static Logger logger = Logger.getLogger(TestMyBatis.class);

	@Resource
	private UserService userService = null;

	@Test
	public void test1() {
		User testUser = new User();
		testUser.setId("a");
		testUser.setLoginName("zgb");
		
		User user = userService.getUserById("a");
		System.out.println(user.getLoginName());
		logger.info("值：" + user.getLoginName());
		logger.info(JSON.toJSONString(user));
	}
}
