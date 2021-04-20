package com.iii.movie.shopping.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class SeatNumber {
	@Id @Column(name = "SEAT_NUMBER_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seatNumberId;
	
	@Column(name = "SEAT_NUMBER")
	private Integer seatNumber;

	public Integer getSeatNumberId() {
		return seatNumberId;
	}

	public void setSeatNumberId(Integer seatNumberId) {
		this.seatNumberId = seatNumberId;
	}

	public Integer getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(Integer seatNumber) {
		this.seatNumber = seatNumber;
	}
	
	
}
