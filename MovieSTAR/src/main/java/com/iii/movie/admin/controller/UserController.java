package com.iii.movie.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.iii.movie.admin.imoviememberservice.MovieStarService;
import com.iii.movie.admin.model.IMovieMember;
import com.iii.movie.admin.repository.IMovieMemberJpaImpl;
import com.iii.movie.admin.repository.IMovieMemberJpaService;
import com.iii.movie.admin.service.IMovieMemberService;
import com.iii.movie.admin.validator.UserFormValidator;
import com.iii.movie.films.model.Food;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;

@Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MovieStarService moviestarservice;
	
	@Autowired
	private IMovieMemberJpaService iMovieMemberJpaService;
	
	@Autowired
	IMovieMemberService iMovieMemberService;
	
	@Autowired
	IMovieMemberJpaImpl iMovieMemberJpaImpl;
	
	@Autowired
	UserFormValidator userFormValidator;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(userFormValidator);
	}
	
	@PostMapping("/forgetpwd")
	@ResponseBody
	public Map<String, Object> forgetpwdAction(@RequestParam("account") String account, IMovieMember iMovieMember) {
		Map<String, Object> map = new HashMap<String, Object>();

		String newpwd = getRandomPassword();
		
		// p判斷帳號是否存在
		if (!(iMovieMemberService.checkMemberByAccount(account))) {
			map.put("fail", "帳號不存在");
			return map;
		}
		
		// p尋找帳號與寄送新密碼
		else {
			iMovieMember = moviestarservice.forgetPassword(account, newpwd);
		}

		// p寄信
		String host = "smtp.gmail.com";
		int port = 587;
		final String username = "eeit12601@gmail.com";
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
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(iMovieMember.getEmailbox()));
			message.setSubject("MovieSTAR影城忘記密碼服務.");
			message.setText(" 帳號：" + iMovieMember.getAccount() + " !" + "\r\n" + " 新密碼:" + newpwd + "!");
			Transport transport = session.getTransport("smtp");
			transport.connect(host, port, account, password);

			Transport.send(message);

			System.out.println("寄送email結束.");
			map.put("success", "已成功寄信到信箱");
			map.put("email", iMovieMember.getEmailbox());
		} catch (MessagingException e) {
			map.put("fail", "false");
			throw new RuntimeException(e);
		}

		return map;
	}
	
	// p亂數產生密碼
	private String getRandomPassword() {
		int z;
		StringBuilder sb = new StringBuilder();
		int i;
		sb.append((int) ((Math.random() * 10) + 48));
		sb.append((char) (((Math.random() * 26) + 65)));
		sb.append(((char) ((Math.random() * 26) + 97)));
		for (i = 0; i < 5; i++) {
			z = (int) ((Math.random() * 7) % 3);
			if (z == 1) { // p放數字
				sb.append((int) ((Math.random() * 10) + 48));
			} else if (z == 2) { // p放大寫英文
				sb.append((char) (((Math.random() * 26) + 65)));
			} else {// 放小寫英文
				sb.append(((char) ((Math.random() * 26) + 97)));
			}
		}
		return sb.toString();
	}

	
	// list users
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String showAllMembers(Model model) {
		List<IMovieMember> imoviemembers = iMovieMemberJpaService.findByStatus();
		model.addAttribute("imoviemembers", imoviemembers);
		return "admin/admin";
	}
	
	// list Starusers
	@RequestMapping(value = "/starusers", method = RequestMethod.GET)
	public String showStarusers(Model model) {
		List<IMovieMember> imoviemembers = iMovieMemberJpaService.findByAccount();
		model.addAttribute("imoviemembers", imoviemembers);
		return "admin/admin2";
	}
	
	// show user
	@RequestMapping(value = "/user/{mempk}", method = RequestMethod.GET)
	public String showUser(@PathVariable("mempk") int mempk, Model model) {
		IMovieMember user = null;
		try {
			user = moviestarservice.findById(mempk);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		model.addAttribute("user", user);
		if (user == null) {
			model.addAttribute("css", "danger");
			model.addAttribute("msg", "User not found!");
		}
		if(user.getAccount()==null) {
			return "admin/show";
		} else {
			return "admin/show2";
		}		
	}
	
	// show add user form
	@RequestMapping(value = "/user/add", method = RequestMethod.GET)
	public String showAddUserForm(Model model) {
		IMovieMember user = createModelDefaultValues();
		model.addAttribute("userForm", user);		
		createFormOptions(model);
		return "admin/userform";
	}

	// show update user form
	@RequestMapping(value = "/user/{id}/update", method = RequestMethod.GET)
	public String showUpdateUserForm(@PathVariable("id") int mempk, Model model) {
		IMovieMember user = moviestarservice.findById(mempk);
		model.addAttribute("userForm", user);
		System.out.println("更新使用著資料");
		createFormOptions(model);
		return "/admin/userform";
	}
	
	// show update usercenter
	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public String showUpdateUsercenter(
			@RequestParam() int mempk,
			@RequestParam() String account,
			@RequestParam() String cell,
			@RequestParam() String password,
			@RequestParam() String name,
			@RequestParam() MultipartFile file,
			@RequestParam() String registerTime
			, Model model
			,HttpServletRequest request
			,SessionStatus session
			
			) {
		IMovieMember user = moviestarservice.findById(mempk);
		
		String fileName=user.getMempk()+".jpg";
		System.out.println("fileName:"+fileName);
		
		String saveDir = request.getServletContext().getRealPath("/")+"WEB-INF\\views\\image";
		File saveFileDir = new File(saveDir);
		saveFileDir.mkdirs();
		
		File saveFilePath =new File(saveFileDir,fileName);
		byte[] image =null;
		try {
			file.transferTo(saveFilePath);
			if(fileName!=null && fileName.length()!=0) {
				InputStream is1 =new FileInputStream(saveFilePath);
				image = new byte[is1.available()];
				is1.read(image);
				is1.close();
			}
		} catch (Exception e) {
			
		}
		
		if(image.length == 0) {
			image = null;
			user.setName(name);
			user.setAccount(account);
			user.setCell(cell);
			user.setPassword(password);
			user.setRegisterTime(registerTime);
			moviestarservice.create2(user);
		}else {
			user.setName(name);
			user.setAccount(account);
			user.setCell(cell);
			user.setPassword(password);
			user.setImage(image);
			user.setRegisterTime(registerTime);
			moviestarservice.create2(user);			
		}
		
		model.addAttribute("userBean", user);
		System.out.println("更新使用著資料");
		createFormOptions(model);		
		session.setComplete();		
		return "redirect:/signout";
	}
	
	// save(insert) or update user
	@RequestMapping(value = "/user/save", method = RequestMethod.POST)
	public String saveOrUpdateUser(
			  @ModelAttribute("userForm") 
	          @Validated IMovieMember imoviemember
			, BindingResult result
			, Model model
			,final RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			createFormOptions(model);
			return "admin/userform";
		} else {
			boolean isNew = imoviemember.isNew();
			
			if (isNew) {
				moviestarservice.register(imoviemember);
			} else {
				moviestarservice.update(imoviemember);
			}
			
			redirectAttributes.addFlashAttribute("css", "success");
			if (isNew) {
				redirectAttributes.addFlashAttribute("msg", "User added successfully!");
			} else {
				redirectAttributes.addFlashAttribute("msg", "User updated successfully!");
			}
			return "redirect:/user/" + imoviemember.getMempk();
		}
	}

	// delete user
	@RequestMapping(value = "/user/{id}/delete", method = RequestMethod.GET)
	public String deleteUser(@PathVariable("id") int mempk, final RedirectAttributes redirectAttributes) {
		moviestarservice.delete(mempk);
		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "成功刪除會員!");
		return "redirect:/users";
	}

	private void createFormOptions(Model model) {
		
		Map<String, String> salary = new LinkedHashMap<String, String>();
		salary.put("35000","35000");
		salary.put("40000","40000");
		salary.put("50000","50000");
		salary.put("55000","55000");
		salary.put("60000","60000");
		salary.put("100000","100000");
		model.addAttribute("salary", salary);

		Map<String, String> skill = new LinkedHashMap<String, String>();
		skill.put("HTML", "HTML");
		skill.put("Hibernate", "Hibernate");
		skill.put("JavaScript", "JavaScript");
		skill.put("JQuery", "JQuery");
		skill.put("Bootstrap", "Bootstrap");
		model.addAttribute("skill", skill);

		List<String> title = new ArrayList<String>();
		title.add("ROLE_ADMIN");
		title.add("ROLE_LEADER");
		title.add("ROLE_USER");
		model.addAttribute("title", title);

		Map<String, String> status1 = new LinkedHashMap<String, String>();
		status1.put("在職", "在職");
		status1.put("離職", "離職");
		status1.put("留職停薪", "留職停薪");	
		model.addAttribute("status1", status1);
	}
	
	private IMovieMember createModelDefaultValues() {
		IMovieMember user = new IMovieMember();		
		// set default value
		user.setName("張曉青");
		user.setAccount("boo@gmail.com");
		user.setMemberid("M111001");
		user.setPassword("Aa123456");
		user.setConfirmpassword("Aa123456");
		user.setCell("0911222333");

		return user;
	}
	
	@GetMapping("/getProfilePicture/{mempk}")
	public ResponseEntity<byte[]> getPicture(@PathVariable(value = "mempk") Integer mempk, Model m) {
		IMovieMember im = moviestarservice.findById(mempk);
		byte[] a = new byte[im.getImage().length];
			a =	im.getImage();
	     HttpHeaders httpHeaders = new HttpHeaders();
		        
		 httpHeaders.setCacheControl(CacheControl.noCache());
		 httpHeaders.setPragma("no-cache");
		 httpHeaders.setExpires(0L);
		 httpHeaders.setContentType(MediaType.IMAGE_JPEG);
		 ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(a, httpHeaders, HttpStatus.OK);
		 return responseEntity;
	}
	
	@GetMapping("/login-error")
	public String login(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		String errorMessage = null;
		if (session != null) {
			AuthenticationException ex = (AuthenticationException) session
					.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
			if (ex != null) {
				errorMessage = "您所輸入的資訊錯誤; 請聯絡資訊安全部相關人員";
			}
		}
		model.addAttribute("errorMessage", errorMessage);
		return "admin/adminlogin";
	}
	
	
}