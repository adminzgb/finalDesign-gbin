package com.gbin.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gbin.base.enums.ReturnCode;
import com.gbin.base.model.JsonMessage;
import com.gbin.domain.User;
import com.gbin.service.UserService;

/**
 * spring mvc控制器
 * 处理用户登录 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(User user){
		return "login";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView mainPage(User user){
		return new ModelAndView("main","user",user);
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String registerPage(User user){
		return "register";
	}
	
	/**
	 * 查询用户名和密码是否匹配
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public JsonMessage login(HttpServletRequest request, HttpServletResponse response, User user){
		JsonMessage jsonMessage = new JsonMessage();
		if(user == null){
			 jsonMessage.setCode(ReturnCode.FAIL);
			 jsonMessage.setObject("项目为空");
			 return jsonMessage;
		}
		String loginName = user.getLoginName();
		String pwd = user.getPassword();
		User correctUser = userService.findUserByLoginName(loginName);
		if(correctUser != null && correctUser.getPassword().equals(pwd)){
			jsonMessage.setCode(ReturnCode.SUCCESS);
			jsonMessage.setObject(correctUser);
		}else{
			jsonMessage.setCode(ReturnCode.FAIL);
			jsonMessage.setObject("该用户不存在或密码错误");
		}
		return jsonMessage;
	}
	
	@RequestMapping("checkLoginName")//注解
	@ResponseBody
	public JsonMessage checkLoginName(User user){
		JsonMessage jsonMessage = new JsonMessage();
		if(user == null){
			jsonMessage.setCode(ReturnCode.FAIL);
		}
		User u = userService.findUserByLoginName(user.getLoginName());
		if(u == null){
			jsonMessage.setCode(ReturnCode.FAIL);
		}else{
			jsonMessage.setCode(ReturnCode.SUCCESS);
		}
		return jsonMessage;
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	@ResponseBody
	public JsonMessage register(User user){
		JsonMessage jsonMessage = new JsonMessage();
		if(user == null || StringUtils.isEmpty(user.getLoginName()) || StringUtils.isEmpty(user.getPassword())){
			jsonMessage.setCode(ReturnCode.FAIL);
			jsonMessage.setObject("项目为空");
			return jsonMessage;
		}
		if(userService.findUserByLoginName(user.getLoginName()) != null){
			jsonMessage.setCode(ReturnCode.FAIL);
			jsonMessage.setObject("用户名已存在");
			return jsonMessage;
		}
		userService.insert(user);
		jsonMessage.setObject(user);
		return jsonMessage;
	}
	
}
