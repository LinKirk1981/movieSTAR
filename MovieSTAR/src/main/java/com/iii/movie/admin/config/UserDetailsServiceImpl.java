package com.iii.movie.admin.config;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import com.iii.movie.admin.model.IMovieMember;
import com.iii.movie.admin.model.Role;
import com.iii.movie.admin.repository.IMovieMemberJpaImpl;


@Configuration
public class UserDetailsServiceImpl implements UserDetailsService{
		
	@Autowired
	private IMovieMemberJpaImpl userRepository;
	

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) {
		
		IMovieMember iMovieMember = userRepository.findByName(username);		
		if (iMovieMember == null) {
			throw new UsernameNotFoundException(username);
		}	
		 
//		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();		
//		for (Role role : iMovieMember.getRoles()) {
//			grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
//		}
		
		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();		
		for (String role : iMovieMember.getTitle()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role));
		}

		return new User(iMovieMember.getName(), iMovieMember.getPassword(), grantedAuthorities);
	}
	
	
	
	
	
	
	

}
