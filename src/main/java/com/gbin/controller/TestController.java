package com.gbin.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/zhibo")
	public String zhibo(){
		return "zhibo";
	}
}
