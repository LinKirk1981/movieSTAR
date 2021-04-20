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
@Table(name = "Goods")
public class Goods {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "GOODSID")
	private Integer goodsId;
	@Column(name = "GOODSNAME")
	private String goodsName;
	@Column(name = "GOODSPRICE")
	private Integer goodsPrice;
	
	
	public Goods() {
		super();
	}

	public Goods(String goodsName, Integer goodsPrice) {
		super();
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
	}
	
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Integer goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	
	
}
