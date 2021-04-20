package com.iii.movie.films.repository.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii.movie.films.model.Movie;
import com.iii.movie.films.model.Schedule;
import com.iii.movie.films.repository.MovieDao;

@Repository("MovieDao")
@Transactional
public class MovieDaoImpl implements  MovieDao{

	@Autowired
//	private SessionFactory sessionFactory;
//	private Session session;
	EntityManager entityManager;
	List<Movie> movieList = null;
	
	
	@Override
	public Movie saveMovie(Movie movie) {
		if(checkMovieId(movie.getMovieId())) {
			throw new RuntimeException("編號重複,無法新增");
		}
		entityManager.persist(movie);
		return movie;
	}

	@Override
	public void saveSchedule(Integer movieId,Schedule schedule) {
//		session = sessionFactory.getCurrentSession();
		Movie movie =entityManager.find(Movie.class, movieId);
		//System.out.println(movie.getMovieName());
		
		//schedule.setMovie(movie);
		
		List<Schedule> schedules = movie.getSchedules();
		schedules.add(schedule);
		System.out.println(schedules);
		movie.setSchedules(schedules);
		
		System.out.println(movie.getSchedules().get(0).getTime());
		
		entityManager.merge(movie);
	}
	
	@Override
	public Movie updateMovie(Movie movie) {
		entityManager.merge(movie);
		return movie;
	}


	@Override
	public void deleteMovie(Integer movieId) {
		Movie movie = (Movie) entityManager.getReference(Movie.class,movieId);
		if(movie!=null) {
		entityManager.remove(movie);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Movie> selectAll(Movie movie) {
		List<Movie> mv= null;
		String hql = "From Movie";

		mv=entityManager.createQuery(hql).getResultList();
		return mv;
	}

	@Override
	public Movie selectById(Integer movieId) {
		Movie movie=null;
		movie=entityManager.getReference(Movie.class,movieId);
		return movie;
		 
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkMovieId(Integer movieId) {
		boolean exist = false;
		String hql = "From Movie where movie_id=:mid";
		List<Movie> movie =entityManager.createQuery(hql).setParameter("mid", movieId).getResultList();
		if (movie.isEmpty()) {
			exist = false;
		}else {
			exist=true;
		}
		return exist;
	}

	@Override
	public Movie selectByName(String name) {
		String hql = "From Movie where movieName=:name";
		Movie mv = entityManager.createQuery(hql,Movie.class).setParameter("name", name).getSingleResult();
		return mv;
	}

	@Override
	public void saveScheduleByName(String movieName,Schedule schedule) {
		String hql = "From Movie where movieName=:name";
		Movie movie =entityManager.createQuery(hql,Movie.class).setParameter("name", movieName).getSingleResult();
		//System.out.println(movie.getMovieName());
		
		//schedule.setMovie(movie);
		
		List<Schedule> schedules = movie.getSchedules();
		schedules.add(schedule);
		System.out.println(schedules);
		movie.setSchedules(schedules);
		
		System.out.println(movie.getSchedules().get(0).getTime());
		
		entityManager.merge(movie);
	}

	//即將上映電影
	@SuppressWarnings("unchecked")
	@Override
	public List<Movie> selectComingSoonMovie() {
		String hql ="From Movie m where m.movieDate >: md";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String parameter = sdf.format(date.getTime());
		List <Movie> movie = entityManager.createQuery(hql).setParameter("md", parameter).getResultList();
		return movie;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Movie> selectMovieByType(String movietype) {
		String hql = "From Movie where movieType like :mt";
		List<Movie> movie =entityManager.createQuery(hql).setParameter("mt","%"+movietype+"%").getResultList();
		return movie;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Movie> selectMovieLikeName(String moviename) {
		String hql = "From Movie where movieName like :name";
		List<Movie> movie =entityManager.createQuery(hql).setParameter("name","%"+moviename+"%").getResultList();
		return movie;
	}
	

}
