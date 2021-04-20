package com.iii.movie.admin.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii.movie.admin.UserNotFoundException;
import com.iii.movie.admin.model.IMovieMember;




@Service
@Transactional
public class IMovieMemberJpaService {
	
	@Autowired
	private IMovieMemberJpaImpl iMovieMemberJpaImpl;
	
	public IMovieMember getByName(String name) {
		IMovieMember uRep = iMovieMemberJpaImpl.findByName(name);
		System.out.println("===IMovieMember getByName(String name):====" + uRep.getName());		
		
		if(uRep.getName()==null) {
			throw new UserNotFoundException("找不到使用者");
		}
		
		return uRep;
	}
	
	public IMovieMember createIMovieMember(IMovieMember iMovieMember) {
		return iMovieMemberJpaImpl.save(iMovieMember);
	}
	
	
	public IMovieMember findByAccount(String account) {
		return iMovieMemberJpaImpl.findByAccount(account);
	};
	
	public List<IMovieMember> findByStatus() {
		return iMovieMemberJpaImpl.findByStatusNotNull();
	};
	
	public List<IMovieMember> findByAccount() {
		return iMovieMemberJpaImpl.findByAccountNotNull();
	};
	
	
}
