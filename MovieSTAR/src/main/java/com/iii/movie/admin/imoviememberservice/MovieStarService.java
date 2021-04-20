package com.iii.movie.admin.imoviememberservice;

import java.util.List;

import com.iii.movie.admin.model.IMovieMember;

public interface MovieStarService {
	
	IMovieMember findById(Integer mempk);
	
	IMovieMember findByAccountOrName(String accountOrName);

	List<IMovieMember> findAll();

	IMovieMember create(IMovieMember imoviemember);

	IMovieMember update(IMovieMember imoviemember);

	void delete(int mempk);

	IMovieMember register(IMovieMember imoviemember);

	IMovieMember create2(IMovieMember imoviemember);

	boolean findByMempk(Integer mempk);
	
	public boolean checkMemId(String memberid);

	public void save(IMovieMember imoviemember);

	public void updateStatus(String account);

	public boolean checkFirst();

	IMovieMember getBaseData(String account);
	
	public IMovieMember forgetPassword(String account, String password);

}
