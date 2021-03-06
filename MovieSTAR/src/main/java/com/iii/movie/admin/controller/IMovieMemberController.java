package com.iii.movie.admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.iii.movie.admin.imoviememberservice.MovieStarService;
import com.iii.movie.admin.model.IMovieMember;
import com.iii.movie.admin.model.Role;
import com.iii.movie.admin.repository.IMovieMemberJpaService;
import com.iii.movie.admin.repository.RoleRepository;
import com.iii.movie.admin.service.IMovieMemberService;




@Controller
@SessionAttributes(names = { "msg0","msg1","msg2","msg3","msg4","msg5","userBean","registermember","registeruser","mempk","displayusername","googleloginname"})
@EnableTransactionManagement
public class IMovieMemberController {

	@Autowired
	IMovieMemberService iMovieMemberService;
	@Autowired
	MovieStarService movieStarService; 
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	private IMovieMemberJpaService iMovieMemberJpaService;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
//	public void SendEmail() {
//		String to = "weichuanglin@gmail.com";//change accordingly
//
//	      // Sender's email ID needs to be mentioned
//	      String from = "abc@gmail.com";//change accordingly
//	      final String username = "eeit12601@gmail.com";//change accordingly
//	      final String password = "eeit123456";//change accordingly
//
//	      // Assuming you are sending email through relay.jangosmtp.net
//	      String host = "smtp.gmail.com";
//
//	      Properties props = new Properties();
//	      props.put("mail.smtp.auth", "true");
//	      props.put("mail.smtp.starttls.enable", "true");
//	      props.put("mail.smtp.host", host);
//	      props.put("mail.smtp.port", "587");
//
//	      // Get the Session object.
//	      Session session = Session.getInstance(props,
//	      new javax.mail.Authenticator() {
//	         protected PasswordAuthentication getPasswordAuthentication() {
//	            return new PasswordAuthentication(username, password);
//	         }
//	      });
//
//	      try {
//	         // Create a default MimeMessage object.
//	         Message message = new MimeMessage(session);
//
//	         // Set From: header field of the header.
//	         message.setFrom(new InternetAddress(from));
//
//	         // Set To: header field of the header.
//	         message.setRecipients(Message.RecipientType.TO,
//	         InternetAddress.parse(to));
//
//	         // Set Subject: header field
//	         message.setSubject("?????????????????????");
//
//	         // Now set the actual message
//	         message.setText("????????? "
//	            + "email using JavaMailAPI ");
//
//	         // Send message
//	         Transport.send(message);
//	      }catch (MessagingException e) {
//			throw new RuntimeException(e);
//		}
//	} 
	
	@PostMapping(value="/checkMemberByAccount", produces = { "application/json" })
	@ResponseBody
	public  Map<String, Object> checkMemberByAccount(@RequestParam("account") String account) {	
		Map<String, Object> map = new HashMap<String, Object>();
		if (iMovieMemberService.checkMemberByAccount(account)) {
			map.put("account", "????????????????????????....");
		} else {
			map.put("account", "");
		};
		System.out.println("===IMovieMemberController==checkMemberByAccount==return map===" + map);
		return map;
		
	}

	@PostMapping("/registermembers")
	public @ResponseBody Map<String, Object> saveMember(@RequestBody IMovieMember member,
			Role role,
			Model m, 
			HttpServletRequest req,
			HttpServletResponse res			
			) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String validatepassword = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$";
		String validatecell= "(\\d{2,3}-?|\\(\\d{2,3}\\))\\d{3,4}-?\\d{4}|09\\d{2}(\\d{6}|-\\d{3}-\\d{3})$";
		String validateemail = "(\\S)+[@]{1}(\\S)+[.]{1}(\\w)+";
		String validatename = "^([\u4e00-\u9fa5]){2,}$";
				
		if (member.getAccount() == null || member.getAccount().equals("")) {
			map.put("idError", "*????????????????????????");
		}
		
		if(iMovieMemberService.checkMemberByAccount(member.getAccount())) {
			map.put("idError", "*????????????");
		}
		
		if (!Pattern.matches(validatepassword, member.getPassword())) {
			map.put("pwdError", "*??????????????????????????????,????????????8??????");
		}
		
