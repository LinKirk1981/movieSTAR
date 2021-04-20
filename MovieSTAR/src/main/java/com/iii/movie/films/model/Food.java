package com.iii.movie.films.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "Food")
public class Food {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "FOODID")
	private Integer foodid;
	@Column(name = "FOODNAME")
	private String foodname;
	@Column(name = "FOODIMAGE",columnDefinition = "varbinary(MAX)")
	private byte[] foodimage;
	@Column(name = "FOODPRICE")
	private Integer foodprice;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_FOOD_SPECIES_ID")
	private FoodSpecies foodSpecies;
	
	
	public FoodSpecies getFoodSpecies() {
		return foodSpecies;
	}




	public void setFoodSpecies(FoodSpecies foodSpecies) {
		this.foodSpecies = foodSpecies;
	}




	public Food() {
		
	}


	
	
	public Food(String foodname, byte[] foodimage, Integer foodprice) {
		
		this.foodname = foodname;
		this.foodimage = foodimage;
		this.foodprice = foodprice;
	}




	public Integer getFoodid() {
		return foodid;
	}


	public void setFoodid(Integer foodid) {
		this.foodid = foodid;
	}


	public String getFoodname() {
		return foodname;
	}


	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}


	public byte[] getFoodimage() {
		return foodimage;
	}


	public void setFoodimage(byte[] foodimage) {
		this.foodimage = foodimage;
	}


	public Integer getFoodprice() {
		return foodprice;
	}


	public void setFoodprice(Integer foodprice) {
		this.foodprice = foodprice;
	}

	
	
	
	
}
