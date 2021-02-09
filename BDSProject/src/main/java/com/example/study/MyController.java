package com.example.study;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.study.dto.RPageDto;
import com.example.study.service.IBDSProjectService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MyController
{	
	@Autowired
	IBDSProjectService rbbs;
		
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
	
	@RequestMapping("/rBoard")
	public String rList(HttpServletRequest request, Model model, RPageDto pdto)
	{
		int nPage = 1;
		try
		{
			String sPage = request.getParameter("page");
			nPage = Integer.parseInt(sPage);
		}
		catch(Exception e)
		{}		
		
		pdto = rbbs.articlePage(nPage);
		
		System.out.println(pdto);
		model.addAttribute("page", pdto);
		nPage = pdto.getCurPage();
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("cpage", nPage);
		
		System.out.println(nPage);
		
		model.addAttribute("contents", rbbs.list(nPage));
		return "rList";
	}
	
	@RequestMapping("/rContent")
	public String rContent(HttpServletRequest request, Model model)
	{
		String rnum = request.getParameter("rnum");
		int nResult = rbbs.upHit(rnum);
		model.addAttribute("dto", rbbs.view(rnum));
		return "rContent";
	}
	
	@RequestMapping("/check")
	public void check(HttpServletRequest request, HttpServletResponse response) throws Exception
	{	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		int rprocessing = Integer.parseInt(request.getParameter("process"));
		String rnum = request.getParameter("rnum");
		
		int nResult = rbbs.check(rprocessing, rnum);
		if(nResult == 1)
		{
			writer.println("[{\"result\":\"ok\",\"desc\":\"전송성공\"}]");
		}		
		writer.close();
		
	}
	
	@RequestMapping("/rWrite")
	public String rWrite()
	{
		return "rWrite";
	}
	
	@RequestMapping("/rModify")
	public String modify(HttpServletRequest request, Model model)
	{	
		String rnum = request.getParameter("rnum");
		int nResult = rbbs.upHit(rnum);
		model.addAttribute("dto", rbbs.view(rnum));
		return "rModify";
	}
	
	@RequestMapping("/replyView")
	public String replyView(HttpServletRequest request, Model model)
	{	
		String rnum = request.getParameter("rnum");
		int nResult = rbbs.upHit(rnum);
		model.addAttribute("dto", rbbs.view(rnum));
		return "replyView";
	}
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request, Model model)
	{			
		int nResult = rbbs.reply(request.getParameter("rtitle"),
								 request.getParameter("rcontent"),
								 Integer.parseInt(request.getParameter("rgroup")),
								 Integer.parseInt(request.getParameter("rstep")) + 1,
								 Integer.parseInt(request.getParameter("rindent")) + 1,
								 request.getParameter("rpwd"),
								 request.getParameter("choice"));
		System.out.println("여기1");
		return "redirect:rBoard";
	}
	
	@RequestMapping("/rModifyOk")
	public String modifyOk(HttpServletRequest request, Model model)
	{			
		
		String rtitle = request.getParameter("rtitle");
		String rcontent = request.getParameter("rcontent");		
		String rpwd = request.getParameter("rpwd");
		String choice = request.getParameter("choice");
		String rnum = request.getParameter("rnum");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("rtitle", rtitle);
		map.put("rcontent", rcontent);		
		map.put("rpwd", rpwd);
		map.put("rsecret", choice);
		map.put("rnum", rnum);
		
		int nResult = rbbs.modify(map);		
		return "redirect:rBoard";
	}
	
	@RequestMapping("/rWriteOk")
	public String write(HttpServletRequest request, Model model)
	{		
		int size = 1024 * 1024 * 10;
		String file = "";
		String oriFile = "";
		JSONObject obj = new JSONObject();
		
		try
		{
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String str = (String)files.nextElement();
			
			file = multi.getFilesystemName(str);
			oriFile = multi.getOriginalFileName(str);
			
			obj.put("success", new Integer(1));
			obj.put("desc", "업로드 성공");
			
			String rtitle = multi.getParameter("rtitle");
			String rcontent = multi.getParameter("rcontent");
			String rname = multi.getParameter("rname");
			String rpwd = multi.getParameter("rpwd");
			String choice = multi.getParameter("choice");
			System.out.println(rtitle);
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("rtitle", rtitle);
			map.put("rcontent", rcontent);
			map.put("rname", rname);
			map.put("rpwd", rpwd);
			map.put("rsecret", choice);
			map.put("rfroot", oriFile);
			System.out.println(map.get("rfroot"));
			
			int nResult = rbbs.write(map);
			System.out.println(nResult);
		
		}
		catch(Exception e)
		{
			
		}		
			
		return "redirect:rBoard";
	}
	
	@RequestMapping("/download")
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String fileName = request.getParameter("filename");
		String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
		File file = new File(path + "/" + fileName);
		System.out.println(file);
		System.out.println("파일명: " + fileName);
		
		String downName = null;
		if(request.getHeader("user-agent").indexOf("MSIE") == -1)
		{
			downName = new String(fileName.getBytes("UTF-8"), "8859_1");					
		}
		else
		{
			downName = new String(fileName.getBytes("UTF-8"), "8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=\"" + downName + "\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b [] = new byte[1024];
		int data = 0;
		while((data=(fileInputStream.read(b, 0, b.length))) != -1)
		{
			servletOutputStream.write(b, 0, data);
		}
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
	}
	
	@RequestMapping("/delete")	
	public String delete(HttpServletRequest request, Model model)
	{
		System.out.println(request.getParameter("rnum"));
		int nResult = rbbs.delete(request.getParameter("rnum"));
		return "redirect:rBoard";
	}
}
