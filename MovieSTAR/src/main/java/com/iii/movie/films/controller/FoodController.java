package com.iii.movie.films.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.iii.movie.films.model.Food;
import com.iii.movie.films.model.Movie;
import com.iii.movie.films.service.FoodService;

@Controller
@EnableTransactionManagement
public class FoodController {
	@Autowired
	FoodService foodService;

	@PostMapping("saveFood")
	public String saveFood(Food food, @RequestParam(name = "foodName") String foodName,
			@RequestParam(name = "foodPrice") Integer FoodPrice, @RequestParam(name = "foodImage") MultipartFile file,
			HttpServletRequest request) {

		String fileName = food.getFoodname() + ".jpg";
		System.out.println("fileName:" + fileName);

		String saveDir = request.getServletContext().getRealPath("/") + "WEB-INF\\views\\image";
		System.out.println(saveDir);
		File saveFileDir = new File(saveDir);
		saveFileDir.mkdirs();

		File saveFilePath = new File(saveFileDir, fileName);
		byte[] image = null;
		try {
			file.transferTo(saveFilePath);
			System.out.println("saveFilePath:" + saveFilePath);
			if (fileName != null && fileName.length() != 0) {
				InputStream is1 = new FileInputStream(saveFilePath);
				image = new byte[is1.available()];
				is1.read(image);
				is1.close();
			}
		} catch (Exception e) {

		}

		Food food1 = new Food(foodName, image, FoodPrice);
		foodService.insert(food1);
		return "redirect:/foodIndex.controller";
	}

	@GetMapping("searchFood")
	public String searchFood(@RequestParam(name = "foodId") Integer foodId, Model m) {
		List<Food> foods = new ArrayList<Food>();
		foods.add(foodService.findById(foodId));
		m.addAttribute("foods", foods);
		return "films/searchFood";
	}

	@GetMapping("/getPicture/{foodId}")
	public ResponseEntity<byte[]> getPicture(@PathVariable(value = "foodId") Integer foodId, Model m) {
		Food food = foodService.findById(foodId);
		byte[] a = new byte[food.getFoodimage().length];
			a =	food.getFoodimage();
	     HttpHeaders httpHeaders = new HttpHeaders();
		        
		 httpHeaders.setCacheControl(CacheControl.noCache());
		 httpHeaders.setPragma("no-cache");
		 httpHeaders.setExpires(0L);
		 httpHeaders.setContentType(MediaType.IMAGE_JPEG);
		 ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(a, httpHeaders, HttpStatus.OK);
		 return responseEntity;
	}
//		Food food = foodService.findById(foodId);
//		byte[] a = new byte[food.getFoodimage().length];
//		a = food.getFoodimage();
//		String aaString = "";
//		try {
//			Base64.Encoder be = Base64.getEncoder();
//			StringBuilder str = new StringBuilder();
//			str.append(new String(be.encode(a)));
//
//			aaString = str.toString();
//			System.out.println(aaString);
//		}
//
//		catch (Exception ex) {
//			ex.printStackTrace();
//		}
//
//		m.addAttribute("img", aaString);
//		
//	}

}
