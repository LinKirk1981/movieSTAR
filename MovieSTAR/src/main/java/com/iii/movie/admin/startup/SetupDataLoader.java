//package com.iii.movie.admin.startup;
//
//import java.util.HashSet;
//import java.util.Set;
//
//import javax.servlet.ServletContext;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationListener;
//import org.springframework.context.event.ContextRefreshedEvent;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Component;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.context.WebApplicationContext;
//
//import com.iii.movie.admin.model.IMovieMember;
//import com.iii.movie.admin.repository.FunctiontableRepository;
//import com.iii.movie.admin.repository.IMovieMemberJpaImpl;
//import com.iii.movie.admin.repository.RoleRepository;
//
//@Component
//public class SetupDataLoader implements ApplicationListener<ContextRefreshedEvent> {
//
//	private static boolean alreadySetup = false;
//
//	@Autowired
//	private IMovieMemberJpaImpl imovieMemberJpaImpl;
//	
//	@Autowired
//	private RoleRepository roleRepository;
//	
//	@Autowired
//	private FunctiontableRepository functionRepository;	
//	
//	@Autowired
//	SettingProperties settings;
//
//	@Override
//	@Transactional
//	public void onApplicationEvent(ContextRefreshedEvent event) {
//		if (alreadySetup) {
//			return;
//		}
//		
////		// create initial roles
////		Role rManager = createRole("ROLE_ADMIN");
////		Role rLeader = createRole("ROLE_LEADER");
////		Role rRp = createRole("ROLE_USER");
//		
////		// create initial functions
////		createFunction("deleteUser", "GET", "/user/*/delete", rManager);
////		createFunction("addUser", "POST", "/user/save", rManager);
////		createFunction("getUserAddForm", "GET", "/user/add" ,rManager);
////		createFunction("updateUser", "GET", "/user/*/update", rLeader ,rManager);
////		createFunction("getUser", "GET", "/user/*", rRp, rLeader ,rManager);
////		createFunction("listUsers", "GET", "/users", rRp, rLeader ,rManager);
//
//		// create initial user
//		createUser("M1110011","manager@gmail.com", "manager",  "manager","0911222333" );
//		createUser("M1110012","admin@gmail.com", "admin", "admin","0911222333" );
//		createUser("M1110013","user@gmail.com", "user" , "user","0911222333" );
//		createUser("M1110014","vistor@gmail.com", "vistor", "vistor", "0911222333" );
//		
//		loadParam(event);
//		alreadySetup = true;
//	}
//	
//
//
//
//////	@Transactional
////	private Functiontable createFunction(String name, String httpMethod, String url, Role... roles) {
////		Functiontable functiontable = functionRepository.findByName(name);
////		
////		if (functiontable == null) {
////			functiontable = new Functiontable(name, httpMethod, url);
////			functiontable.setRoles(Arrays.asList(roles));
////			functiontable = functionRepository.save(functiontable);
////		}
////		return functiontable;
////	}
//
//
//////	@Transactional
////	private Role createRole(String name) {
////		Role role = roleRepository.findByName(name);
////		if (role == null) {
////			role = new Role(name);
////		}
////		role = roleRepository.save(role);
////		return role;
////	}
//
////	@Transactional
//	private IMovieMember createUser( String memberid, String account, String name, String password, String cell) {
//		IMovieMember imoviemember = imovieMemberJpaImpl.findByName(name);
//		Set<String> role = new HashSet<String>();
//		role.add("ROLE_ADMIN");
//		role.add("ROLE_LEADER");
//		role.add("ROLE_USER");
//		
//		if (imoviemember == null) {
//			imoviemember = new IMovieMember();
//			imoviemember.setMemberid(memberid);
//			imoviemember.setAccount(account);
//			imoviemember.setName(name);
//			imoviemember.setPassword(new BCryptPasswordEncoder().encode(password));				
//			imoviemember.setCell(cell);
//			imoviemember.setEnabled(true);
//			imoviemember.setTitle(role);
//		}
//		
////		if (roles != null && roles.length > 0) {
////			System.out.println(imoviemember.getName());
////			imoviemember.setRoles(Arrays.asList(roles));
////		}
//		
//		try {
//			imoviemember = imovieMemberJpaImpl.save(imoviemember);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return imoviemember;
//	}
//    
//
//	
//	private void loadParam(ContextRefreshedEvent event) {
//		WebApplicationContext webApplicationContext = (WebApplicationContext) event
//				.getApplicationContext();
//		ServletContext servletContext = webApplicationContext.getServletContext();
//		servletContext.setAttribute("mySettings", settings);
//	}
//}