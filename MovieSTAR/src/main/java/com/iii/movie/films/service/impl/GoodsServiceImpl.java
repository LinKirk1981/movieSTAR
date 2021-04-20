package com.iii.movie.films.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.films.model.Goods;
import com.iii.movie.films.repository.GoodsRepository;
import com.iii.movie.films.service.GoodsService;
@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsRepository goodsRepository;
	@Override
	public Goods createGoods(Goods goods) {
		return goodsRepository.createGoods(goods);
	}

	@Override
	public Goods updateGoods(Goods goods) {
		
		return goodsRepository.updateGoods(goods);
	}

	@Override
	public Goods findGoodsById(Integer goodsId) {

		return goodsRepository.findGoodsById(goodsId);
	}

	@Override
	public List<Goods> findAllGoods() {

		return goodsRepository.findAllGoods();
	}

}
