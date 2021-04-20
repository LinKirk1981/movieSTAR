package com.iii.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePage {
	
	@GetMapping("/")
	public String initialPage() {
		return "index";
	}
	
	@GetMapping("/backstageHomePage")
	public String userHomePage() {
		return "backstageHomePage";
	}
}
