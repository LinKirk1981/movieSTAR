package com.iii.movie.films.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iii.movie.films.model.Food;

public interface FoodRepository extends JpaRepository<Food, Integer> {
	
}
