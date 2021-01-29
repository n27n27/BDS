package com.example.study;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController
{
	@RequestMapping("/")
	public @ResponseBody String root() throws Exception
	{
		return "Lombok 사용하기";
	}
	
	@RequestMapping("/test1")
	public String test1(Member member, Model model)
	{
		System.out.println(member);
		return "test1";
	}
	
	@RequestMapping("/first")
	public String firstPage()
	{
		return "firstPage";
	}
	
	@RequestMapping("/main")
	public String main()
	{
		return "main";
	}
	
	@RequestMapping("/rBoard")
	public String rList()
	{
		return "rList";
	}
	
	@RequestMapping("/rContent")
	public String rContent()
	{
		return "rContent";
	}
	
	@RequestMapping("/rWrite")
	public String rWrite()
	{
		return "rWrite";
	}
	
}
