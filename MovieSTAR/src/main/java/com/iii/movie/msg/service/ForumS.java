package com.iii.movie.msg.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.iii.movie.msg.model.Forum;
import com.iii.movie.msg.model.Message;
import com.iii.movie.msg.repository.ForumR;

@Service
@Transactional
public class ForumS {
	@Autowired 
	ForumR forumR;
	
	@Autowired
	EntityManager entityManager;
	
	//顯示全部文章
	public List<Forum> findAll() {
		return forumR.findAll();
	}
	
	//新增
	public void saveForum(Forum forum) {
		forumR.save(forum);
	}
	
	//檢舉
	public void forumReport(Forum forum) {
		forumR.forumReport(forum.getFid(),forum.getFreport());
		
	}
	
	//紀錄回覆	
	public Forum recordPrestige(Forum Forum, Integer prestige) {
		System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx我是回覆次數xxxxxxxxxxxxxxxxxxxxxxxx");
		prestige = Forum.getMsg().size();
		Forum.setPrestige(prestige);
		return forumR.saveAndFlush(Forum);

	}
	
	
	
	//查詢電影下的所有文章
	public List<Forum> selectMovieForum(Forum forum) {
		return forumR.selectMovieForum(forum.getFmovie());
	}
	
	//查詢單筆文章
	public Forum showOneMsg(Integer fid) {
		return forumR.showOneMsg(fid);
		
	}
	
	//新增留言
	public void saveMsg(Integer fid,Message msg) {
		Forum fm = entityManager.find(Forum.class,fid);
		fm.getMsg().add(msg);
		entityManager.merge(fm);
	}
	
	//顯示多筆留言
	public Forum findMessage(Integer fid) {
		Forum fm = entityManager.find(Forum.class, fid);
		return fm;
	}
	
	
	public void delForum(Integer fid, Forum forum) {
		forumR.delForum(fid,forum.getFdel(),forum.getArticle());
		
	}

	public Forum showBackOne(Integer fid) {
		return forumR.showBackOne(fid);
	}

	public List<Forum> seeMyForum(String account) {
		return forumR.seeMyForum(account);
	}

	public List<Forum> findRoom() {
		return forumR.findRoom();
	}

	public void delRoom() {
		forumR.delRoom();
		
	}

	public Forum SeeReport(Integer fid) {
		return forumR.SeeReport(fid);
		
	}

	


}
