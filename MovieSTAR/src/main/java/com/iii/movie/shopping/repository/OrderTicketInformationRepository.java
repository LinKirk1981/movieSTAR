package com.iii.movie.shopping.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.iii.movie.admin.model.IMovieMember;
import com.iii.movie.films.model.Schedule;
import com.iii.movie.shopping.model.OrderTicket;

public interface OrderTicketInformationRepository extends JpaRepository<OrderTicket, Integer> {
	
	public List<OrderTicket> findBySchedules(Schedule schedules);
	
	public Page<OrderTicket> findByMemberOrderByOrderStatusAscBuyDateDesc(IMovieMember iMovieMember,Pageable pageable);
	
	public List<OrderTicket> findByApplyNotNull();
	
	public List<OrderTicket> findByTransactionNumber(String transactionNumber);
	
	public List<OrderTicket> findAllByOrderByMemberAsc();
	
}
