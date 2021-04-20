package com.iii.movie.shopping.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.iii.movie.films.model.Food;
import com.iii.movie.films.model.Movie;
import com.iii.movie.films.model.Schedule;
import com.iii.movie.films.service.MovieService;
import com.iii.movie.shopping.model.OrderFood;
import com.iii.movie.shopping.model.OrderTicket;
import com.iii.movie.shopping.model.SeatNumber;
import com.iii.movie.shopping.model.TicketQuantity;
import com.iii.movie.shopping.service.BuyTicketsService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;


@Controller
@SessionAttributes(names = {"pk","pages","pagesRow","orderPage","pageNumber"})
public class BuyTicketsController {

	@Autowired
	private BuyTicketsService buyTicketsService;
	@Autowired
	private MovieService movieService;
	
	//畫面導至電影時刻
	@GetMapping("/movieList.controller")
	public String movieListMain(Model m) {
		List<Movie> csmv =  movieService.selectComingSoonMovie();
		m.addAttribute("csmv",csmv);
		return "shopping/movieList";
	}
	
	//網格畫面
	@GetMapping("/moviesPage.controller/{pageNumber}")
	@ResponseBody
	public List<Movie> getAllMovies(@PathVariable Integer pageNumber, Model m){
		int pageSize = 9;
		PageRequest pageable = PageRequest.of(pageNumber-1, pageSize);
		Page<Movie> page = buyTicketsService.getAllMovies(pageable);
		
		Integer pages = page.getTotalPages();
		m.addAttribute("pages", pages);
		
		List<Movie> movies = page.getContent();

		return movies;
	}
	
	//網格頁數回傳
	@GetMapping("/moviePagesCount.controller")
	@ResponseBody
	public Integer moviePagesCount(@SessionAttribute Integer pages) {
		return pages;
	}
	
	//橫列畫面
	@GetMapping("/moviePagesCountRow.controller/{pageNumber}")
	@ResponseBody
	public List<Movie> moviePagesCountRow(@PathVariable Integer pageNumber, Model m){
		int pageSize = 3;
		PageRequest pageable = PageRequest.of(pageNumber-1, pageSize);
		Page<Movie> page = buyTicketsService.getAllMovies(pageable);
		
		Integer pages = page.getTotalPages();
		m.addAttribute("pagesRow", pages);
		
		List<Movie> movies = page.getContent();

		return movies;
	}
	
	//網格頁數回傳
	@GetMapping("/moviePagesCountRow.controller")
	@ResponseBody
	public Integer moviePagesCountRow(@SessionAttribute Integer pagesRow) {
		return pagesRow;
	}
	
	//購票頁面
	@GetMapping("/buyMovieTicket/{key}")
	public String buyMovieTicket(@PathVariable Integer key, Model m, HttpSession session) {
		if(session.getAttribute("mempk")==null) {
			return "admin/newLogin";
		}
		m.addAttribute("pk", key);
		return "shopping/buyMovieTicket";
	}
	
	//購票頁面的電影資訊
	@GetMapping("/movieItem.controller")
	public @ResponseBody Movie movieItem(@SessionAttribute Integer pk) {
		Movie movie = buyTicketsService.getMovie(pk);
		return movie;
	}
	
	//查詢選購電影的所有排程
	@GetMapping("/movieSchedules.controller")
	@ResponseBody
	public List<Schedule> movieSchedules(@SessionAttribute Integer pk){
		return buyTicketsService.getMovie(pk).getSchedules();
	}
	
	//查詢已訂購的座位
	@GetMapping("/orderSeat.controller/{key}")
	@ResponseBody
	public List<SeatNumber> orderSeat(@PathVariable Integer key) {
		return buyTicketsService.getAllSeatNumbers(buyTicketsService.getSchedule(key));
	}
	
