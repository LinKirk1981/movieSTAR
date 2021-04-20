package com.iii.movie.films.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.films.model.TicketPrice;
import com.iii.movie.films.repository.TicketRepository;
@Repository
@Transactional
public class TicketRepositoryImpl implements TicketRepository {

	@Autowired
//	SessionFactory factory;
	EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TicketPrice> getAllTicketPrices() {
		String hql ="From TicketPrice";
		List<TicketPrice> tp = entityManager.createQuery(hql).getResultList();
		return tp;
	}

	@Override
	public TicketPrice getTicketPriceByVersion(String version) {
		String hql = "From TicketPrice where ticketVersion=:version";
		TicketPrice tp = entityManager.createQuery(hql,TicketPrice.class).setParameter("version", version).getSingleResult();
		return tp;
	}

}
