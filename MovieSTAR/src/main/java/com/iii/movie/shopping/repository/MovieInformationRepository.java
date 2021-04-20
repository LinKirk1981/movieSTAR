package com.iii.movie.shopping.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.iii.movie.films.model.Movie;

public interface MovieInformationRepository extends JpaRepository<Movie, Integer> {

	public Page<Movie> findByMovieState(Integer state, Pageable pageable);
	
	public List<Movie> findByMovieName(String movieName);
	
	public List<Movie> findByMovieState(Integer state);
}
