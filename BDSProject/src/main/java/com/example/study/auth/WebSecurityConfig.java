package com.example.study.auth;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	public AuthenticationSuccessHandler authenticationSuccessHandler;
	
	@Autowired
	public AuthenticationFailureHandler authenticationFailureHandler;

	
    @Override
    protected void configure(HttpSecurity http) {
    	    	
    	try {    		
	    	http.authorizeRequests()
	    			.antMatchers("/css/**", "/img/**", "/upload/**").permitAll()
	    			.antMatchers("/admin/**").hasRole("ADMIN")	
	    			.antMatchers("/member/**").hasAnyRole("USER", "ADMIN")
	    			.antMatchers("/", "/guest/**", "/security/**").permitAll()	        		
	        		.requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll();
	    	
	        http.formLogin()
	        		.loginPage("/security/clogin") 			// default : /login
	                .loginProcessingUrl("/security/j_spring_security_check")
//	                .defaultSuccessUrl("/member/main")
	                .successHandler(authenticationSuccessHandler)
	                .failureHandler(authenticationFailureHandler)
	                .usernameParameter("usrid")	// default : j_username
	                .passwordParameter("usrpw") 	// default : j_password
	                .permitAll();
	       
	        http.logout()
	                .logoutUrl("/logout") // default
	                .logoutSuccessUrl("/security/clogin")
	                .invalidateHttpSession(true)
	                .deleteCookies("JSESSIONID")
	                .permitAll();
	       
	        http.csrf().disable();
	        System.out.println("[security on service]");
    	} catch (Exception e) {
    		e.printStackTrace();    		
    	}
    }
 
    @Autowired
    private DataSource dataSource;
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

    	auth.jdbcAuthentication()
    		.dataSource(dataSource)
    		.usersByUsernameQuery("select usrid as userName, usrpw as password, enabled"
    							 + " from usrdb where usrid = ?")
    		.authoritiesByUsernameQuery("select usrid as userName, usrauth as authority "
    							 + " from usrdb where usrid = ?")
    		.passwordEncoder(new BCryptPasswordEncoder());
    }
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
      return new BCryptPasswordEncoder();
    }
    
   
}
