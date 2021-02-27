package com.example.study.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
			                            HttpServletResponse response,
			                            AuthenticationException exception)
	throws IOException, ServletException
	{
		String loginid = request.getParameter("usrid");
		String errormsg = "";
		
		if (exception instanceof BadCredentialsException) {
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
        } else if (exception instanceof InternalAuthenticationServiceException) {
        	errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
        } else if (exception instanceof CredentialsExpiredException) {
            errormsg = "비밀번호 유효기간이 만료 되었습니다. 관리자에게 문의하세요.";
        }
		
		request.setAttribute("usrname",  loginid);
		request.setAttribute("error_message",  errormsg);
		request.getRequestDispatcher("/login?error=true").forward(request, response);
	}
	
}
