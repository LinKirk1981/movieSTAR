package com.iii.movie.msg.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


import com.iii.movie.msg.model.Forum;
import com.iii.movie.msg.model.Message;

public interface ForumR extends JpaRepository<Forum, Integer> {
	
	//顯示全部文章
	@Query(value = "Select * From Forum",nativeQuery = true)
	public List<Forum> findAll();
	
	//檢舉
	@Modifying
	@Query(value = "Update Forum set freport = ?2 where fid = ?1 ")
	public void forumReport(Integer fid,String freport);
	
	
	//查詢電影下的所有文章
	@Query(value ="Select * From Forum where fmovie = ?1 and fdel = 0 ORDER BY theme desc ,ftime desc ",nativeQuery = true)
	public List<Forum>selectMovieForum(String fmovie);
	
	//查詢單筆文章
	@Query(value ="Select * From Forum where fid = ?1",nativeQuery = true)
	public Forum showOneMsg(Integer fid);

	//後台刪除
	@Modifying
	@Query(value = "Update Forum set fdel = ?2 , article = ?3 where fid = ?1 ")
	public void delForum(Integer fid, Integer fdel, String article);
	
	
	//後台會員文章
	@Query(value = "Select * From Forum where fid = ?1",nativeQuery = true)
	public Forum showBackOne(Integer fid);

	//查詢會員文章
	@Query(value = "Select * From Forum where account = ?1",nativeQuery = true)
	public List<Forum> seeMyForum(String account);

	//聊天室
	@Query(value = "Select * From Forum where room = 1",nativeQuery = true)
	public List<Forum> findRoom();
	
	//離開聊天室
	@Modifying
	@Query(value = "Delete From Forum where room = 1",nativeQuery = true)
	public void delRoom();

	//後台查看檢舉
	@Query(value = "Select * From Forum where fid = ?1",nativeQuery = true)
	public Forum SeeReport(Integer fid);
	

}
