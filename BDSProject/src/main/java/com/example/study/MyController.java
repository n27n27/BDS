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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.study.dto.RPageDto;
import com.example.study.dto.UserDto;
import com.example.study.service.IBDSProjectService;
import com.example.study.service.IManagerService;
import com.example.study.service.IUserService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MyController
{	
	@Autowired
	IBDSProjectService rbbs;
	@Autowired
	IManagerService mag;
	@Autowired
	IUserService usr;
	
	@RequestMapping("/")
	public String history()
	{
		return "frontPage";
	}			
	
	@RequestMapping("/guest/first")
	public String first()
	{
		return "guest/firstPage";
	}
		
	@RequestMapping("/guest/register")
	public String register() {
		return "guest/register";
	}
	
	@RequestMapping("/guest/register.do")
	public String registerdo(HttpServletRequest request, Model model) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String usrid = request.getParameter("uid");
		String usrpw = passwordEncoder.encode(request.getParameter("upw"));
		String usrname = request.getParameter("uname");
		String usrpnum = request.getParameter("upnum");
		String usraddr = request.getParameter("uaddr");
		String usremail = request.getParameter("uemail");
		
				
		Map<String, String> map = new HashMap<String, String>();
		map.put("usrid", usrid);
		map.put("usrpw", usrpw);
		map.put("usrname", usrname);
		map.put("usrpnum", usrpnum);
		map.put("usraddr", usraddr);
		map.put("usremail", usremail);
		int nResult = usr.registerDAO(map);
		System.out.println("Write : " + nResult);

		return "security/clogin";
	}
	
	@RequestMapping("/admin/manager")	
	public String manager(HttpServletRequest request, Model model)
	{	
		HttpSession session = null;	
		session = request.getSession();
		
		session.setAttribute("rCount", mag.rCount());		
		return "admin/manager";
	}
	
	@RequestMapping("/admin/nList")
	public String nList(HttpServletRequest request, Model model, RPageDto pdto)
	{
		int nPage = 1;
		try
		{
			String sPage = request.getParameter("page");
			nPage = Integer.parseInt(sPage);
		}
		catch(Exception e)
		{}		
		
		pdto = mag.articlePage(nPage);
				
		model.addAttribute("page", pdto);
		nPage = pdto.getCurPage();
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("cpage", nPage);
		session.setAttribute("rCount", mag.rCount());
		
		model.addAttribute("contents", mag.rList(nPage));		
		
		return "admin/rList1";
	}
	
	@RequestMapping("/admin/nWriteView")
	public String writeView()
	{
		return "admin/nWriteView";
	}
	
	
	
	@RequestMapping("/guest/main")
	public String main()
	{
		return "guest/main";
	}
	
	@RequestMapping("/security/clogin")
	public String login(HttpServletRequest request, UserDto dto) {	
		try {
			if(request.getHeader("Referer") != null) {
				String referrer = request.getHeader("Referer");
				System.out.println(referrer);
//				referrer = referrer.substring(21);
				referrer = referrer.substring(22);// 서버배포용
				System.out.println(referrer + "ref");
				request.getSession().setAttribute("prevPage", referrer);
				return "security/clogin";
			} else {
				request.getSession().setAttribute("prevPage", "../guest/main");
				System.out.println("no referrer cont");
				return "security/clogin";
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "error=true";
		}
	}
	
	@RequestMapping("/admin/userList")
	public String userList(HttpServletRequest request, Model model, RPageDto pdto)
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
		
		model.addAttribute("users", mag.userList(nPage));		
				
		return "admin/userList";
	}
	
	@RequestMapping("/admin/nList1")
	public String nList1(HttpServletRequest request, Model model, RPageDto pdto)
	{
		int nPage = 1;
		try
		{
			String sPage = request.getParameter("page");
			nPage = Integer.parseInt(sPage);
		}
		catch(Exception e)
		{}		
		
		pdto = mag.articlePage1(nPage);
				
		model.addAttribute("page", pdto);
		nPage = pdto.getCurPage();
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("cpage", nPage);
				
		model.addAttribute("contents", mag.nList1(nPage));		
		
		return "admin/nList1";
	}
	
	@RequestMapping("/guest/rBoard")
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
				
		model.addAttribute("dto", mag.requestStyle());
		model.addAttribute("ncontents", rbbs.nList());
		model.addAttribute("contents", rbbs.list(nPage));		
		
		return "guest/rList";
	}
	
	@RequestMapping("/guest/rContent")
	public String rContent(HttpServletRequest request, Model model)
	{
		String rnum = request.getParameter("rnum");		
		int nResult = rbbs.upHit(rnum);
		
		model.addAttribute("dto", rbbs.view(rnum));
		
		return "guest/rContent";
	}
	
	@RequestMapping("/admin/rContent1")
	public String rContent1(HttpServletRequest request, Model model)
	{
		String rnum = request.getParameter("rnum");		
		model.addAttribute("dto", mag.view(rnum));
		return "admin/rContent1";
	}
	
	
	@RequestMapping("/guest/nContent")
	public String nContent(HttpServletRequest request, Model model)
	{
		String nnum = request.getParameter("nnum");
		int nResult = rbbs.nUpHit(nnum);
		model.addAttribute("dto", rbbs.nView(nnum));
		return "guest/nContent";
	}
	
	@RequestMapping("/admin/nContent")
	public String nContent1(HttpServletRequest request, Model model)
	{
		String nnum = request.getParameter("nnum");		
		model.addAttribute("dto", rbbs.nView(nnum));
		return "admin/nContent";
	}
	
	@RequestMapping("/guest/check")
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
	
	@RequestMapping("/guest/rWrite")
	public String rWrite()
	{
		return "guest/rWrite";
	}
	
	@RequestMapping("/guest/rModify")
	public String modify(HttpServletRequest request, Model model)
	{	
		String rnum = request.getParameter("rnum");		
		model.addAttribute("dto", rbbs.view(rnum));
		return "guest/rModify";
	}
	
	@RequestMapping("/admin/replyView")
	public String replyView(HttpServletRequest request, Model model)
	{	
		String rnum = request.getParameter("rnum");		
		model.addAttribute("dto", rbbs.view(rnum));
		return "admin/replyView";
	}
		
	
	@RequestMapping("/admin/reply")
	public String reply(HttpServletRequest request, Model model)
	{			
		int nResult = rbbs.reply(request.getParameter("rtitle"),
								 request.getParameter("rcontent"),
								 Integer.parseInt(request.getParameter("rgroup")),
								 Integer.parseInt(request.getParameter("rstep")) + 1,
								 Integer.parseInt(request.getParameter("rindent")) + 1,								 
								 request.getParameter("rname"));
		System.out.println("여기1");
		return "redirect:nList";
	}
	
	@RequestMapping("/guest/rModifyOk")
	public String modifyOk(HttpServletRequest request, Model model)
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
			
			if(oriFile == null)
			{
				oriFile = multi.getParameter("filename");
			}
			
			obj.put("success", new Integer(1));
			obj.put("desc", "업로드 성공");
			
			String rtitle = multi.getParameter("rtitle");
			String rcontent = multi.getParameter("rcontent");			
			String rpwd = multi.getParameter("rpwd");
			String choice = multi.getParameter("choice");
			String rnum = multi.getParameter("rnum");
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("rtitle", rtitle);
			map.put("rcontent", rcontent);			
			map.put("rpwd", rpwd);
			map.put("rsecret", choice);
			map.put("rfroot", oriFile);
			map.put("rnum", rnum);			
			
			int nResult = rbbs.modify(map);
			System.out.println(nResult);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
		
		return "redirect:rBoard";
	}
	
	@RequestMapping("/admin/nWrite")
	public String nWrite(HttpServletRequest request, Model model)
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
			System.out.println(str);
			file = multi.getFilesystemName(str);
			oriFile = multi.getOriginalFileName(str);
			System.out.println(oriFile);
			obj.put("success", new Integer(1));
			obj.put("desc", "업로드 성공");
			
			String ntitle = multi.getParameter("ntitle");
			String ncontent = multi.getParameter("ncontent");
			String nname = multi.getParameter("nname");
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("ntitle", ntitle);
			map.put("ncontent", ncontent);
			map.put("nname", nname);			
			map.put("nfroot", oriFile);			
			System.out.println(map.get("nfroot"));
			int nResult = mag.write(map);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
			
		return "redirect:manager";
	}
	
	@RequestMapping("guest/rWriteOk")
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
			
			int nResult = rbbs.write(map);
			System.out.println(nResult);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
			
		return "redirect:rBoard";
	}
	
	@RequestMapping("/guest/download")
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
	
	@RequestMapping("/guest/delete")	
	public String delete(HttpServletRequest request, Model model)
	{
		System.out.println(request.getParameter("rnum"));
		int nResult = rbbs.delete(request.getParameter("rnum"));
		return "redirect:rBoard";
	}
}
