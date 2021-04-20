package com.iii.movie.films.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.films.model.Hall;
import com.iii.movie.films.model.Movie;
import com.iii.movie.films.model.Schedule;
import com.iii.movie.films.repository.ArrangeHallRepository;
import com.iii.movie.films.repository.ScheduleRepository;
import com.iii.movie.films.repository.impl.MovieDaoImpl;
import com.iii.movie.films.service.ScheduleService;

@Service
@Transactional
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	ScheduleRepository scheduleRepository;
	MovieDaoImpl movieDaoImpl;
	ArrangeHallRepository arrangeHallRepository;

	@Override
	public void createSchedule(Schedule schedule) {

		scheduleRepository.createSchedule(schedule);

	}

	@Override
	public void updateSchedule(Schedule schedule) {
		scheduleRepository.updateSchedule(schedule);

	}

	@Override
	public Schedule searchSchedule(Integer id) {
		return scheduleRepository.searchSchedule(id);
	}

	@Override
	public void deleteSchedule(Integer id) {
		
		scheduleRepository.deleteSchedule(id);

	}

	@Override
	public List<Schedule> AllSchedule() {
		
		return scheduleRepository.AllSchedule();
	}

}
