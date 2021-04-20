package com.iii.movie.shopping.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.movie.admin.repository.IMovieMemberJpaImpl;
import com.iii.movie.films.model.Food;
import com.iii.movie.films.model.Movie;
import com.iii.movie.films.repository.FoodRepository;
import com.iii.movie.shopping.model.OrderTicket;
import com.iii.movie.shopping.repository.MovieInformationRepository;
import com.iii.movie.shopping.repository.OrderTicketInformationRepository;

@Service
@Transactional
public class OrderBackstageService {
	
	@Autowired
	private OrderTicketInformationRepository orderTicketInformationRepository;
	@Autowired
	private MovieInformationRepository movieInformationRepository;
	@Autowired
	private FoodRepository foodRepository;
	@Autowired
	private IMovieMemberJpaImpl iMovieMemberJpaImpl;
	
	public List<OrderTicket> getAllReturnOrder(){
		return orderTicketInformationRepository.findByApplyNotNull();
	}
	
	public void permit(Integer id) {
		OrderTicket orderTicket = orderTicketInformationRepository.findById(id).get();
		orderTicket.setApply(2);
		orderTicket.setOrderStatus(2);
	}
	
	public void overrule(Integer id) {
		OrderTicket orderTicket = orderTicketInformationRepository.findById(id).get();
		orderTicket.setApply(3);
	}
	
	public List<OrderTicket> findByTransactionNumber(String transactionNumber){
		return orderTicketInformationRepository.findByTransactionNumber(transactionNumber);
	}
	
	public void getTicket(Integer id) {
		OrderTicket orderTicket = orderTicketInformationRepository.findById(id).get();
		orderTicket.setOrderStatus(2);
	}
	
	public List<OrderTicket> findAllOrderTicket(){
		return orderTicketInformationRepository.findAll();
	}
	
	public List<Food> findAllFoods(){
		return foodRepository.findAll();
	}
	
	public List<OrderTicket> getAllMemberOrder(){
		return orderTicketInformationRepository.findAllByOrderByMemberAsc();
	}
	
	public Integer getMemberQuantity() {
		return iMovieMemberJpaImpl.findAll().size();
	}
	
	public List<Movie> getShelfMovie() {
		return movieInformationRepository.findByMovieState(1);
	}
}
