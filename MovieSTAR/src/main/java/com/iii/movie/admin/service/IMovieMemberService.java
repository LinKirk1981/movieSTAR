package com.iii.movie.admin.service;

import java.util.List;

import com.iii.movie.admin.model.IMovieMember;

public interface IMovieMemberService  {
	
boolean checkMemberByAccount(String account);
    
	void saveMember(IMovieMember imoviemember);
    
	List<IMovieMember> getAllMembers();
    
	IMovieMember getMemberByPk(Integer mempk);
    
	Integer deleteMember(Integer mempk);
    
	void editMember(IMovieMember member);

	public boolean checkLogin(IMovieMember imoviemember);

	public String getMemberbyaccountPassword(String account, String password);

	boolean googlecheckLogin(IMovieMember imoviemember);

	String getMemberbyaccountName(String account, String name);

	void googlesaveMember(IMovieMember member);

}
