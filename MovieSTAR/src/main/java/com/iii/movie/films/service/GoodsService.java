package com.iii.movie.films.service;

import java.util.List;

import com.iii.movie.films.model.Goods;

public interface GoodsService {

	public Goods createGoods(Goods goods);
	
	public Goods updateGoods(Goods goods);
	
	public Goods findGoodsById(Integer goodsId);
	
	public List<Goods> findAllGoods();
}
