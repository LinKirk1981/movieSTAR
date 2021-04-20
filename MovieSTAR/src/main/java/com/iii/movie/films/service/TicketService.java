package com.iii.movie.films.service;

import java.util.List;

import com.iii.movie.films.model.TicketPrice;

public interface TicketService {

	List<TicketPrice> getAllTicketPrices();

	TicketPrice getTicketPriceByVersion(String version);
}
