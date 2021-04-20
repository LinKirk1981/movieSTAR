package com.iii.movie.films.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.movie.films.model.Food;
import com.iii.movie.films.repository.FoodRepository;

@Service
public class FoodService {
	@Autowired
	private FoodRepository foodRepository;
	
	public Food insert(Food food) {
		return foodRepository.save(food);
	}
	
	public Food update(Food food) {
		return foodRepository.save(food);
	}
	
	public void deleteById(Integer id) {
		foodRepository.deleteById(id);
	}
	
	public Food findById(Integer id) {
		Optional<Food> foodOptional = foodRepository.findById(id);
		return foodOptional.get();
	}
	
	public List<Food> findAll(){
		return foodRepository.findAll();
	}
}
