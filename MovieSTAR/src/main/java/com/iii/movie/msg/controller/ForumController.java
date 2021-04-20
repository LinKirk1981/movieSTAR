package com.iii.movie.msg.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.iii.movie.msg.model.Forum;
import com.iii.movie.msg.model.Message;
import com.iii.movie.msg.service.ForumS;


@Controller
@SessionAttributes
@EnableTransactionManagement
public class ForumController {
//	@Autowired
//	ForumService forumService;
	
	@Autowired 
	ForumS forumS;
	
	//新增文章
	@PostMapping("/saveForum.controller")
	public @ResponseBody void saveForum(@RequestBody Forum forum){
		forumS.saveForum(forum);
	}
	
	//顯示所有文章
	@GetMapping("/queryAllForum.controller")
	public @ResponseBody List<Forum> findAll(){	
		return forumS.findAll();
	}
	
	//查詢電影下的所有文章
	@GetMapping("/selectMovieForum.controller")
	public @ResponseBody List<Forum> selectMovieForum(Forum forum){
		return forumS.selectMovieForum(forum);
	}
	
	
	//檢舉文章
	@PostMapping("/forumreport.controller")
	public String forumReport(@RequestBody Forum forum) {
		forumS.forumReport(forum);
		 return "msg/reportForum";
	}
	
	//查詢單筆文章
	@GetMapping("/showOneMsg.controller")
	public @ResponseBody Forum showOneMsg(@RequestParam("fid")Integer fid,Integer prestige) {	
		
		Forum f = forumS.recordPrestige(forumS.showOneMsg(fid),prestige);
		
		return forumS.showOneMsg(fid);
		
	}
	
	//新增留言
	@PostMapping("/saveMessage.controller")
	public @ResponseBody String saveMsg(@RequestParam("pk")Integer fid,
										@RequestParam("account")String account,
										@RequestParam("mcontent")String mcontent,
										@RequestParam("blockade")String blockade) {
		Message msg = new Message(account,mcontent,blockade);
	
		forumS.saveMsg(fid,msg);
		
		
		return "msg/message";
	}
//	//新增留言 + 圖片
//	@PostMapping("/saveMessage.controller")
//	public @ResponseBody String saveMsg(Message Message,
//										@RequestParam("pk")Integer fid,
//										@RequestParam("account")String account,
//										@RequestParam("mcontent")String mcontent,
//										@RequestParam("blockade")String blockade,
//										@RequestParam("pic")MultipartFile pic,HttpServletRequest request) {
//		
//		String fileName = Message.getMid() + ".jpg";
//		System.out.println("fileName:" + fileName);
//
//		String save = request.getServletContext().getRealPath("/") + "WEB-INF\\views\\image";
//		System.out.println(save);
//		File saveFileDir = new File(save);
//		saveFileDir.mkdirs();
//
//		File saveFilePath = new File(saveFileDir, fileName);
//		byte[] image = null;
//		try {
//			pic.transferTo(saveFilePath);
//			System.out.println("saveFilePath:" + saveFilePath);
//			if (fileName != null && fileName.length() != 0) {
//				InputStream is1 = new FileInputStream(saveFilePath);
//				image = new byte[is1.available()];
//				is1.read(image);
//				is1.close();
//			}
//		} catch (Exception e) {
//
//		}
//	
//		Message msg = new Message(account,mcontent,blockade,image);
//		forumS.saveMsg(fid,msg);
//		return "msg/message";
//	}
	
	
	
	//顯示所有留言
	@GetMapping("/findMessage.controller")
	public @ResponseBody Forum findMessage(@RequestParam("fid")Integer fid){
		System.out.println("================================================我是重整功能================================================");
		return forumS.findMessage(fid);
	}
	
	
	// ============================================== 聊天室 ==========================================
	//聊天室路徑
	@GetMapping("/msgRoom")
	public  String findMsgRoom(){
		return "msgroom/myroom";
	}
	
	//聊天室顯示全部內容	
	@GetMapping("/msgRoom.controller")
	public @ResponseBody List<Forum> findRoom(){
		return forumS.findRoom();
	}
	
	//離開聊天室
	@PostMapping("/delRoom.controller")
	public @ResponseBody String delRoom() {
		forumS.delRoom();
		return "msgback/backForumTest";
	}
	
	//聊天
	@PostMapping("/saveRoom.controller")
	public @ResponseBody void saveRoom(@RequestBody Forum forum){
		forumS.saveForum(forum);
	}
	
	//官方聊天室路徑
	@GetMapping("/msgAdminRoom")
	public  String findMsgAdminRoom(){
		return "msgroom/adminroom";
	}

}
