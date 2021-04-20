package com.iii.movie.films.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iii.movie.films.model.Hall;
import com.iii.movie.films.model.Movie;
import com.iii.movie.films.model.Schedule;
import com.iii.movie.films.model.TicketPrice;
import com.iii.movie.films.service.ArrangeHallService;
import com.iii.movie.films.service.MovieService;
import com.iii.movie.films.service.ScheduleService;
import com.iii.movie.films.service.TicketService;


@Controller
@EnableTransactionManagement
public class MovieController {

	@Autowired
	private MovieService movieService;
	@Autowired
	private ArrangeHallService arrangeHallService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private ScheduleService scheduleService;

	
	
	// 新增導向
	@RequestMapping(path = "/films/saveMovie",method = RequestMethod.POST) 
	public String addMovie(Movie movie, BindingResult result
			,@RequestParam(value = "movieName") String name,@RequestParam(value = "movieActor") String actor
			,@RequestParam(value = "movieDirector") String director,@RequestParam(value = "movieType") String type
			,@RequestParam(value = "movieDetail") String detail,@RequestParam(value = "movieTrailer") String trailer
			,@RequestParam(value = "movieImage") MultipartFile file ,@RequestParam(value = "movieRating") String rating
			,@RequestParam(value = "movieDate") String date ,@RequestParam(value = "movieDuration") String duration
			,@RequestParam(value = "movieCompany") String company,@RequestParam(value = "movieState") Integer state
			,HttpServletRequest request) {

//		if (result.hasErrors()) {
//			return "films/errorMovie";
//		}
		
		String fileName=movie.getMovieId()+".jpg";
		System.out.println("fileName:"+fileName);
		
		String saveDir = request.getServletContext().getRealPath("/")+"WEB-INF\\views\\image";
		System.out.println(saveDir);
		File saveFileDir = new File(saveDir);
		saveFileDir.mkdirs();
		
		File saveFilePath =new File(saveFileDir,fileName);
		byte[] image =null;
		try {
			file.transferTo(saveFilePath);
			System.out.println("saveFilePath:"+saveFilePath);
			if(fileName!=null && fileName.length()!=0) {
				InputStream is1 =new FileInputStream(saveFilePath);
				image = new byte[is1.available()];
				is1.read(image);
				is1.close();
			}
		} catch (Exception e) {
			
		}
		
		List<Movie> movie2 = movieService.selectAll(movie);
		//因做到一半發現沒有在Movie的Bean裡建立自動生成編號,又不想在前端手動輸入,所以讓他根據List的size自動產生編號,但是刪除可能會產生bug,請小心使用
		Integer id = movie2.size();
		Integer id2 = movie2.get(id-1).getMovieId()+1;
		System.out.println(id2);
		Movie moviefilm = new Movie(movie2.get(id-1).getMovieId()+1,name,actor,director,type,detail,trailer,image,date,duration,company,state,rating);
		
		movieService.saveMovie(moviefilm);
		
		return "redirect:/films";	
	}
	//刪除
	@RequestMapping(path = "/deleteMovie",method = RequestMethod.GET)
	public String removeMovie(@RequestParam("id") Integer id) {
		movieService.deleteMovie(id);
		return "redirect:/films";	
	}
	
	//修改行程
	
	//刪除行程
	@RequestMapping(path = "/deleteSchedule",method = RequestMethod.GET)
	public String removeSchedule(@RequestParam("id") Integer id) {
		
		scheduleService.deleteSchedule(id);
		return "redirect:/scheduleIndex.controller";
	}
	
