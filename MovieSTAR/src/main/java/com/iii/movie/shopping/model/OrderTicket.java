package com.iii.movie.shopping.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.stereotype.Component;

import com.iii.movie.admin.model.IMovieMember;
import com.iii.movie.films.model.Schedule;


@Entity
@Component
public class OrderTicket {
	
	@Id @Column(name = "TICKET_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ticketId;
	
	@Column(name = "TICKET_MONEY")
	private Integer ticketMoney;
	
	@Column(name = "RECEIVE")
	private Integer receive;
	
	@Column(name = "TRANSACTION_NUMBER")
	private String transactionNumber;
	
	@Column(name = "BUY_DATE",columnDefinition = "dateTime")
	private String buyDate;
	
	@Column(name = "ORDER_STATUS")
	private Integer orderStatus;
	
	@Column(name = "APPLY")
	private Integer apply;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_SCHEDULES_ID")
	private Schedule schedules;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_TICKET_ID")
	private List<SeatNumber> seatNumbers = new ArrayList<>();
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_TICKET_ID")
	private List<OrderFood> orderFoods = new ArrayList<>();

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_TICKET_ID")
	private List<TicketQuantity> ticketQuantities = new ArrayList<>();

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_mem_pk")
	private IMovieMember member;
	
	public Integer getTicketId() {
		return ticketId;
	}

	public void setTicketId(Integer ticketId) {
		this.ticketId = ticketId;
	}

	public List<OrderFood> getOrderFoods() {
		return orderFoods;
	}

	public void setOrderFoods(List<OrderFood> orderFoods) {
		this.orderFoods = orderFoods;
	}

	public Integer getTicketMoney() {
		return ticketMoney;
	}

	public void setTicketMoney(Integer ticketMoney) {
		this.ticketMoney = ticketMoney;
	}

	public Integer getReceive() {
		return receive;
	}

	public void setReceive(Integer receive) {
		this.receive = receive;
	}

	public Schedule getSchedules() {
		return schedules;
	}

	public void setSchedules(Schedule schedules) {
		this.schedules = schedules;
	}

	public List<SeatNumber> getSeatNumbers() {
		return seatNumbers;
	}

	public String getTransactionNumber() {
		return transactionNumber;
	}

	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}

	public void setSeatNumbers(List<SeatNumber> seatNumbers) {
		this.seatNumbers = seatNumbers;
	}

	public List<TicketQuantity> getTicketQuantities() {
		return ticketQuantities;
	}

	public void setTicketQuantities(List<TicketQuantity> ticketQuantities) {
		this.ticketQuantities = ticketQuantities;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getApply() {
		return apply;
	}

	public void setApply(Integer apply) {
		this.apply = apply;
	}

	public IMovieMember getMember() {
		return member;
	}

	public void setMember(IMovieMember member) {
		this.member = member;
	}


}
