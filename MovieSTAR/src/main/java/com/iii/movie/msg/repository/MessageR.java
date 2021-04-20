package com.iii.movie.msg.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.iii.movie.msg.model.Message;

public interface MessageR extends JpaRepository<Message, Integer> {

	
	//查詢會員留言
	@Query(value = "Select * From Message where fk_msg = ?1",nativeQuery = true)
	public List<Message> seeMyMessage(Integer fk);
	
	//刪除留言
	@Modifying
	@Query(value = "Update Message set mcontent = ?2,mtime = ?3,blockade = ?4 where mid = ?1 ")
	public void reportMessage(Integer mid,  String mcontent, String mtime, String blockade);

}
