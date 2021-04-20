package com.iii.movie.msg.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii.movie.bot.storage.UserStorage;
import com.iii.movie.films.model.Movie;
import com.iii.movie.films.service.MovieService;
import com.iii.movie.msg.model.Forum;
import com.iii.movie.msg.model.Message;
import com.iii.movie.msg.service.ForumS;
import com.iii.movie.msg.service.MessageS;


@Controller
@CrossOrigin
public class ForumFindViewController {
	
	@Autowired
	MovieService movieService;
	
	@Autowired 
	ForumS forumS;
	
	@Autowired 
	MessageS messageS;
	
	//進入電影目錄
	@GetMapping("/findForum")
	public String test(Movie movie, Model m) {
		List<Movie> allMovies = movieService.selectAll(movie);
		List<Movie> csmv = movieService.selectComingSoonMovie();
		m.addAttribute("Movies",allMovies);
		m.addAttribute("csmv",csmv);
		return "msg/findForum";
		
	}
	
	//進入文章頁面
	@GetMapping("/saveForum")
	public String saveNewForum(@RequestParam("movie") String movieName,Model m) {
		Movie movie = movieService.selectByName(movieName);
		m.addAttribute("movie",movie);
		return "msg/forum";
	}
	
	//進入檢舉畫面
	@GetMapping("/reportForum/{fid}")
	public String showAllForum(@PathVariable Integer fid,Model m) {
		Forum fm = forumS.showOneMsg(fid);
		m.addAttribute("fm",fm);
		m.addAttribute(fid);
		return "msg/reportForum";
	}
	
	//文章主題
	@GetMapping("/message/{fid}")
	public String showMessage(@PathVariable Integer fid,Model m) {
		Forum fm = forumS.showOneMsg(fid);
		m.addAttribute("fm",fm);
		m.addAttribute(fid);
		return "msg/message";
	}
	
	//留言刪除
	@PostMapping("/reportMessage.controller")
	public @ResponseBody String reportMessage(@RequestParam("mid")Integer mid,@RequestBody Message message) {
		messageS.reportMessage(mid,message);
		return "msg/message";
	}
	
	//======================================後台部分======================================
	//後台文章主頁
	@GetMapping("/msg/showAll")
	public String showAllBackForum(Model m) {
		List<Forum> fm = forumS.findAll();
		m.addAttribute("fm",fm);
		return "msgback/backForumTest";
	}
	
	//後台查看文章
	@GetMapping("/msg/{fid}")
	public String showOne(@PathVariable("fid")Integer fid,Model m) {
		Forum fm = forumS.showBackOne(fid);
		m.addAttribute("fm",fm);
		return "msgback/backShowOne";
	}
	
	//後台查看文章同頁
	@GetMapping("/msg/seeOneForum")
	public @ResponseBody Forum seeOneForum(@RequestParam("fid")Integer fid,Model m) {
			m.addAttribute("fid",fid);
			return forumS.showBackOne(fid);
	}
	

	//查詢會員文章
	@GetMapping("/msg/seeMyForum")
	public String seeMyForum(@RequestParam("account")String account,Model m) {
		List<Forum> fm = forumS.seeMyForum(account);
		m.addAttribute("fm",fm);
		m.addAttribute("account",account);
		return "msgback/myForum";
	}
	
	//查詢會員留言
	@GetMapping("/msg/seeMyMessage")
	public String seeMyMessage(@RequestParam("fk")Integer fk,@RequestParam("fk")Integer fid,Model m) {
		List<Message> mg = messageS.seeMyMessage(fk);
		Forum fm = forumS.showBackOne(fid);
		m.addAttribute("mg",mg);
		m.addAttribute("fm",fm);
		return "msgback/myMessage";
	}
	
	
	//後台刪除文章
	@PostMapping("/msg/delForum.controller")
	public @ResponseBody String delForum(@RequestParam("fid")Integer fid,@RequestBody Forum forum) {
		forumS.delForum(fid,forum);
		 return "msgback/backForumTest";
	}
	
	//後台查看檢舉
	@GetMapping("/msg/SeeReport.controller")
	public @ResponseBody Forum SeeReport(@RequestParam("fid")Integer fid) {		
			return forumS.SeeReport(fid);
	}
	
	
	
	//-------------------------------------------聊天室----------------------------------------
//	@GetMapping("/bot")
//	public String bot() {
//		return "bot/index";
//	}
//	
//	 @GetMapping("/registration/{userName}")
//	    @ResponseBody
//	    public ResponseEntity<Void> register(@PathVariable String userName) {
//	        System.out.println("handling register user request: " + userName);
//	        try {
//	            UserStorage.getInstance().setUser(userName);
//	        } catch (Exception e) {
//	            return ResponseEntity.badRequest().build();
//	        }
//	        return ResponseEntity.ok().build();
//	    }
//
//	    @GetMapping("/fetchAllUsers")
//	    public Set<String> fetchAll() {
//	        return UserStorage.getInstance().getUsers();
//	    }
	

	
	@GetMapping("/tt")
	public String tt() {
		return "msgroom/tt";
	}
	

	@GetMapping("/123")
	public String d() {
		return "msgroom/d";
	}
	

}
