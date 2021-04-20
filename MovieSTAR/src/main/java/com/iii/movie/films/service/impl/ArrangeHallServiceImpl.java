package com.iii.movie.films.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.iii.movie.films.model.Hall;
import com.iii.movie.films.model.Seat;
import com.iii.movie.films.repository.ArrangeHallRepository;
import com.iii.movie.films.service.ArrangeHallService;

@Service
@Transactional
public class ArrangeHallServiceImpl implements ArrangeHallService {

	@Autowired
	private ArrangeHallRepository arrangeHallRepository;

	@Override
	public void insert(Hall hBean) {
		
		List<Seat> seats = new ArrayList<>();
		List<Integer> vacancyIds = hBean.getVacancyIds();

		for (Integer integer : vacancyIds) {
			Seat seat = new Seat();
			seat.setVacancyId(integer);
			seat.setStatus(1);
			seats.add(seat);
		}
		hBean.setSeats(seats);
		arrangeHallRepository.insert(hBean);
	}

	@Override
	public Hall inquire(Integer hallId) {
		return arrangeHallRepository.inquire(hallId);
	}

	@Override
	public List<Hall> allInquire() {
		return arrangeHallRepository.allInquire();
	}

	@Override
	public void setRetained(Hall hBean) {
		Hall hBean2 = arrangeHallRepository.inquire(hBean.getHallId());		
		List<Seat> newSeats = new ArrayList<Seat>();
		List<Seat> seats = hBean2.getSeats();
		List<Integer> vacancyIds = hBean.getVacancyIds();
		
		for (Seat seat : seats) {
			if(seat.getStatus()!=2) {
				newSeats.add(seat);
			}else if(seat.getStatus()==2) {				
				arrangeHallRepository.deleteSeat(seat);
			}
		}
		
		for (Integer integer : vacancyIds) {
			Seat seat = new Seat();
			seat.setVacancyId(integer);
			seat.setStatus(2);
			newSeats.add(seat);
		}
		hBean2.setSeats(newSeats);
		arrangeHallRepository.setRetained(hBean2);
	}

	@Override
	public void modifyHall(Hall hBean) {
		Hall hBean2 = arrangeHallRepository.inquire(hBean.getHallId());		
		List<Seat> newSeats = new ArrayList<Seat>();
		List<Seat> seats = hBean2.getSeats();
		List<Integer> vacancyIds = hBean.getVacancyIds();
		Integer count = 0;
		
		for (Seat seat : seats) {
			if(seat.getStatus()!=1) {
				newSeats.add(seat);
			}else if(seat.getStatus()==1) {
				count += 1;
				arrangeHallRepository.deleteSeat(seat);
			}
		}
		
		for (Integer integer : vacancyIds) {
			Seat seat = new Seat();
			seat.setVacancyId(integer);
			seat.setStatus(1);
			newSeats.add(seat);
		}
		hBean2.setTotal(hBean2.getTotal()+count-vacancyIds.size());
		hBean2.setSeats(newSeats);
		arrangeHallRepository.setRetained(hBean2);
	}

	@Override
	public void deleteHall(Hall hBean) {
		arrangeHallRepository.deleteHall(hBean);
	}

	@Override
	public Hall inquireByName(String name) {
		return arrangeHallRepository.inquireByName(name);
	}

}
