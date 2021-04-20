package com.iii.movie.films.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iii.movie.films.model.Hall;
import com.iii.movie.films.model.Seat;
import com.iii.movie.films.repository.ArrangeHallRepository;

@Repository
public class ArrangeHellImplRepository implements ArrangeHallRepository {

	@Autowired
	EntityManager entityManager;
	
	@Override
	public void insert(Hall hBean) {
		entityManager.persist(hBean);
	}

	@Override
	public Hall inquire(Integer hallId) {
		Hall hBean = entityManager.find(Hall.class, hallId);
		return hBean;
	}

	@Override
	public List<Hall> allInquire() {
		String hql = "from Hall";
		List<Hall> halls = entityManager.createQuery(hql, Hall.class).getResultList();
		return halls;
	}

	@Override
	public void setRetained(Hall hBean) {
		entityManager.merge(hBean);
	}

	@Override
	public void deleteSeat(Seat seat) {
		entityManager.remove(seat);
	}

	@Override
	public void deleteHall(Hall hall) {
		entityManager.remove(entityManager.merge(hall));
	}

	@Override
	public Hall inquireByName(String name) {
		String hql = "from Hall where hallName=:name";
		Hall hall =entityManager.createQuery(hql,Hall.class).setParameter("name", name).getSingleResult();
		return hall;
	}
	
	

}
