package com.iii.movie.shopping.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.iii.movie.admin.model.IMovieMember;
import com.iii.movie.admin.repository.IMovieMemberJpaImpl;
import com.iii.movie.films.model.Food;
import com.iii.movie.films.model.FoodSpecies;
import com.iii.movie.films.model.Movie;
import com.iii.movie.films.model.Schedule;
import com.iii.movie.films.repository.FoodRepository;
import com.iii.movie.shopping.model.OrderTicket;
import com.iii.movie.shopping.model.SeatNumber;
import com.iii.movie.shopping.repository.MovieInformationRepository;
import com.iii.movie.shopping.repository.OrderTicketInformationRepository;
import com.iii.movie.shopping.repository.SchedulesInformationRepository;

@Service
@Transactional
public class BuyTicketsService {
	
	@Autowired
	private MovieInformationRepository movieInformationRepository;
	@Autowired
	private SchedulesInformationRepository schedulesInformationRepository;
	@Autowired
	private IMovieMemberJpaImpl iMovieMemberJpaImpl;
	@Autowired
	private FoodRepository foodRepository;
	@Autowired
	private OrderTicketInformationRepository orderTicketInformationRepository;
	
	public Page<Movie> getAllMovies(Pageable pageable) {
		return movieInformationRepository.findByMovieState(1,pageable);
	}
	
	public Movie getMovie(Integer id) {
		Optional<Movie> oMovie = movieInformationRepository.findById(id);
		return oMovie.get();
	}
	
	public Schedule getSchedule(Integer id) {
		Optional<Schedule> oSchedule = schedulesInformationRepository.findById(id);
		return oSchedule.get();
	}
	
	public void addOrderTicket(OrderTicket orderTicket, Integer memberId) {
		IMovieMember iMovieMember = iMovieMemberJpaImpl.findById(memberId).get();
		orderTicket.setMember(iMovieMember);
		orderTicketInformationRepository.saveAndFlush(orderTicket);
	}

	public FoodSpecies getFoodSpecies(Integer id) {
		Food food = foodRepository.findById(id).get();
		return food.getFoodSpecies();
	}
	
	public List<SeatNumber> getAllSeatNumbers(Schedule schedule){
		List<OrderTicket> orderTicket = orderTicketInformationRepository.findBySchedules(schedule);
		List<SeatNumber> seatNumber = new ArrayList<SeatNumber>();
		
		for (OrderTicket orderTicket2 : orderTicket) {
			seatNumber.addAll(orderTicket2.getSeatNumbers());
		}
		return seatNumber;
	}
	
	public List<Food> getAllFood(){
		List<Food> foods = foodRepository.findAll();
		return foods;
	}
	
	public Page<OrderTicket> getMemberOrder(Integer memberId, Pageable pageable){

		IMovieMember iMovieMember = iMovieMemberJpaImpl.findById(memberId).get();
		
		Page<OrderTicket> orders = orderTicketInformationRepository.findByMemberOrderByOrderStatusAscBuyDateDesc(iMovieMember, pageable);
		
		return orders;
	}
	
	public void updateApply(Integer id) {
		OrderTicket orderTicket = orderTicketInformationRepository.findById(id).get();
		orderTicket.setApply(1);
	}
	
	public List<Schedule> getAllSchedules(){
		return schedulesInformationRepository.findAll();
	}
	
	public Schedule getfastSchedule(String movieName, String date, String time) {
		return schedulesInformationRepository.findByMovieAndDateAndTime(movieInformationRepository.findByMovieName(movieName).get(0), date, time).get(0);
	}
	
	public Movie findByMovieName(String movieName) {
		return movieInformationRepository.findByMovieName(movieName).get(0);
	}

}
