package com.asm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;

import com.asm.interceptor.AuthInterceptor;
import com.asm.interceptor.GlobalInterceptor;

@Configuration
public class InterceptorConfig {
	@Autowired GlobalInterceptor globalinterceptor;
	@Autowired 
	AuthInterceptor auth;


	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(globalinterceptor)
			.addPathPatterns("/**")
			.excludePathPatterns("/admin/**","/assets/**");
		registry.addInterceptor(auth)
			.addPathPatterns("/admin/**", "/order/**");
	}
	
}
