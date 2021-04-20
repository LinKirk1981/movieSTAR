package com.iii.movie.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.movie.films.model.Movie;
import com.iii.movie.films.model.Schedule;
public interface SchedulesInformationRepository extends JpaRepository<Schedule, Integer> {
	
	public List<Schedule> findByMovieAndDateAndTime(Movie movie, String date, String time);
}
