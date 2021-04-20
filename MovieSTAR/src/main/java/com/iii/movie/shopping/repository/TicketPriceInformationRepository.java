package com.iii.movie.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.movie.films.model.TicketPrice;

public interface TicketPriceInformationRepository extends JpaRepository<TicketPrice, Integer> {

}
