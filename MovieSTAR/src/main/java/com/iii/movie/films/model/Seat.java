package com.iii.movie.films.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Seat {
	
	@Id @Column(name = "seat_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seatId;
	@Column(name = "vacancy_id")
	private Integer vacancyId;
	private Integer status;
	
	public Seat() {
	}
	
	public Seat(Integer vacancyId, Integer retainedId, Integer status) {
		this.vacancyId = vacancyId;
		this.status = status;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSeatId() {
		return seatId;
	}

	public void setSeatId(Integer seatId) {
		this.seatId = seatId;
	}

	public Integer getVacancyId() {
		return vacancyId;
	}

	public void setVacancyId(Integer vacancyId) {
		this.vacancyId = vacancyId;
	}	
}
