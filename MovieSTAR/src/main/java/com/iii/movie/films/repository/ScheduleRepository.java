package com.iii.movie.films.repository;

import java.util.List;

import com.iii.movie.films.model.Schedule;

public interface ScheduleRepository {

	public void createSchedule(Schedule schedule) ;
	
	public void updateSchedule(Schedule schedule) ;
	
	public Schedule searchSchedule(Integer id) ;
	
	public Schedule searchScheduleByMovieId(Integer movieId);
	
	public void deleteSchedule(Integer id) ;
	
	public List<Schedule> AllSchedule();

	
	
}
