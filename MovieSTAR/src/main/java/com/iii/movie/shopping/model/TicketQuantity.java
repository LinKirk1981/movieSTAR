package com.iii.movie.shopping.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class TicketQuantity {
	
	@Id	@Column(name = "TICKET_QUANTITY_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ticketQuantityId;
	
	@Column(name = "TICKET_SPECIES")
	private String ticketSpecies;
	
	@Column(name = "TICKET_QUANTITY")
	private Integer ticketQuantity;

	public Integer getTicketQuantityId() {
		return ticketQuantityId;
	}

	public void setTicketQuantityId(Integer ticketQuantityId) {
		this.ticketQuantityId = ticketQuantityId;
	}

	public String getTicketSpecies() {
		return ticketSpecies;
	}

	public void setTicketSpecies(String ticketSpecies) {
		this.ticketSpecies = ticketSpecies;
	}

	public Integer getTicketQuantity() {
		return ticketQuantity;
	}

	public void setTicketQuantity(Integer ticketQuantity) {
		this.ticketQuantity = ticketQuantity;
	}
	
	
}
