package com.iii.movie.films.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iii.movie.films.model.Food;
import com.iii.movie.films.model.Hall;
import com.iii.movie.films.model.Movie;
import com.iii.movie.films.model.Schedule;
import com.iii.movie.films.model.TicketPrice;
import com.iii.movie.films.service.ArrangeHallService;
import com.iii.movie.films.service.FoodService;
import com.iii.movie.films.service.MovieService;
import com.iii.movie.films.service.ScheduleService;
import com.iii.movie.films.service.TicketService;

@Controller
public class PageController {

	@Autowired
	private MovieService movieService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private ArrangeHallService arrangeHallService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private FoodService foodService;
	
		@GetMapping("/ttt.controller")
		public String ttt() {
			return "home";
		}
		
	    //新增食物頁面導向
	    @GetMapping(path = "/addFoodIndex.controller")
	    public String processFoodIndex() {
	     return "films/addFood";
	    };
	    // 新增行程頁面導向
		@GetMapping(path = "/addScheduleIndex.controller")
		public String processScheduleIndex(Movie movie,Hall hall,TicketPrice tk,Model m) {
			List <Movie> mv =movieService.selectAll(movie);
			List <Hall> ha = arrangeHallService.allInquire();
			List<TicketPrice> tp = ticketService.getAllTicketPrices();
			m.addAttribute("mv", mv);
			m.addAttribute("ha", ha);
			m.addAttribute("tp", tp);
			return "films/addSchedule";
		}
		
		// 行程頁面導向
				@RequestMapping(path = "/scheduleIndex.controller", method = RequestMethod.GET)
				public String processScheduleIndex(Movie movie, Model m) {
					List<Schedule> allSchedules = scheduleService.AllSchedule();
					m.addAttribute("allSchedules", allSchedules);
					return "films/scheduleIndex";
				}
		
		// 首頁頁面導向
		@RequestMapping(path = "/movieIndex.controller", method = RequestMethod.GET)
		public String processMovieIndex(Movie movie, Model m) {
			List<Movie> allMovies = movieService.selectAll(movie);
			List<String> aa=new ArrayList<String>();
			for (Movie movie2 : allMovies) {
				if (movie2.getMovieState()==1) {
					aa.add("熱映中");
				}else {
					aa.add("已下架");
				}
			}
			m.addAttribute("aa",aa);
			m.addAttribute("allMovies", allMovies);
			return "films/movieIndex";
		}
		
		
		
		@RequestMapping(path = "/films", method = RequestMethod.GET)
		public String fuck(Movie movie, Model m) {
			List<Movie> allMovies = movieService.selectAll(movie);
			List<String> aa=new ArrayList<String>();
			m.addAttribute("allMovies", allMovies);
			return "films/movieIndexSave";
		}
		
		
		// 食物首頁頁面導向
				@RequestMapping(path = "/foodIndex.controller", method = RequestMethod.GET)
				public String processFoodIndex(Food food, Model m) {
					List<Food> allFoods = foodService.findAll();
					m.addAttribute("allFoods", allFoods);
					return "films/foodIndex";
				}

		// 查詢導向
		@RequestMapping(path = "/searchSchedule.controller", method = RequestMethod.GET)
		public @ResponseBody Schedule showMovie(@RequestParam(value = "id") Integer id) {
			return scheduleService.searchSchedule(id);
		}

		//新增電影
		@RequestMapping(path = "/films/addMovie.controller",method=RequestMethod.GET)
		public String MovieFormPage(Model m) {
			m.addAttribute("movie",new Movie());
			return "films/addMovie";
		}
		//修改行程頁面
		@GetMapping(path = "/updateSchedule")
		public String ScheduleUpdateForm(@RequestParam("id") Integer id,Model m) {
			Schedule schedule =  scheduleService.searchSchedule(id);
			m.addAttribute(schedule);
			return "films/updateSchedule";
		}
		
		//修改行程
		@PostMapping(path = "updateSchedule.controller")
		public String ScheduleUpdate(@RequestParam("id")Integer id
				,@RequestParam("movieName")String movieName
				,@RequestParam("scheduleDate") String date
				,@RequestParam("hallName") String hallName
				,@RequestParam("ticketVersion") String ticketVersion
				,@RequestParam("time") String time) {
			Schedule schedule = scheduleService.searchSchedule(id);		
			schedule.setDate(date);
			schedule.setTime(time);
			scheduleService.updateSchedule(schedule);
			return "redirect:/scheduleIndex.controller";
			
		}
		
		//修改頁面
		@RequestMapping(path = "/editMovie",method = RequestMethod.GET)
		public String  MovieUpdateForm(@RequestParam("id") Integer id,Model m) {
			List<Movie> mvList = new ArrayList<Movie>();
			mvList.add(movieService.selectById(id));
			m.addAttribute("mvList", mvList);
			return "films/updateMovie";
		}
		
		//電影詳細頁面
		@GetMapping(path = "/movieDetail/{movieId}")
		public String MovieDetails(@PathVariable(value = "movieId") Integer movieId,Model m) {
			Movie movie = movieService.selectById(movieId);
			List<Movie> csmv = movieService.selectComingSoonMovie();
			byte[] a = new byte[movie.getMovieImage().length];
				a =	movie.getMovieImage();
			String aaString="";
			
			
			try {
				Base64.Encoder be = Base64.getEncoder();
				StringBuilder str =new StringBuilder();
				str.append(new String(be.encode(a)));

				aaString =str.toString();
				System.out.println(aaString);
			}
					
		 catch(Exception ex) {
			ex.printStackTrace();
		}
			m.addAttribute("csmv",csmv);
			m.addAttribute("img",aaString);
			m.addAttribute("movie",movie);
			return "moviemsg/movieDetails";
		}
		
//		@RequestMapping(path = "/findForum.controller", method = RequestMethod.GET)
//		public String processMovieForum(Movie movie, Model m) {
//			List<Movie> allMovies = movieService.selectAll(movie);
//			m.addAttribute("allMovies", allMovies);
//			return "msg/findForum";
//		}
		
		@RequestMapping("/tail")
		public String tail(Model model){
			List<Movie> comingsoonMovies = movieService.selectComingSoonMovie();
			model.addAttribute(comingsoonMovies);
			return "moviemsg/movieDetails";
		}
		
		@GetMapping(path = "searchCinemaController")
		public String searchCinema(@RequestParam(value = "poscats") Integer poscats
				,@RequestParam(value = "inputtext") String inputtext,Model m) {
			if(poscats==0) {
				List<Movie> movie = movieService.selectMovieLikeName(inputtext);
				m.addAttribute("movie",movie);
				return "films/searchMovie";
			
		}else if (poscats==2) {
			List<Movie> movie =movieService.selectMovieByType(inputtext);
			m.addAttribute("movie",movie);
			return "films/searchMovie";
		}
			return "films/searchMovie";
		
	}
}

