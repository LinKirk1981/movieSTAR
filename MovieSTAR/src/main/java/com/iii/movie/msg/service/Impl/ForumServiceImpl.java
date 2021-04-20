package com.iii.movie.msg.service.Impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.msg.model.Forum;
import com.iii.movie.msg.repository.ForumRepository;
import com.iii.movie.msg.service.ForumService;

@Transactional
@Service
public class ForumServiceImpl implements ForumService {
	@Autowired
	ForumRepository forumRepository; 
	
//	@Override
//	public void saveForum(Forum forum) {
//		forumRepository.saveForum(forum);
//
//	}
//
//	@Override
//	public List<Forum> findAllmvc() {
//		return forumRepository.findAllmvc();
//	}

}
