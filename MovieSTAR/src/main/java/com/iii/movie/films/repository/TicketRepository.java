package com.iii.movie.films.repository;

import java.util.List;

import com.iii.movie.films.model.TicketPrice;

public interface TicketRepository {

	List<TicketPrice> getAllTicketPrices();
	
	TicketPrice getTicketPriceByVersion(String version);
}
