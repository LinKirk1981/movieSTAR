package com.iii.movie.admin.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.admin.model.IMovieMember;
import com.iii.movie.admin.repository.IMovieMemberRepository;

@Transactional
@Service
public class IMovieMemberServiceImpl implements IMovieMemberService {
	
	@Autowired
	IMovieMemberRepository iMovieMemberRepository;
	
	@Override
	public boolean checkMemberByAccount(String account) {
		return iMovieMemberRepository.checkMemberByAccount(account);
	}
	

	@Override
	public void saveMember(IMovieMember member){
		iMovieMemberRepository.saveMember(member);
	}

	@Override
	public List<IMovieMember> getAllMembers() {
		return iMovieMemberRepository.getAllMembers();
	}
	
	@Override
	public IMovieMember getMemberByPk(Integer memPk) {
		return iMovieMemberRepository.getMemberByPk(memPk);
	}

	@Override
	public Integer deleteMember(Integer memPk) {
		return iMovieMemberRepository.deleteMember(memPk);
	}
	
	@Override
	public void editMember(IMovieMember member) {
		iMovieMemberRepository.editMember(member);
	}
	
	@Override
	public boolean checkLogin(IMovieMember iMovieMember) {
		return iMovieMemberRepository.checkLogin(iMovieMember);
	}


	@Override
	public String getMemberbyaccountPassword(String account, String passWord) {
		return iMovieMemberRepository.getMemberbyaccountPassword(account, passWord);
	}

	@Override
	public boolean googlecheckLogin(IMovieMember imoviemember) {
		return iMovieMemberRepository.googlecheckLogin(imoviemember);
	}

	@Override
	public String getMemberbyaccountName(String account, String name) {
		return iMovieMemberRepository.getMemberbyaccountName(account, name);
	}

	@Override
	public void googlesaveMember(IMovieMember imoviemember) {
		iMovieMemberRepository.googlesaveMember(imoviemember);
	}


//	@Override
//	public IMovieMember update(IMovieMember imoviemember) {
//		return iMovieMemberRepository.update(imoviemember);
//	}

}
