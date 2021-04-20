package com.iii.movie.films.repository;

import java.util.List;

import com.iii.movie.films.model.Hall;
import com.iii.movie.films.model.Seat;

public interface ArrangeHallRepository {
	
	public void insert(Hall hBean);
	
	public Hall inquire(Integer hallId);
	
	public List<Hall> allInquire();
	
	public void setRetained(Hall hBean);
	
	public void deleteSeat(Seat seat);
	
	public void deleteHall(Hall hall);
	
	public Hall inquireByName(String name);
}
