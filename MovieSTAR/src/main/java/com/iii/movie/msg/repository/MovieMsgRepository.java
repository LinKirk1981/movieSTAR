package com.iii.movie.msg.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iii.movie.msg.model.Msgmovie;

public interface MovieMsgRepository extends JpaRepository<Msgmovie,Integer> {

	//顯示電影留言
	@Query(value ="Select * From Msgmovie where mmovie = ?1 ",nativeQuery = true)
	List<Msgmovie> showMovieMsg(String mmovie);

	//檢舉電影留言
	@Modifying
	@Query(value = "Update Msgmovie set mreport =?2 where mid =?1 ")
	void msgmovieReport(Integer mid, String mreport);

	//顯示電影最新留言
//	@Query(value ="Select * From Msgmovie where mmovie = ?1 order by mtime desc",nativeQuery = true)
//	List<Msgmovie> showNewTimeMsg(String mmovie);

	//顯示電影最舊留言
//	@Query(value ="Select * From Msgmovie where mmovie = ?1 order by mtime ",nativeQuery = true)
//	List<Msgmovie> showOldTimeMsg(String mmovie);

	//顯示電影最高評分
//	@Query(value ="Select * From Msgmovie where mmovie = ?1 order by mStar desc",nativeQuery = true)
//	List<Msgmovie> showStarMsg(String mmovie);

	//顯示電影最低評分
	@Query(value ="Select * From Msgmovie where mmovie = ?1 order by mStar",nativeQuery = true)
	List<Msgmovie> showBadMsg(String mmovie);
	
	//顯示留言+分頁-----------------------------------
	Page<Msgmovie> findByMmovie(String mmovie,Pageable pageable);
	
	//顯示電影最高評分
	Page<Msgmovie> findByMmovieOrderByMstarDesc(String mmovie,Pageable pageable);
	
	//顯示電影最新留言
	Page<Msgmovie> findByMmovieOrderByMtimeDesc(String mmovie, Pageable pageable);

	//顯示電影最舊留言
	Page<Msgmovie> findByMmovieOrderByMtime(String mmovie, Pageable pageable);

	//顯示電影最低評分
	Page<Msgmovie> findByMmovieOrderByMstar(String mmovie, Pageable pageable);
	
	
}
