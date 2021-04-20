package com.iii.movie.films.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.films.model.Schedule;
import com.iii.movie.films.repository.ScheduleRepository;

@Repository
@Transactional
public class ScheduleRepositoryImpl implements ScheduleRepository {

	@Autowired
//	SessionFactory factory;
	EntityManager entityManager;
	@Override
	public void createSchedule(Schedule schedule) {
		entityManager.persist(schedule);
	}

	@Override
	public void updateSchedule(Schedule schedule) {
		entityManager.merge(schedule);
	}

	@Override
	public Schedule searchSchedule(Integer id) {
		Schedule schedule = entityManager.getReference(Schedule.class, id);
		return schedule;
	}

	@Override
	public void deleteSchedule(Integer id) {
        Schedule schedule = entityManager.getReference(Schedule.class, id);
        //關聯性table先刪除才能進行刪除行程
        schedule.getMovie().getSchedules().remove(schedule);
        schedule.setHall(null);
        schedule.setTicketPrice(null);
        schedule.setMovie(null);
        entityManager.remove(schedule);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Schedule> AllSchedule() {
		String hql = "From Schedule";
		return entityManager.createQuery(hql).getResultList();
	}

	@Override
	public Schedule searchScheduleByMovieId(Integer movieId) {
		Schedule schedule = entityManager.getReference(Schedule.class,movieId);
		return schedule;
	}

}
