package com.gbin.service;

import com.gbin.domain.User;

public interface UserService {

	/**
	 * 通过id查找用户
	 * @param userId
	 * @return
	 */
	public User getUserById(String userId);
	
	/**
	 * 通过注册名查找用户
	 * @param loginName
	 * @return
	 */
	public User findUserByLoginName(String loginName);
	
	/**
	 * 通过email查找用户
	 * @param loginName
	 * @return
	 */
	public User findUserByEmail(String loginName);
	
	/**
	 * 新增用户
	 * @param user
	 */
	public void insert(User user);
	
}
