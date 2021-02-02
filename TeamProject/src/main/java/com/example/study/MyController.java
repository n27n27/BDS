package com.example.study;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.study.dto.RBoardDto;
import com.example.study.service.ITeamProjectService;

@Controller
public class MyController
{
	@Autowired
	ITeamProjectService rbbs;	
	
	@RequestMapping("/")
	public @ResponseBody String root() throws Exception
	{
		return "Hello";
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
	
	@RequestMapping(value = "/rBoard", method = RequestMethod.GET)
	public String rList(Model model)
	{
		model.addAttribute("contents", rbbs.list());
		int totalCount = rbbs.articleCount();
		return "rList";
	}
	
	@RequestMapping("/rContent")
	public String rContent(HttpServletRequest request, Model model)
	{
		String rnum = request.getParameter("rnum");
		model.addAttribute("dto", rbbs.view(rnum));
		return "rContent";
	}
	
	@RequestMapping("/rWrite")
	public String rWrite()
	{
		return "rWrite";
	}
	
	@RequestMapping("/rWriteOk")
	public String formtest(@ModelAttribute("dto") @Valid RBoardDto rDto, BindingResult result, HttpServletRequest request, Model model)
	{		
		System.out.println(rDto);
				
		if(result.hasErrors()) 
		{			
			if(result.getFieldError("rname") != null)
			{
				System.out.println("1: " + result.getFieldError("rname").getDefaultMessage());
			}
			if(result.getFieldError("rcontent") != null)
			{
				System.out.println("2: " + result.getFieldError("rcontent").getDefaultMessage());
			}
			if(result.getFieldError("rtitle") != null)
			{
				System.out.println("3: " + result.getFieldError("rtitle").getDefaultMessage());
			}				
		}
		
		String rtitle = request.getParameter("rtitle");
		String rcontent = request.getParameter("rcontent");
		String rname = request.getParameter("rname");
		String rpwd = request.getParameter("rpwd");
		String choice = request.getParameter("choice");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("rtitle", rtitle);
		map.put("rcontent", rcontent);
		map.put("rname", rname);
		map.put("rpwd", rpwd);
		map.put("rsecret", choice);
		
		int nResult = rbbs.write(map);
		
		System.out.println("write: " + nResult);
		return "redirect:rBoard";
	}
	
	@RequestMapping("/delete")	
	public String delete(HttpServletRequest request, Model model)
	{
		
		int nResult = rbbs.delete(request.getParameter("rnum"));
		return "redirect:rBoard";
	}
}
