package com.iii.movie.films.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="TicketAndPrice")
public class TicketPrice {

	@Id
	@Column(name = "TICKET_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ticketId;
	@Column(name = "TICKET_VERSION")
	private String ticketVersion;
	@Column(name = "TICKET_PRICE")
	private Integer ticketPrice;
	
	public TicketPrice() {
		
	}

	
	
	public TicketPrice(Integer ticketId, String ticketVersion, Integer ticketPrice) {
		super();
		this.ticketId = ticketId;
		this.ticketVersion = ticketVersion;
		this.ticketPrice = ticketPrice;
	}



	public Integer getTicketId() {
		return ticketId;
	}

	public void setTicketId(Integer ticketId) {
		this.ticketId = ticketId;
	}

	public String getTicketVersion() {
		return ticketVersion;
	}

	public void setTicketVersion(String ticketVersion) {
		this.ticketVersion = ticketVersion;
	}

	public Integer getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(Integer ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	
	
	
}
