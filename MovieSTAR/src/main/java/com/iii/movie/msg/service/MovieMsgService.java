package com.iii.movie.msg.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.msg.model.Msgmovie;
import com.iii.movie.msg.repository.MovieMsgRepository;

@Service
@Transactional
public class MovieMsgService {
	@Autowired
	MovieMsgRepository movieMsgRepository;

	//新增電影留言
	public void save(Msgmovie msgmovie) {
		movieMsgRepository.save(msgmovie);
		
	}
	
//	//顯示電影留言
//	public List<Msgmovie> showMovieMsg(String mmovie) {
//		 return movieMsgRepository.showMovieMsg(mmovie);
//	}
//	
	//顯示電影留言+分頁
	public Page<Msgmovie> findByMmovie(String mmovie,Pageable pageable) {
			return movieMsgRepository.findByMmovie(mmovie,pageable);
	}
	
	
	//檢舉電影留言
	public void msgmovieReport(Msgmovie msgmovie) {
		movieMsgRepository.msgmovieReport(msgmovie.getMid(),msgmovie.getMreport());
		
	}
	
	//顯示電影最新留言
//	public List<Msgmovie> showNewTimeMsg(String mmovie) {
//		return movieMsgRepository.showNewTimeMsg(mmovie);
//	}
	
	
	//顯示電影最舊留言
//	public List<Msgmovie> showOldTimeMsg(String mmovie) {
//		return movieMsgRepository.showOldTimeMsg(mmovie);
//	}
	
	//顯示電影最低評分
//	public List<Msgmovie> showBadMsg(String mmovie) {
//		return movieMsgRepository.showBadMsg(mmovie);
//	}
	//顯示電影最高評分
//	public List<Msgmovie> showStarMsg(String mmovie) {
//		return movieMsgRepository.showStarMsg(mmovie);
//	}
	
	//顯示電影最高評分 +分頁
	public Page<Msgmovie> findByMmovieStar(String mmovie, Pageable pageable) {	
		return movieMsgRepository.findByMmovieOrderByMstarDesc(mmovie,pageable);
	}
	
	//顯示電影最新留言 +分頁
	public Page<Msgmovie> showNewTimeMsg(String mmovie, Pageable pageable) {
		return movieMsgRepository.findByMmovieOrderByMtimeDesc(mmovie,pageable);
	}
	
	//顯示電影最舊留言 +分頁
	public Page<Msgmovie> showOldTimeMsg(String mmovie, Pageable pageable) {
		return movieMsgRepository.findByMmovieOrderByMtime(mmovie,pageable);
	}
	
	//顯示電影最低評分 +分頁
	public Page<Msgmovie> showBadMsg(String mmovie, Pageable pageable) {
		return movieMsgRepository.findByMmovieOrderByMstar(mmovie,pageable);
	}
	
	
	
	
}
