package com.iii.movie.films.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iii.movie.films.model.Hall;
import com.iii.movie.films.service.ArrangeHallService;

@Controller
@SessionAttributes(names = {"hBean"})
public class ArrangeHallJSONController {
	
	@Autowired
	private ArrangeHallService arrangeHallService;
	
	@PostMapping("/arrangeAddHall.controller")
	public void arrangeAddHall(@RequestBody Hall hBean, Model m) {
		arrangeHallService.insert(hBean);
		m.addAttribute("hBean",hBean);
	}
	
	@GetMapping("/arrangeConfirmHall.controller")
	public @ResponseBody Hall arrangePreviewHall(Model m) {
		Hall hBean = (Hall) m.getAttribute("hBean");
		return hBean;
	}
	
	@PostMapping("/arrangePreviewHall.controller")
	public void arrangePreviewHall(@RequestBody Hall hBean, Model m) {
		m.addAttribute("hBean",hBean);
	}
	
	@GetMapping("/arrangeAllHall.controller")
	public @ResponseBody List<Hall> arrangeAllHall() {
		return arrangeHallService.allInquire();
	}
	
	@GetMapping("/schematicDiagram.controller")
	public @ResponseBody Hall schematicDiagram(@RequestParam Integer hallId) {
		return arrangeHallService.inquire(hallId);
	}
	
	@PostMapping("/arrangeAddRetainedId.controller")
	public void arrangeAddRetainedId(@RequestBody Hall hBean) {
		arrangeHallService.setRetained(hBean);
	}
	
	@PostMapping("/arrangeModifyHall.controller")
	public void arrangeModifyHall(@RequestBody Hall hBean) {
		arrangeHallService.modifyHall(hBean);
	}
}
