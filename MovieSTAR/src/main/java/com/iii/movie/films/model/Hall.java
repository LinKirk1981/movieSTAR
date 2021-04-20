package com.iii.movie.films.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

@Entity
public class Hall {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "hall_id")
	private Integer hallId;
	@Column(name = "hall_name")
	private String hallName;
	private String specification;
	private Integer row;
	@Column(name = "area_A")
	private Integer areaA;
	@Column(name = "area_B")
	private Integer areaB;
	@Column(name = "area_C")
	private Integer areaC;
	private Integer total;
	@Transient
	private List<Integer> vacancyIds;
	
	@OneToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_hallId")
	private List<Seat> seats = new ArrayList<>();
	
	public Hall() {
	}

	public List<Integer> getVacancyIds() {
		return vacancyIds;
	}

	public void setVacancyIds(List<Integer> vacancyIds) {
		this.vacancyIds = vacancyIds;
	}

	public Integer getHallId() {
		return hallId;
	}

	public void setHallId(Integer hallId) {
		this.hallId = hallId;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public Integer getRow() {
		return row;
	}

	public void setRow(Integer row) {
		this.row = row;
	}

	public Integer getAreaA() {
		return areaA;
	}

	public void setAreaA(Integer areaA) {
		this.areaA = areaA;
	}

	public Integer getAreaB() {
		return areaB;
	}

	public void setAreaB(Integer areaB) {
		this.areaB = areaB;
	}

	public Integer getAreaC() {
		return areaC;
	}

	public void setAreaC(Integer areaC) {
		this.areaC = areaC;
	}

	public List<Seat> getSeats() {
		return seats;
	}

	public void setSeats(List<Seat> seats) {
		this.seats = seats;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
	
}
