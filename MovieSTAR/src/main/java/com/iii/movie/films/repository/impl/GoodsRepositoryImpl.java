package com.iii.movie.films.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.films.model.Goods;
import com.iii.movie.films.repository.GoodsRepository;

@Repository
@Transactional
public class GoodsRepositoryImpl implements GoodsRepository {
	
	@Autowired
//	SessionFactory factory;
	EntityManager entityManager;

	@Override
	public Goods createGoods(Goods goods) {
		entityManager.persist(goods);
		return goods;
	}

	@Override
	public Goods updateGoods(Goods goods) {
		entityManager.merge(goods);
		return goods;
	}

	@Override
	public Goods findGoodsById(Integer goodsId) {
		return entityManager.getReference(Goods.class,goodsId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Goods> findAllGoods() {
		String hql ="From Goods";
		return entityManager.createQuery(hql).getResultList();
	}

}
