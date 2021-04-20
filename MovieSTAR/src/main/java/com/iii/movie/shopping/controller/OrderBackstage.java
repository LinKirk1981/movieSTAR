package com.iii.movie.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.iii.movie.films.model.Food;
import com.iii.movie.films.model.Movie;
import com.iii.movie.msg.service.ForumS;
import com.iii.movie.shopping.model.OrderFood;
import com.iii.movie.shopping.model.OrderTicket;
import com.iii.movie.shopping.model.TicketQuantity;
import com.iii.movie.shopping.service.OrderBackstageService;

@Controller
@RequestMapping("/shopping")
public class OrderBackstage {
	
	@Autowired
	public OrderBackstageService orderBackstageService;
	@Autowired
	public ForumS forums;
	
	//導向後台退款辦理
	@GetMapping("/returnTicket.controller")
	public String returnTicket() {
		return "shopping/returnTicketBackstage";
	}
	
	//所有退款申請資料
	@GetMapping("/allApply.controller")
	@ResponseBody
	public List<OrderTicket> allApply(){
		return orderBackstageService.getAllReturnOrder();
	}
	
	//允許退票
	@GetMapping("/permit.controller/{id}")
	@ResponseBody
	public String permit(@PathVariable Integer id){
		
		orderBackstageService.permit(id);
		
		return "";
	}
	
	//駁回退票
	@GetMapping("/overrule.controller/{id}")
	@ResponseBody
	public String overrule(@PathVariable Integer id){
		
		orderBackstageService.overrule(id);
		
		return "";
	}
	
	//導入取票
	@GetMapping("/checkIn.controller")
	public String checkIn() {
		return "shopping/checkInBackstage";
	}
	
	//取得單筆訂單
	@GetMapping("/orderItem.controller/{transactionNumber}")
	@ResponseBody
	public OrderTicket orderItem(@PathVariable String transactionNumber) {
		
		try {			
			
			OrderTicket orderTicket = orderBackstageService.findByTransactionNumber(transactionNumber).get(0);
			return orderTicket;
			
		} catch (Exception e) {
			
			return new OrderTicket();
		}
		
	}
	
	//取票
	@GetMapping("/getTickets.controller/{orderId}")
	@ResponseBody
	public String getTickets(@PathVariable Integer orderId) {
		orderBackstageService.getTicket(orderId);
		return "";
	}
	
	//導至統計圖
	@GetMapping("/statistics.controller")
	public String statistics() {
		return "shopping/statistics";
	}
	
	//統計圖數據
	@GetMapping("/salesData.controller")
	@ResponseBody
	public Map<String, List> salesData(){
		List<Food> foods = orderBackstageService.findAllFoods();
		List<Movie> moviesName = orderBackstageService.getShelfMovie();
		List<OrderTicket> orderTickets = orderBackstageService.findAllOrderTicket();
		Map<String, List> salesData = new HashMap<>();
		//會員人數
		List<Integer> mbqst = new ArrayList<>();
		mbqst.add(orderBackstageService.getMemberQuantity());	
		salesData.put("mbqst", mbqst);
		
		//電影上架數
		List<Integer> mvqst = new ArrayList<>();
		mvqst.add(moviesName.size());
		salesData.put("mvqst", mvqst);
		
		//文章數
		List<Integer> fsqst = new ArrayList<>();
		fsqst.add(forums.findAll().size());
		salesData.put("fsqst", fsqst);
		
		//所有電影名稱
		List<String> mns = new ArrayList<String>();
		for (Movie movie : moviesName) {
			mns.add(movie.getMovieName());
		}
		salesData.put("mns", mns);
		
		//所有電影的售票量
		List<Integer> toqs = new ArrayList<Integer>();
		for (Movie movie : moviesName) {
			int toq = 0;
			for (OrderTicket orderTicket : orderTickets) {
				if(movie.getMovieId() == orderTicket.getSchedules().getMovie().getMovieId()) {
					List<TicketQuantity> tq = orderTicket.getTicketQuantities();
					for (TicketQuantity ticketQuantity : tq) {
						toq += ticketQuantity.getTicketQuantity();
					}
				}
			}
			toqs.add(toq);
		}
		salesData.put("toqs", toqs);
		
		//所有食物名稱
		List fns = new ArrayList<String>();
		for (Food food : foods) {
			fns.add(food.getFoodname());
		}
		salesData.put("fns", fns);
		
		//所有的食物購買量
		List<Integer> ofqs = new ArrayList<>();
		int movTotal = 0;
		
		for (Food food : foods) {
			int ofq = 0;
			for (OrderTicket orderTicket : orderTickets) {
				List<OrderFood> orderFoods = orderTicket.getOrderFoods();
				movTotal += orderTicket.getTicketMoney();
				for (OrderFood orderFood : orderFoods) {
					if(food.getFoodid() == orderFood.getFood().getFoodid()) {
						ofq += orderFood.getFoodQuantity();
					}
				}
			}
			ofqs.add(ofq);
		}
		salesData.put("ofqs", ofqs);
		
		//訂單數量
		List<Integer> otqst = new ArrayList<>();
		otqst.add(movTotal);
		salesData.put("otqst",otqst);
		
		//所有時段的購票
		List<Integer> times = new ArrayList<>();
		for(int i = 0; i < 24 ; i++) {
			int otq = 0;
			for (OrderTicket orderTicket : orderTickets) {
				String[] time = orderTicket.getSchedules().getTime().split(":");
				Integer itm = Integer.valueOf(time[0]);
				if(i==itm) {
					List<TicketQuantity> ticketQuantities = orderTicket.getTicketQuantities();
					for (TicketQuantity ticketQuantity : ticketQuantities) {
						otq += ticketQuantity.getTicketQuantity();
					}
				}
			}
			times.add(otq);
		}
		salesData.put("times", times);
		
		return salesData;
	}
	
	//導至會員訂單
	@GetMapping("/nameberOrder.controller")
	public String nameberOrder() {
		return "shopping/nameberOrderBackstage";
	}
	
	@GetMapping("/allMemberOrder.controller")
	@ResponseBody
	public List<OrderTicket> allMemberOrder(){
		
		List<OrderTicket> members = orderBackstageService.getAllMemberOrder();
		
		return members;
	}
	
	
	
}
