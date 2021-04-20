package com.iii.movie.admin.controller;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;


	
	@Configuration
	public class MyErrorController implements ErrorPageRegistrar {

		@Override
			public void registerErrorPages(ErrorPageRegistry registry) {
		    ErrorPage[] errorPages = new ErrorPage[2];
	        errorPages[0] = new ErrorPage(HttpStatus.NOT_FOUND, "/error.controller");
	        errorPages[1] = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html");

	        registry.addErrorPages(errorPages);
			
		}
	}