		if (!Pattern.matches(validatename, member.getName())) {
			map.put("nameError", "*???????????????????????????");
        }
		
		System.out.println("============="+member.getEmailbox());
		if (!Pattern.matches(validateemail, member.getEmailbox())) {
			map.put("emailError", "*(ex:your@gmail.com)");
        }
		
		if (!Pattern.matches(validatecell, member.getCell())) {
			map.put("cellError", "*????????????????????????");
        }
		
		
		if(!member.getPassword().equals(member.getConfirmpassword())) {
			map.put("confirmpassworderror", "*??????????????????????????????????????????!!!!!!!");
		} 
		
		if(map.size()>0) {
			return map;
			
		} else {
//			byte[] sb = member.getImage1().getBytes();5125151
//			member.setImage(sb);
			member.setRegisterTime(sdf.format(new Date()));
			
			try {
			     //?????????????????????????????? ??????????????????....
//				if(movieStarService.checkFirst()) {	
//					Role userRole = roleRepository.findByName("ROLE_USER");
//					Collection<Role> roles = new ArrayList<Role>(Arrays.asList(userRole));
//					member.setRoles(roles);
//				}
			
				//p????????????
				iMovieMemberService.saveMember(member);
				map.put("success", "??????????????????");
				if (!member.getPermission().equals("y_Notcertified")) {
					map.put("url", req.getContextPath()+"/login.controller");
				} else {
					map.put("url", req.getContextPath()+"/emailcheck.controller");
				}
				m.addAttribute("registeruser", member);
				
			} catch (Exception e) {
				map.put("fail", "saveMember.......FAILED!!" +e.getMessage());
			}
			System.out.println("===IMovieMemberController===return map===" + map);
			//SendEmail();
			return map;			
		}
	}
	
	// 0409
	@PostMapping(value = "/emailCheck", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> emailCheck(@RequestParam("checknum") String checknum, Model m) {
		System.out.println("=======emailCheck==begin======");

		Map<String, Object> map = new HashMap<String, Object>();
		IMovieMember registermb = (IMovieMember) m.getAttribute("registeruser");
		System.out.println("=======emailCheck========"+registermb.getEmailbox());
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "eeit12601@gmail.com";// ??????????????????
		final String password = "eeit123456";// your password
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.port", port);
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("eeit12601@gmail.com"));
			System.out.println("====registermb.getAccount()===="+registermb.getEmailbox());
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(registermb.getEmailbox()));
			message.setSubject("MovieSTAR ??????????????????");
			message.setText(" ????????????" + checknum + "!");

			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, username, password);

			Transport.send(message);

			System.out.println("??????email??????.");
			map.put("msg", "MovieSTAR??????????????????, ?????????????????????");
		} catch (MessagingException e) {
			map.put("msg", "");
			throw new RuntimeException(e);
		}

		return map;
	}
	
	
	// 0409
	@PostMapping(value = "/verifysuccess", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> verifySuccess(HttpSession session, SessionStatus sessionStatus,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		IMovieMember registermb = (IMovieMember) session.getAttribute("registeruser");
		movieStarService.updateStatus(registermb.getAccount());
		sessionStatus.setComplete();
		session.removeAttribute("registeruser");
		return map;
	}
	
	
	//0331
	@PostMapping("/googlemembers")
	public @ResponseBody Map<String, Object> googlesaveMember(
			@RequestBody IMovieMember member,
			HttpSession session,
			Model m
			) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			iMovieMemberService.googlesaveMember(member);
			member.setRegisterTime(sdf.format(new Date()));
			member.setPermission("c_Member");
			map.put("success", "googlesaveMember.......sccuss!!");
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			map.put("fail", "googlesaveMember.......FAILED!!");
		}
		
		boolean googlechecklogin = iMovieMemberService.googlecheckLogin(member);
		IMovieMember imoviemember = iMovieMemberJpaService.getByName(member.getName());
		
		
		if(googlechecklogin) {
			String memberbyNamePassword = iMovieMemberService.getMemberbyaccountName(member.getAccount(), member.getName());
			session.setAttribute("googleloginname", memberbyNamePassword);			
			IMovieMember checkMemberByAccount = movieStarService.findByAccountOrName(member.getAccount());
			m.addAttribute("userBean",checkMemberByAccount);
		}
		 
		map.put("gotoprofile", imoviemember.getPassword());	
		map.put("getgoogleusername", imoviemember.getName());	
		return map;
	}

	@GetMapping("/members")
	public @ResponseBody List<IMovieMember> getAllMembers() {
		return iMovieMemberService.getAllMembers();
	}

	@GetMapping("/members/{memPk}")
	public @ResponseBody IMovieMember getMemberByPk(@PathVariable("memPk") Integer memPk) {
		return iMovieMemberService.getMemberByPk(memPk);
	}

	@GetMapping("/deletemembers/{memPk}")
	public String deleteMember(@PathVariable("memPk") Integer memPk) {

		Map<String, Object> map = new HashMap<String, Object>();
		Integer deleteMember = iMovieMemberService.deleteMember(memPk);
		if (deleteMember == -1) {
			map.put("success", "DeleteMember.......DONE!!");
		} else if (deleteMember == 1) {
			map.put("fail", "DeleteMember.......FAILED!!");
		}
		return "redirect:/showAllEmployees";
	}

	@PutMapping("/members/{memPk}")
	public @ResponseBody Map<String, Object> editMember(@PathVariable("memPk") Integer memPk,
			@RequestBody IMovieMember member) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			iMovieMemberService.editMember(member);
			map.put("success", "UpdateMember.......DONE!!");
		} catch (Exception e) {
			map.put("fail", "UpdateMember.......FAILED!!");
		}
		return map;
	}

	@PostMapping("/checkLogin")
	@ResponseBody
	public  Map<String, Object> checkLogin(
			@RequestBody IMovieMember iMovieMember,
			HttpSession session,
			Model m) {
		Map<String, Object> msg = new HashMap<String, Object>();
		IMovieMember base = movieStarService.getBaseData(iMovieMember.getAccount());
		boolean checkLogin = iMovieMemberService.checkLogin(new IMovieMember(iMovieMember.getAccount(), iMovieMember.getPassword()));		
			      
				if (movieStarService.findByAccountOrName(iMovieMember.getAccount()) == null) {
					msg.put("idfail", "?????????????????????????????????");
				}
										
				else if (base.getPermission().equals("y_Notcertified") && (base.getPassword().equals(iMovieMember.getPassword()))) {
					m.addAttribute("registeruser", base);
					msg.put("verify", "???????????????");				
				}
				
				else if (base.getPermission().equals("c_Member") && (base.getPassword().equals(iMovieMember.getPassword()))) {
					msg.put("success", "????????????");	
					IMovieMember checkMemberByAccount = movieStarService.findByAccountOrName(iMovieMember.getAccount());
					m.addAttribute("userBean",checkMemberByAccount);
					
					msg.put("msg1", "????????????????????????");
					String getMemberbyNamePassword = iMovieMemberService.getMemberbyaccountPassword(iMovieMember.getAccount(), iMovieMember.getPassword());
					
					//p??????mempk
					m.addAttribute("mempk",base.getMempk());
					msg.put("msg0",getMemberbyNamePassword);
					
					//p????????????
					m.addAttribute("name",getMemberbyNamePassword);
					msg.put("msg2",getMemberbyNamePassword);
					
					//p????????????
					m.addAttribute("account", iMovieMember.getAccount());
					msg.put("msg3",iMovieMember.getAccount());
					
					//p????????????			
					m.addAttribute("passWord", iMovieMember.getPassword());
					msg.put("msg7",iMovieMember.getPassword());
														
					//p????????????
					session.setAttribute("displayusername", getMemberbyNamePassword);					
					session.setAttribute("checkLogin", checkLogin);								
					msg.put("msg5", "Login??????????????????");					
					return msg;
				
				} else {
					msg.put("msg4", "??????????????????????????????,??????????????????");					
				};		
	
		System.out.println("=======Login????????????====");
		return msg;
	}

	@RequestMapping("/signout")
	public String logout(HttpSession session,SessionStatus session1) {	
		System.out.println("===IMovieMemberController===logout===" + session1);
		session1.setComplete();
		System.out.println("===IMovieMemberController===session.invalidate();===" + session1);
		return "redirect:/login.controller";
	}

}
