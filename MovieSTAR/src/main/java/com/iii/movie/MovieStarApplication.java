package com.iii.movie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class MovieStarApplication {

	public static void main(String[] args) {
		SpringApplication.run(MovieStarApplication.class, args);
	}

}
