package com.asm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.asm.service.BrandService;
import com.asm.service.CategoryService;

@Component
public class GlobalInterceptor implements HandlerInterceptor{
	@Autowired CategoryService cService;
	@Autowired BrandService bService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		request.setAttribute("cates", cService.findAll());
		request.setAttribute("brands", bService.findAll());
	}
	
	
}