	//儲存訂單
	@PostMapping(value = "/addOrderTicket.controller")
	@ResponseBody
	public String addOrderTicket (@RequestParam String orderTicket, @SessionAttribute Integer pk,@RequestParam Integer id, @SessionAttribute Integer mempk) throws JsonMappingException, JsonProcessingException{

		ObjectMapper objectMapper = new ObjectMapper();
		OrderTicket newOrderTicket = objectMapper.readValue(orderTicket, OrderTicket.class);	
		
		String transactionNumber = "";
		//交易序號
		while(transactionNumber.length() <= 9) {
			int num = (int) ((Math.random()*(90-48+1))+48);
			if(num <= 57 || num >= 65) {
				transactionNumber += (char)num;
			}
		}
		//交易日期
		newOrderTicket.setTransactionNumber(transactionNumber);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		newOrderTicket.setBuyDate(date);
		//票卷狀態(未取票)
		newOrderTicket.setOrderStatus(1);
		
		newOrderTicket.setSchedules(buyTicketsService.getSchedule(id));
		newOrderTicket.getSchedules().setMovie(buyTicketsService.getMovie(pk));
		buyTicketsService.addOrderTicket(newOrderTicket, mempk);
		
		//綠界
		AllInOne allInOne = new AllInOne("");
		AioCheckOutALL aioCheckOutALL = new AioCheckOutALL();
		
		
		SimpleDateFormat orderTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String oT = orderTime.format(new Date());
	
		StringBuffer sb = new StringBuffer();
		for (TicketQuantity ticketQuantity  : newOrderTicket.getTicketQuantities()) {
			sb.append(newOrderTicket.getSchedules().getMovie().getMovieName()+" "+newOrderTicket.getSchedules().getTicketPrice().getTicketVersion()+" "+ticketQuantity.getTicketSpecies()+" x "+ticketQuantity.getTicketQuantity()+"#");
		}
		for (OrderFood orderFood : newOrderTicket.getOrderFoods()) {
			sb.append(orderFood.getFood().getFoodname()+" x "+orderFood.getFoodQuantity()+"#");
		}
		
		aioCheckOutALL.setMerchantTradeNo(transactionNumber);
		aioCheckOutALL.setMerchantTradeDate(oT);
		aioCheckOutALL.setTotalAmount(newOrderTicket.getTicketMoney()+"");
		aioCheckOutALL.setTradeDesc("MovieSTAR 線上訂票");
		aioCheckOutALL.setItemName(sb.toString());
		aioCheckOutALL.setReturnURL("http://localhost:8080/MovieSTAR/test"); 
		aioCheckOutALL.setClientBackURL("http://localhost:8080/MovieSTAR/");
		aioCheckOutALL.setNeedExtraPaidInfo("N");
		String form = allInOne.aioCheckOut(aioCheckOutALL, null);
		
		return form;
	}
	
	//導入票夾
	@GetMapping ("/ticketHolder.controller")
	public String ticketHolder(HttpSession session) {
		if(session.getAttribute("mempk")==null) {
			return "admin/newLogin";
		}
		return "shopping/ticketHolder";
	}
	
	//票夾資訊
	@GetMapping("/orders.controller/{pageNumber}")
	public @ResponseBody List<OrderTicket> orders(@PathVariable Integer pageNumber,Model m, @SessionAttribute Integer mempk){
		int pageSize = 5;
		PageRequest pageable = PageRequest.of(pageNumber-1, pageSize);
		Page<OrderTicket> page = buyTicketsService.getMemberOrder(mempk, pageable);
		
		Integer pages = page.getTotalPages();
		m.addAttribute("orderPage", pages);
		m.addAttribute("pageNumber",pageNumber);
		List<OrderTicket> memberOrder = page.getContent();
		
		return memberOrder;
	}
	
	//票夾頁數
	@GetMapping("/orderPage.controller")
	@ResponseBody
	public Integer orderPage(@SessionAttribute Integer orderPage) {
		
		return orderPage;
	}
	
	//取得食物
	@GetMapping("/foods.controller")
	public @ResponseBody List<Food> food(){
		List<Food> foods = buyTicketsService.getAllFood();
		return foods;
	}
	
	//退票並回傳最新票夾內容
	@GetMapping("/refund.controller/{ticketId}")
	@ResponseBody
	public String refund(@PathVariable Integer ticketId,@SessionAttribute Integer pageNumber) {
		buyTicketsService.updateApply(ticketId);
		return "";
	}
	
	//快速訂票(電影資訊)
	@GetMapping("/fastMovies.controller")
	@ResponseBody
	public List<Schedule> fastMovies(){
		return buyTicketsService.getAllSchedules();
	}
	
	//快速訂票訂單
	@PostMapping("/fastBuyView.controller")
	public String fastBuyView(HttpSession session, @RequestParam String movie, @RequestParam String date, @RequestParam String time) {
		
		if(session.getAttribute("mempk")==null) {
			return "admin/newLogin";
		}
		
		Movie movieBean = buyTicketsService.findByMovieName(movie);
		session.setAttribute("pk", movieBean.getMovieId());
		
		session.setAttribute("schedule", buyTicketsService.getfastSchedule(movie, date, time));
		return "shopping/fastBooking";
	}
	
	//快速訂票單筆行程
	@GetMapping("/fastSchedule.controller")
	@ResponseBody
	public Schedule fastSchedule(@SessionAttribute Schedule schedule) {
		return schedule;
	}
}
