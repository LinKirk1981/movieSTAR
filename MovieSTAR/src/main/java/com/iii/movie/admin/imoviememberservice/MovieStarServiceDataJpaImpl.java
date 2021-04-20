package com.iii.movie.admin.imoviememberservice;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.admin.model.IMovieMember;
import com.iii.movie.admin.model.Role;
import com.iii.movie.admin.repository.IMovieMemberJpaImpl;
import com.iii.movie.admin.repository.RoleRepository;

@Service
@Transactional
public class MovieStarServiceDataJpaImpl implements MovieStarService {
	
	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	IMovieMemberJpaImpl userRepository;

	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	EntityManager entityManager;


	@Override
	public IMovieMember findById(Integer mempk) {
		return userRepository.findById(mempk).get();
	}

	@Override
	public List<IMovieMember> findAll() {
		return userRepository.findAll();
	}

	@Override
	public IMovieMember create(IMovieMember imoviemember) {
		imoviemember.setPassword(passwordEncoder.encode(imoviemember.getPassword()));
		return userRepository.save(imoviemember);
	}
	
	@Override
	public IMovieMember create2(IMovieMember imoviemember) {
		imoviemember.setPassword(imoviemember.getPassword());
		return userRepository.saveAndFlush(imoviemember);
	}

	@Override
	public IMovieMember update(IMovieMember imoviemember) {
		System.out.println("========MovieStarServiceDataJpaImpl"+imoviemember);
		IMovieMember u = userRepository.findById(imoviemember.getMempk()).get();
		System.out.println("====IMovieMember u ====== "+u);
		imoviemember.setRoles(u.getRoles());
		if (!imoviemember.getPassword().startsWith("$2a$")) {
			imoviemember.setPassword(passwordEncoder.encode(imoviemember.getPassword()));
		}
		System.out.println("====IMovieMember u ====== "+imoviemember);
		return userRepository.save(imoviemember);
	}

	@Override
	@Transactional
	public void delete(int mempk) {
		userRepository.deleteById(mempk);
	}

	@Override
	@Transactional
	public IMovieMember register(IMovieMember imoviemember) {
		Role userRole = roleRepository.findByName("後台專員");
		Collection<Role> roles = new ArrayList<Role>(Arrays.asList(userRole));
		imoviemember.setRoles(roles);
		imoviemember = this.create(imoviemember);
		return imoviemember;
	}

	@Override
	public IMovieMember findByAccountOrName(String accountOrName) {
		return userRepository.getIMovieMemberByNameOrAccount(accountOrName, accountOrName);
	}

	@Override
	public boolean findByMempk(Integer mempk) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkMemId(String memberid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void save(IMovieMember imoviemember) {
		// TODO Auto-generated method stub	
	}

	@Override
	public void updateStatus(String account) {

		System.out.println(account+"account");
		String hql = "UPDATE IMovieMember " + " SET permission = :permission  " + " WHERE account = :account ";
		entityManager.createQuery(hql).setParameter("permission", "c_Member").setParameter("account", account).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean checkFirst() {
		boolean first = false;	
		String hql = "From IMovieMember";
		List<IMovieMember> imovieMembers = entityManager.createQuery(hql).getResultList();
		if (imovieMembers.isEmpty()) {
			first = true;
		} else {
			first = false;
		}
		return first;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public IMovieMember getBaseData(String account) {
		String hql = "From IMovieMember m Where m.account = :account";
		List<IMovieMember> mblist = entityManager.createQuery(hql).setParameter("account", account).getResultList();
		System.out.println("=====getBaseData======"+account);
		IMovieMember userinf = new IMovieMember();	
		if(mblist.isEmpty()) {
			return null;
		} else {
			userinf.setMempk(mblist.get(0).getMempk());
			userinf.setPassword(mblist.get(0).getPassword());
			userinf.setPermission(mblist.get(0).getPermission());
			userinf.setAccount(mblist.get(0).getAccount());
			userinf.setEmailbox(mblist.get(0).getEmailbox());
			return userinf;			
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public IMovieMember forgetPassword(String account, String password) {
//		Session session = factory.getCurrentSession();
		IMovieMember forgetmb = new IMovieMember();

		// p查詢使用者信箱
		String hql = "From IMovieMember m Where m.account = :account";
		List<IMovieMember> mblist = entityManager.createQuery(hql).setParameter("account", account).getResultList();

		
			//String salt = getRandomsalt();
			//MessageDigest md = MessageDigest.getInstance("SHA-256");
			//Encoder encoder = Base64.getEncoder();
			//String salted = password + salt;
			//md.update(salted.getBytes("UTF-8"));
			//byte[] digest = md.digest();
			forgetmb.setAccount(mblist.get(0).getAccount());
			forgetmb.setEmailbox(mblist.get(0).getEmailbox());
			// p送更新後密碼
			String hql1 = "UPDATE IMovieMember AS e SET e.password = :password"
					+ " WHERE e.account = :account";// 先更新;
			entityManager.createQuery(hql1).setParameter("password", password)
					.setParameter("account", account).executeUpdate();
		

		return forgetmb;
	}
}
