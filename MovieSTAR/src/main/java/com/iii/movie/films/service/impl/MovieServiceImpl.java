package com.iii.movie.films.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.movie.films.model.Movie;
import com.iii.movie.films.model.Schedule;
import com.iii.movie.films.repository.MovieDao;
import com.iii.movie.films.repository.ScheduleRepository;
import com.iii.movie.films.service.MovieService;

@Service
@Transactional
public class MovieServiceImpl implements MovieService{

	@Autowired
	MovieDao movieDao;
	ScheduleRepository scheduleRepository;
	
	@Override
	public boolean checkMovieId(Integer movieId) {
		
		return movieDao.checkMovieId(movieId);
	}

	@Override
	public Movie saveMovie(Movie movie) {
	    
		return movieDao.saveMovie(movie);
	}

	@Override
	public Movie updateMovie(Movie movie) {
	
		return movieDao.updateMovie(movie);
	}

	@Override
	public void deleteMovie(Integer movieId) {
		
		movieDao.deleteMovie(movieId);	
	}

	@Override
	public List<Movie> selectAll(Movie movie) {
		
		return movieDao.selectAll(movie);
	}

	@Override
	public Movie selectById(Integer movieId) {
		
		return movieDao.selectById(movieId);
	}

	@Override
	public void saveSchedule(Integer movieId,Schedule schedule) {
		
		movieDao.saveSchedule(movieId, schedule);
	}

	@Override
	public Movie selectByName(String name) {
		return movieDao.selectByName(name);
	}

	@Override
	public void saveScheduleByName(String movieName, Schedule schedule) {
		movieDao.saveScheduleByName(movieName, schedule);
	}

	@Override
	public List<Movie> selectComingSoonMovie() {
		
		return movieDao.selectComingSoonMovie();
	}

	@Override
	public List<Movie> selectMovieByType(String movietype) {
		
		return movieDao.selectMovieByType(movietype);
	}

	@Override
	public List<Movie> selectMovieLikeName(String moviename) {

		return movieDao.selectMovieLikeName(moviename);
	}
    
}
