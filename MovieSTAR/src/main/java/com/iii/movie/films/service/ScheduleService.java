package com.iii.movie.films.service;

import java.util.List;

import com.iii.movie.films.model.Schedule;

public interface ScheduleService {
	
	public void createSchedule(Schedule schedule) ;
	
	public void updateSchedule(Schedule schedule) ;
	
	public Schedule searchSchedule(Integer id) ;
	
	public void deleteSchedule(Integer id) ;
	
	public List<Schedule> AllSchedule();

}
