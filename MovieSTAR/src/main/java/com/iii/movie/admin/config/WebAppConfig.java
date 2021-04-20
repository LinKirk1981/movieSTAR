package com.iii.movie.admin.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/profiles").setViewName("admin/profiles");
		
		registry.addViewController("/welcome/admin").setViewName("admin/admin");		
		registry.addViewController("/welcome/adminlogin").setViewName("admin/adminlogin");
		registry.addViewController("/login").setViewName("admin/newLogin");
		registry.addViewController("/register").setViewName("admin/register");
		
		registry.addViewController("/login/index").setViewName("index");
		registry.addViewController("/login/admin").setViewName("admin/admin");
		registry.addViewController("/logout/admin").setViewName("admin/adminlogin");
		registry.addViewController("/content.controller").setViewName("admin/content");
		//registry.addViewController("/mylogin").setViewName("admin/adminlogin");
		registry.addViewController("/403").setViewName("security/403");
		//registry.addViewController("/membercenter").setViewName("admin/profiles");
	}
   
}