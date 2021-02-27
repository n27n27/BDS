package com.example.study.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.example.study.dao.IUserDao;
import com.example.study.dto.UserDto;

@Configuration
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	UserDto dto = new UserDto();

	@Autowired
	IUserDao usr;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			                            HttpServletResponse response,
			                            Authentication authentication)
	throws IOException, ServletException
	{
		HttpSession session = request.getSession();	
		String url = (String)session.getAttribute("prevPage");
		String hid = request.getParameter("usrid");
		dto = usr.userinfo(hid);
		
		session.setAttribute("usrauth", dto.getUsrauth());
		session.setAttribute("usrid", dto.getUsrid());	
		
		System.out.println(url + "handler");
		response.sendRedirect(url);
	}
	
}
