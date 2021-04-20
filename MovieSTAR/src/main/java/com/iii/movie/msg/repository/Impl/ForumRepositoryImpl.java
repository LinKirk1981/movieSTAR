package com.iii.movie.msg.repository.Impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.msg.model.Forum;
import com.iii.movie.msg.repository.ForumRepository;

@Repository
@Transactional
public class ForumRepositoryImpl implements ForumRepository {
	@Autowired
	EntityManager entityManager;
	
	//新增文章
//	@Override
//	public void saveForum(Forum forum) {
//		entityManager.persist(forum);
//
//	}
//	
	//查詢所有文章
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<Forum> findAllmvc() {
//		String hql = "from Forum";
//		List<Forum> list = entityManager.createQuery(hql).getResultList();
//		return list;
//	}

}
