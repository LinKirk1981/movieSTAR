package com.iii.movie.films.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.films.model.TicketPrice;
import com.iii.movie.films.repository.TicketRepository;
import com.iii.movie.films.service.TicketService;

@Service
@Transactional
public class TicketServiceImpl implements TicketService {

	@Autowired
	TicketRepository ticketRepository;
	
	@Override
	public List<TicketPrice> getAllTicketPrices() {
		
		return ticketRepository.getAllTicketPrices();
	}

	@Override
	public TicketPrice getTicketPriceByVersion(String version) {

		return ticketRepository.getTicketPriceByVersion(version);
	}

}
