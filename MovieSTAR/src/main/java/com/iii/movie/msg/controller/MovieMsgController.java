package com.iii.movie.msg.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iii.movie.msg.model.Msgmovie;
import com.iii.movie.msg.service.MovieMsgService;

@Controller
@SessionAttributes(names = {"pagesRowMM","pagess","pageNumbers"})
@EnableTransactionManagement
public class MovieMsgController {
	@Autowired
	MovieMsgService movieMsgService;
	
	//新增電影留言
	@PostMapping("/movieMsgSave.controller")
	public void movieMsgSave(@RequestBody Msgmovie msgmovie) {
		movieMsgService.save(msgmovie);
	}
	
//	//顯示電影留言
//	@GetMapping("/showMovieMsg.controller")
//	public @ResponseBody List<Msgmovie> showMovieMsg(@RequestParam(name = "mmovie")String mmovie){
//		return movieMsgService.showMovieMsg(mmovie);
//	}
	
	//顯示電影最新留言
//	@GetMapping("/showNewTimeMsg.controller")
//	public @ResponseBody List<Msgmovie> showNewNimeMsg(@RequestParam(name = "mmovie")String mmovie){
//		return movieMsgService.showNewTimeMsg(mmovie);
//	}
	
//	//顯示電影最高評分
//	@GetMapping("/showStarMsg.controller")
//	public @ResponseBody List<Msgmovie> showStarMsg(@RequestParam(name = "mmovie")String mmovie){
//		return movieMsgService.showStarMsg(mmovie);
//	}
	
//	//顯示電影最舊留言
//	@GetMapping("/showOldTimeMsg.controller")
//	public @ResponseBody List<Msgmovie> showOldTimeMsg(@RequestParam(name = "mmovie")String mmovie){
//		return movieMsgService.showOldTimeMsg(mmovie);
//	}
	
	//顯示電影最低評分
//	@GetMapping("/showBadMsg.controller")
//	public @ResponseBody List<Msgmovie> showBadMsg(@RequestParam(name = "mmovie")String mmovie){
//		return movieMsgService.showBadMsg(mmovie);
//	}
	
	//顯示電影留言+分頁+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@GetMapping("/showMovieMsg.controller/{mmovie}/{pageNumbers}")
	public @ResponseBody List<Msgmovie> showMovieMsgPage(@PathVariable String mmovie,@PathVariable Integer pageNumbers,Model m){
//			@RequestParam(name = "mmovie")String mmovie,@PathVariable Integer pageNumber,Model m){
		int pageSize = 3;
		PageRequest pageable = PageRequest.of(pageNumbers-1, pageSize);		
		Page<Msgmovie> page = movieMsgService.findByMmovie(mmovie,pageable);
		System.out.println("--------------我是分頁------------------------------------------------------------------------------------");
		Integer pages = page.getTotalPages();
		System.out.println(pages);
		m.addAttribute("pagesRowMM",pages);
		List<Msgmovie> Mms = page.getContent();
		return Mms;
	}
	
	//網格頁數回傳
		@GetMapping("/moviePagesCountRowMM.controller")
		@ResponseBody
		public Integer moviePagesCountRow(@SessionAttribute Integer pagesRowMM) {
			return pagesRowMM;
		}
	

		
	//顯示電影最新留言+ 分頁
	@GetMapping("/showNewTimeMsg.controller/{mmovie}/{pageNumbers}")
	public @ResponseBody List<Msgmovie> showNewTimeMsg(@PathVariable String mmovie,@PathVariable Integer pageNumbers,Model m){
		int pageSize = 3;
		PageRequest pageable = PageRequest.of(pageNumbers-1, pageSize);		
		Page<Msgmovie> page = movieMsgService.showNewTimeMsg(mmovie,pageable);
		System.out.println("--------------我是最新留言------------------------------------------------------------------------------------");
		Integer pages = page.getTotalPages();
		System.out.println(pages);
		m.addAttribute("pagesRowMM",pages);
		List<Msgmovie> Mms = page.getContent();
		return Mms;
	}
	
	
	//顯示電影最舊留言+ 分頁
	@GetMapping("/showOldTimeMsg.controller/{mmovie}/{pageNumbers}")
	public @ResponseBody List<Msgmovie> showOldTimeMsg(@PathVariable String mmovie,@PathVariable Integer pageNumbers,Model m){
		int pageSize = 3;
		PageRequest pageable = PageRequest.of(pageNumbers-1, pageSize);		
		Page<Msgmovie> page = movieMsgService.showOldTimeMsg(mmovie,pageable);
		System.out.println("--------------我是高評分------------------------------------------------------------------------------------");
		Integer pages = page.getTotalPages();
		System.out.println(pages);
		m.addAttribute("pagesRowMM",pages);
		List<Msgmovie> Mms = page.getContent();
		return Mms;
	}
	
	//顯示電影最高評分+ 分頁
	@GetMapping("/showStarMsg.controller/{mmovie}/{pageNumbers}")
	public @ResponseBody List<Msgmovie> showStarMsg(@PathVariable String mmovie,@PathVariable Integer pageNumbers,Model m){
		int pageSize = 3;
		PageRequest pageable = PageRequest.of(pageNumbers-1, pageSize);		
		Page<Msgmovie> page = movieMsgService.findByMmovieStar(mmovie,pageable);
		System.out.println("--------------我是高評分------------------------------------------------------------------------------------");
		Integer pages = page.getTotalPages();
		System.out.println(pages);
		m.addAttribute("pagesRowMM",pages);
		List<Msgmovie> Mms = page.getContent();
		return Mms;
	}
	
	//顯示電影最低評分+ 分頁
	@GetMapping("/showBadMsg.controller/{mmovie}/{pageNumbers}")
	public @ResponseBody List<Msgmovie> showBadMsg(@PathVariable String mmovie,@PathVariable Integer pageNumbers,Model m){
		int pageSize = 3;
		PageRequest pageable = PageRequest.of(pageNumbers-1, pageSize);		
		Page<Msgmovie> page = movieMsgService.showBadMsg(mmovie,pageable);
		System.out.println("--------------我是高評分------------------------------------------------------------------------------------");
		Integer pages = page.getTotalPages();
		System.out.println(pages);
		m.addAttribute("pagesRowMM",pages);
		List<Msgmovie> Mms = page.getContent();
		return Mms;
	}

	
	
	//檢舉電影留言
	@PostMapping("/msgmovieReport.controller")
	public String msgmovieReport(@RequestBody Msgmovie msgmovie) {
		movieMsgService.msgmovieReport(msgmovie);
		return "moviemsg/movieMsg";
	}
}
