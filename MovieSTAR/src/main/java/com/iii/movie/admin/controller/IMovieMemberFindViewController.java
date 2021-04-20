package com.iii.movie.admin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.iii.movie.films.model.Movie;
import com.iii.movie.films.service.MovieService;


@Controller
public class IMovieMemberFindViewController {
	
	@Autowired
	private MovieService movieService;
	
	@RequestMapping(path = "/profile.controller")
	public String profile() {
		return "admin/profiles";
	}
	
	@GetMapping(path = "/homepage.controller")
	public String homepage() {
		return "/index";
	}
	
	@GetMapping(path = "/forgetpwd.controller")
	public String forgetAction() {
		return "admin/forgetpwd";
	}
	
	@RequestMapping(path = "/login.controller", method = RequestMethod.GET)
	public String loginAction() {
		return "admin/newLogin";
	}

	@RequestMapping(path = "/emailcheck.controller", method = RequestMethod.GET)
	public String emailcheckAction() {
		return "admin/emailcheck";
	}
	
	@GetMapping("/insertEmployee")
	public String sendEmptyForm() {
		return "admin/register";
	}
	
	@GetMapping("/showAllEmployees")
	public String sendAllEmployees() {
		return "admin/admin";
	}
	
	@GetMapping("/content.controller")
	public String content(Movie movie,Model m) {
		List<Movie> mv = movieService.selectAll(movie);
		m.addAttribute("mv",mv);
		return "admin/content";
	}
	
	@GetMapping(value = "/employeeEdit/{memPk}", produces = { "application/json" })                   
	public String displayEmployee(@PathVariable Integer memPk, Model model) {
		model.addAttribute("memPk", memPk);
		return "_01/editEmployee";
	}
	
	@GetMapping(path="/login")
	public String login() {
		return "admin/newLogin";
	}
	
	@GetMapping(path="/register")
	public String register() {
		return "admin/register";
	}
	
	@GetMapping(path="/error.controller")
	public String error() {
		return "404";
	}
	

}
