package com.iii.movie.msg.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.movie.msg.model.Message;
import com.iii.movie.msg.repository.MessageR;

@Service
@Transactional
public class MessageS {
	@Autowired 
	MessageR messageR;
	
	public List<Message> seeMyMessage(Integer fk) {
		return messageR.seeMyMessage(fk);
	}

	public void reportMessage(Integer mid, Message message) {
		messageR.reportMessage(mid,message.getMcontent(),message.getMtime(),message.getBlockade());
		
	}
}
