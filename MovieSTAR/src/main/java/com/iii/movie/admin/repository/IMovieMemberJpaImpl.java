package com.iii.movie.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.iii.movie.admin.model.IMovieMember;


public interface IMovieMemberJpaImpl extends JpaRepository<IMovieMember, Integer>{
	

	IMovieMember findByMempk(Integer mempk);
	
	IMovieMember findByAccount(String account);

	IMovieMember findByName(String name);

	IMovieMember getIMovieMemberByNameOrAccount(String name, String account);

	List<IMovieMember> getIMovieMembersByNameOrAccount(String name, String account);
	
	void delete(IMovieMember imoviemember);

	public List<IMovieMember> findByStatusNotNull();

	public List<IMovieMember> findByAccountNotNull();

}
