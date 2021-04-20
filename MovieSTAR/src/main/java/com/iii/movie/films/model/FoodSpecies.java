package com.iii.movie.films.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class FoodSpecies {
	
	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "FOOD_SPECIES")
	private String foodSpecies;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFoodSpecies() {
		return foodSpecies;
	}

	public void setFoodSpecies(String foodSpecies) {
		this.foodSpecies = foodSpecies;
	}

}