	//修改
	@RequestMapping(path = "updateMovie",method = RequestMethod.POST)
	public String updateMovie(Movie movie, BindingResult result,@RequestParam(value = "movieId") Integer id
			,@RequestParam(value = "movieName") String name,@RequestParam(value = "movieActor") String actor
			,@RequestParam(value = "movieDirector") String director,@RequestParam(value = "movieType") String type
			,@RequestParam(value = "movieDetail") String detail,@RequestParam(value = "movieTrailer") String trailer
			,@RequestParam(value = "movieImage") MultipartFile file ,@RequestParam(value = "movieRating") String rating
			,@RequestParam(value = "movieDate") String date ,@RequestParam(value = "movieDuration") String duration
			,@RequestParam(value = "movieCompany") String company,@RequestParam(value = "movieState") Integer state
			,HttpServletRequest request) {

//		if (result.hasErrors()) {
//			return "films/errorMovie";
//		}
		String fileName=movie.getMovieId()+".jpg";
		System.out.println("fileName:"+fileName);
		
		String saveDir = request.getServletContext().getRealPath("/")+"WEB-INF\\views\\image";
		File saveFileDir = new File(saveDir);
		saveFileDir.mkdirs();
		
		File saveFilePath =new File(saveFileDir,fileName);
		byte[] image =null;
		try {
			file.transferTo(saveFilePath);
			System.out.println("saveFilePath:"+saveFilePath);
			if(fileName!=null && fileName.length()!=0) {
				InputStream is1 =new FileInputStream(saveFilePath);
				image = new byte[is1.available()];
				is1.read(image);
				is1.close();
			}
		} catch (Exception e) {
			
		}
		System.out.println(state);
		//若圖片回傳是空,不對圖片進行修改
		if(image.length==0) {
			System.out.println("123");
			Movie moviefilm = movieService.selectById(id);
			moviefilm.setMovieActor(actor);
			moviefilm.setMovieCompany(company);
			moviefilm.setMovieDate(date);
			moviefilm.setMovieDetail(detail);
			moviefilm.setMovieDirector(director);
			moviefilm.setMovieDuration(duration);
			moviefilm.setMovieId(id);
			moviefilm.setMovieName(name);
			moviefilm.setMovieRating(rating);
			moviefilm.setMovieState(state);
			moviefilm.setMovieTrailer(trailer);
			moviefilm.setMovieType(type);
			movieService.updateMovie(moviefilm);
		}else {
		System.out.println("456");
		Movie moviefilm = new Movie(id, name, actor, director, type, detail, trailer, image, date, duration, company, state, rating);
		
		
		movieService.updateMovie(moviefilm);
		}
		
		
		return "redirect:/films";
	}
	
	//新增行程
	@PostMapping(path = "/saveSchedule")
	public String saveSchedule(@RequestParam("movieName")String movieName
	,@RequestParam("scheduleDate") String date
	,@RequestParam("hallName") String hallName
	,@RequestParam("ticketVersion") String ticketVersion
	,@RequestParam("time") String time) {
		
		//行程加入日期時間
		Schedule schedule = new Schedule(date,time);
		
		//行程塞入電影
		Movie movie =movieService.selectByName(movieName);
		schedule.setMovie(movie);
		//行程塞入影廳
		Hall hall = arrangeHallService.inquireByName(hallName);
		schedule.setHall(hall);
		//行程塞入票種票價
		TicketPrice ticketPrice =  ticketService.getTicketPriceByVersion(ticketVersion);
		schedule.setTicketPrice(ticketPrice);
		//電影塞回行程
		movieService.saveScheduleByName(movieName, schedule);
		
		return "redirect:/scheduleIndex.controller";
		
	}
	
	@GetMapping("/getMoviePicture/{movieId}")
	public ResponseEntity<byte[]> getPicture(@PathVariable(value = "movieId") Integer movieId, Model m) {
		Movie movie = movieService.selectById(movieId);
		byte[] a = new byte[movie.getMovieImage().length];
			a =	movie.getMovieImage();
	     HttpHeaders httpHeaders = new HttpHeaders();
		        
		 httpHeaders.setCacheControl(CacheControl.noCache());
		 httpHeaders.setPragma("no-cache");
		 httpHeaders.setExpires(0L);
		 httpHeaders.setContentType(MediaType.IMAGE_JPEG);
		 ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(a, httpHeaders, HttpStatus.OK);
		 return responseEntity;
	}
	
	@GetMapping("/updateState.controller")
	public String updateState(@RequestParam(value = "id")Integer id) {
		Movie movie =movieService.selectById(id);
		if(movie.getMovieState()==1) {
			movie.setMovieState(0);
			movieService.updateMovie(movie);
		}else{
			movie.setMovieState(1);
			movieService.updateMovie(movie);
		}
		return "redirect:/films";
	}
	
}
