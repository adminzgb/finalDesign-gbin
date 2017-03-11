package com.gbin.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.gbin.base.util.X;
import com.gbin.dao.UserMapper;
import com.gbin.domain.User;
import com.gbin.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userMapper;
	
	public User getUserById(String userId) {
		return this.userMapper.selectByPrimaryKey(userId);
	}

	public User findUserByLoginName(String loginName) {
		return this.userMapper.findUserByLoginName(loginName);
	}

	public User findUserByEmail(String loginName) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insert(User user) {
		Date date = new Date();
		user.setId(X.number.generateShortUUID());
		user.setCreateTime(date);
		user.setUpdateTime(date);
		userMapper.insert(user);
	}

}
