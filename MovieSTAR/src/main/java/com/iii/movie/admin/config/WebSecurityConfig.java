package com.iii.movie.admin.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsServiceImpl userDetailsServiceimpl;

	@Autowired
	DataSource dataSource;

// @Override
// protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//  auth
//      .userDetailsService(userDetailsServiceimpl)
//      .passwordEncoder(new BCryptPasswordEncoder());
// }

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		PasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		auth.inMemoryAuthentication().passwordEncoder(passwordEncoder())
		        .withUser("dummymanager")
				.password(pwdEncoder.encode("admin"))
				.roles("ADMIN", "LEADER", "USER")
				.and()
				.withUser("dummyleader")
				.password(pwdEncoder.encode("leader"))
				.roles("LEADER", "USER")
				.and()
				.withUser("dummyuser")
				.password(pwdEncoder.encode("user"))
				.roles("USER");
		auth.userDetailsService(userDetailsServiceimpl).passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()

  .antMatchers(HttpMethod.GET, "/users").hasAnyRole("USER","LEADER","ADMIN")
  .antMatchers(HttpMethod.GET, "/user/add").hasRole("ADMIN")
  .antMatchers(HttpMethod.POST,"/user/save").hasRole("ADMIN")
  .antMatchers(HttpMethod.GET, "/user/*").hasAnyRole("USER","LEADER","ADMIN")
  .antMatchers(HttpMethod.GET, "/user/*/update").hasAnyRole("ADMIN","LEADER")
  .antMatchers(HttpMethod.GET, "/user/*/delete").hasRole("ADMIN")

  .antMatchers(HttpMethod.GET, "/msg/showAll").hasAnyRole("USER")
  .antMatchers(HttpMethod.GET, "/msg/*").hasAnyRole("ADMIN","USER","LEADER")
  .antMatchers(HttpMethod.GET, "/msg/delForum.controller/*").hasRole("ADMIN")
  .antMatchers(HttpMethod.GET, "/msg/seeMyMessage").hasRole("ADMIN")
  
  .antMatchers(HttpMethod.GET, "/nameberOrder.controller").hasRole("USER")
  .antMatchers(HttpMethod.GET, "/allApply.controller").hasRole("USER")
  .antMatchers(HttpMethod.GET, "/returnTicket.controller").hasRole("ADMIN")
  .antMatchers(HttpMethod.GET, "/checkIn.controller").hasRole("LEADER")
  
  .antMatchers(HttpMethod.GET, "/admin").hasRole("ADMIN")
  .antMatchers(HttpMethod.GET, "/leader").hasRole("LEADER")
  .antMatchers(HttpMethod.GET, "/user").hasRole("USER")

  .anyRequest().permitAll()
  .and()
        .rememberMe()
        .tokenRepository(persistentTokenRepository()) 
        .tokenValiditySeconds(86400)
        .key("MovieSTAR")
  .and()
        .csrf().disable()
        .formLogin().loginPage("/welcome/adminlogin")
        .defaultSuccessUrl("/backstageHomePage")
        .failureUrl("/login-error")
  .and()
  .logout().logoutSuccessUrl("/welcome/adminlogin");
//  .and()
//  .exceptionHandling();
  //.accessDeniedPage("/403");
  //.invalidateHttpSession(true)
  //.deleteCookies("JSESSIONID");

	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
		tokenRepository.setDataSource(dataSource);
		return tokenRepository;
	}

}