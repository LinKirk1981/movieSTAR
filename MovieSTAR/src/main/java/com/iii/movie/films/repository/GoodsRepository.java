package com.iii.movie.films.repository;

import java.util.List;

import com.iii.movie.films.model.Goods;



public interface GoodsRepository {

	public Goods createGoods(Goods goods);
	
	public Goods updateGoods(Goods goods);
	
	public Goods findGoodsById(Integer goodsId);
	
	public List<Goods> findAllGoods();
}
