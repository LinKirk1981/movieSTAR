package com.iii.movie.films.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.iii.movie.films.model.Hall;
import com.iii.movie.films.service.ArrangeHallService;

@Controller
@SessionAttributes(names = {"id"})
public class ArrangeHallController {
	
	@Autowired
	ArrangeHallService arrangeHallService;
	
	@GetMapping("/arrangeHallMain.controller")
	public String arrangeHallMain() {
		return "films/arrangeHall";
	}
	
	@GetMapping("/addHallMain.controller")
	public String addHallMain() {
		return "films/addHall";
	}
	
	@GetMapping("/confirmMain.controller")
	public String confirmMain() {
		return "films/confirm";
	}
	
	@GetMapping("/detailsMain.controller")
	public String detailsMain() {
		return "films/details";
	}
	
	@GetMapping("/schematicDiagram/{id}")
	public String schematicDiagramMain(@PathVariable Integer id ,Model m) {
		m.addAttribute("id",id);
		return "films/schematicDiagram";
	}
	
	@GetMapping("/reservedFigure/{id}")
	public String reservedFigureMain(@PathVariable Integer id ,Model m) {
		m.addAttribute("id",id);
		return "films/reservedFigure";
	}
	
	@GetMapping("/modifyHall/{id}")
	public String modifyHallMain(@PathVariable Integer id ,Model m) {
		m.addAttribute("id",id);
		return "films/modifyHall";
	}
	
	@GetMapping("/deleteHall/{id}")
	public String deleteHallMain(@PathVariable Integer id) {
		Hall hall = new Hall();
		hall.setHallId(id);
		arrangeHallService.deleteHall(hall);
		return "films/arrangeHall";
	}
	
}
