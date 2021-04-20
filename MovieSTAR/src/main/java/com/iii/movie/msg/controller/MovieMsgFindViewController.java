package com.iii.movie.msg.controller;


import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.iii.movie.films.model.Movie;
import com.iii.movie.films.service.MovieService;
import com.iii.movie.msg.service.MovieMsgService;



@Controller
public class MovieMsgFindViewController {
	@Autowired 
	MovieMsgService movieMsgService;
	@Autowired
	private MovieService movieService;
	
	//電影留言檢舉
	@GetMapping("/reportMsg/{mid}/{movieId}")
	public String msgReport(@PathVariable Integer movieId,@PathVariable Integer mid , Model m) {
		m.addAttribute("x",movieId);
		m.addAttribute(mid);
		return "moviemsg/msgReport";
		
	}
	
	
	
	//前台留言登入畫面
	@GetMapping("/loginMM")
	public String login(Model m) {
//		m.addAttribute(movieId);
//		Movie movie = movieService.selectById(movieId);
//		m.addAttribute("movie",movie);
		return "moviemsg/newLogin";
//	public String login(@PathVariable(value = "movieId") Integer movieId, Model m) {
//		m.addAttribute("movieId",movieId);
	}

}
