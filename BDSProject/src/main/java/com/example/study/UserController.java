package com.example.study;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.study.service.ISBoardService;
import com.example.study.service.IUserService;

@Controller
public class UserController
{
	@Autowired
	private ISBoardService sbs;
	
	@Autowired
	IUserService usr;
	
	@RequestMapping("/guest/sList")
	public String sList(HttpServletRequest request, Model model) {
		
		model.addAttribute("contents", sbs.sList());		
		return "guest/sList";
	}
	
	@RequestMapping("/admin/sWrite")
	public String sWrite() {
		return "admin/sWrite";
	}
		
	@RequestMapping("/guest/sWriteOk")
	public String sWritedo(HttpServletRequest request, Model model) {
		String usrid = request.getParameter("usrid");
		String stitle = request.getParameter("sTitle");
		String scontent = request.getParameter("sContent");
		
		System.out.println(usrid);
		System.out.println(stitle);
		System.out.println(scontent);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("usrid", usrid);
		map.put("stitle", stitle);
		map.put("scontent", scontent);
		int sResult = sbs.sWrite(map);
		System.out.println("Write : " + sResult);

		return "redirect:../guest/sList";
	}
	
	@RequestMapping("/guest/myinfo")
	public String myinfo(HttpServletRequest request, Model model) {
		String usrid = (String)request.getSession().getAttribute("usrid");
		model.addAttribute("rpro1", usr.rpro1(usrid));
		model.addAttribute("rpro2", usr.rpro2(usrid));
		model.addAttribute("rpro3", usr.rpro3(usrid));
		model.addAttribute("rpro4", usr.rpro4(usrid));
		return "guest/myinfo";
	}
	
	@RequestMapping("/guest/myinfoModify")
	public String myinfoModify(HttpServletRequest request, Model model) {
		String usrid = request.getParameter("usrid");
		System.out.println(usrid + "modify");
		model.addAttribute("dto", usr.userinfo(usrid));
		return "guest/myinfoModify";
	}
	
	@RequestMapping("/guest/myinfoModifyOk")
	public String myinfoModifydo(HttpServletRequest request, Model model) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String usrid = request.getParameter("usrid");
		String usrpw = passwordEncoder.encode(request.getParameter("usrpw"));
		String usrpnum = request.getParameter("usrpnum");
		String usraddr = request.getParameter("usraddr");
		String usremail = request.getParameter("usremail");
		Map<String, String> map = new HashMap<String, String>();
		map.put("usrid", usrid);
		map.put("usrpw", usrpw);
		map.put("usrpnum", usrpnum);
		map.put("usraddr", usraddr);
		map.put("usremail", usremail);
		int mResult = usr.myinfoModify(map);
		System.out.println("Modify" + mResult);
		
		return "guest/myinfo";
	}
	
	@RequestMapping("/admin/sModify")
	public String sModify(HttpServletRequest request, Model model) {
				
		
		String snum = request.getParameter("snum");
		System.out.println(snum + " snum");		
		
		model.addAttribute("dto", sbs.sView(snum));
		return "admin/sModify";
	}
	
	@RequestMapping("/guest/sContent")
	public String sContent(HttpServletRequest request, Model model) {
		System.out.println("content start");
		String snum = request.getParameter("snum");
		System.out.println(snum + " snum");
		int result = sbs.sHit(snum);
		System.out.println(result + " hit");
		model.addAttribute("dto", sbs.sView(snum));
		
		return "guest/sContent";
	}
	
	@RequestMapping("/admin/sdelete")
	public String sdelete(HttpServletRequest request, Model model) {
		String snum = request.getParameter("snum");		
		int dResult = sbs.sDelete(snum);
		System.out.println("Delete : " + dResult);
		
		return "redirect:../guest/sList";
	}
		
	@RequestMapping("/admin/sModifyOk")
	public String sModifydo(HttpServletRequest request, Model model) {
		String snum = request.getParameter("snum");
		String stitle = request.getParameter("stitle");
		String scontent = request.getParameter("scontent");
		Map<String, String> map = new HashMap<String, String>();
		map.put("snum", snum);
		map.put("stitle", stitle);
		map.put("scontent", scontent);
		System.out.println(map.get("snum"));
		System.out.println(map.get("stitle"));
		System.out.println(map.get("scontent"));
		int nResult = sbs.sModify(map);
		return "redirect:../guest/sList";
	}
	
//	@RequestMapping("/userwithdrawal")
//	public ModelAndView userout(HttpServletRequest request)
//	{
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("userwithdrawal");
//		mv.addObject("ncaptcha", dao.NaverCaptcha());
//		return mv;
//	}
	
//	@RequestMapping("/delete")
//	public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
//	{
//		response.setContentType("text/html; charset=UTF-8");
//		HttpSession session = request.getSession();
//		PrintWriter out = response.getWriter();
//		String capvalue = request.getParameter("capvalue");
//		String capkey = request.getParameter("key");
//		String radiovalue1="";
//		String radiovalue2="";
//		
//		if(request.getParameter("inlineRadioOptions2") != null)
//		{
//			radiovalue2=request.getParameter("inlineRadioOptions2");
//		}
//		int result = dao.captchaResult(capvalue, capkey);
//		
//		if(!radiovalue1.equals("동의함") || !radiovalue2.equals("동의함"))
//		{
//			session.setAttribute("messageContent", "선택사항에 모두 동의하지 않습니다.");
//			response.sendRedirect("userwidthdrawal");
//			
//			out.flush();
//			out.close();
//		}
//		else if(result != 1)
//		{
//			session.setAttribute("messageContent", "입력 사항이 맞지 않습니다. 다시 입력해주십시오.");
//			out.flush();
//			out.close();
//		}
//		else
//		{
//			dao.delete((String)session.getAttribute("id"));
//			session.invalidate();
//			out.println("<script>alert('회원 탈퇴를 완료하였습니다.')</script>");
//			
//			out.println("<script>location.href='/'</script>");
//			
//			out.flush();
//			out.close();
//		}
//		
//	}
}
