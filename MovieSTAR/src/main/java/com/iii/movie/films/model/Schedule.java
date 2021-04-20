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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Component
@Table(name = "Schedule")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"}) 
public class Schedule {

	@Id
	@Column(name = "SCHEDULE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer schedule_id;
	
//	private String movieName;
//	private String hallName;
//	private String version;
	
	@Column(name = "MOVIE_DATE",columnDefinition = "date")
	private String date;
	@Column(name = "TIME")
	private String time;
	
	@ManyToOne
	@JoinColumn(name = "fk_movie_id")
	private Movie movie;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_Hall_id")
	private Hall hall;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_ticket_id")
	private TicketPrice ticketPrice;
	
	
//	public String getMovieName() {
//		return movieName;
//	}
//
//	public void setMovieName(String movieName) {
//		this.movieName = movieName;
//	}
//
//	public String getHallName() {
//		return hallName;
//	}
//
//	public void setHallName(String hallName) {
//		this.hallName = hallName;
//	}
//
//	public String getVersion() {
//		return version;
//	}
//
//	public void setVersion(String version) {
//		this.version = version;
//	}

	public Schedule(String date, String time) {
		super();
		this.date = date;
		this.time = time;
	}


	
	
	
//	public Schedule(String movieName, String hallName, String version, String date, String time) {
//		this.movieName = movieName;
//		this.hallName = hallName;
//		this.version = version;
//		this.date = date;
//		this.time = time;
//	}

	public Schedule() {
		
	}

//	public Schedule(Integer schedule_id, Movie movie, Hall hall, String date, String time, TicketPrice ticketPrice) {
//		this.schedule_id = schedule_id;
//		this.movie = movie;
//		this.hall = hall;
//		this.date = date;
//		this.time = time;
//		this.ticketPrice = ticketPrice;
//	}

	public Integer getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(Integer schedule_id) {
		this.schedule_id = schedule_id;
	}

	public Movie getMovie() {
		return movie;
	}

	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	public Hall getHall() {
		return hall;
	}

	public void setHall(Hall hall) {
		this.hall = hall;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public TicketPrice getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(TicketPrice ticketPrice) {
		this.ticketPrice = ticketPrice;
	}





	@Override
	public String toString() {
		return "行程編號=" + schedule_id + ",日期=" + date + ", 時間=" + time 
				+ ",影廳=" + hall.getHallName()+""+ ", 版本="+ ticketPrice.getTicketVersion() + "";
	}
	
	
	
	
}
