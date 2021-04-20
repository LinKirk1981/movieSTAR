package com.iii.movie.films.service;

import java.util.List;

import com.iii.movie.films.model.Hall;

public interface ArrangeHallService {
	
	public void insert(Hall hBean);
	
	public Hall inquire(Integer hallId);
	
	public List<Hall> allInquire();
	
	public void setRetained(Hall hBean);
	
	public void modifyHall(Hall hBean);
	
	public void deleteHall(Hall hBean);

	public Hall inquireByName(String name);
}
