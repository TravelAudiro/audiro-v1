package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.audiro.dto.DetailedPlanDto;
import com.audiro.repository.TravelPlan;
import com.audiro.service.TravelPlanService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/travel/plan")
public class TravelPlanController {

	private final TravelPlanService service;

	@GetMapping("")
	public void plan() {
		
	}

	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		int usersId=(int) session.getAttribute("signedInUsersId");
		List<TravelPlan> list= service.readAllTravelPlan(usersId);
		model.addAttribute("travelPlan", list);
		return "/travel/plan_list";
	}
	
	@GetMapping("/details")
	public String details(@RequestParam(name="id") int id, Model model) {
		TravelPlan plan=service.readTravelPlanById(id);
		List<DetailedPlanDto> list=service.readDetailedPlanByTravelPlanId(id);
		model.addAttribute("travelPlan",plan);
		return "/travel/plan_details";
	}
	
	@PostMapping("/modify")
	public String modify(@RequestParam("travelPlanId") int travelPlanIdForModify, Model model) {
		model.addAttribute("travelPlanIdForModify", travelPlanIdForModify);
		return "/travel/plan";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam(name = "category", defaultValue = "c") String category,HttpServletRequest request, Model model) {
		List<TravelPlan> list;
		HttpSession session=request.getSession();
		int usersId=(int) session.getAttribute("signedInUsersId");
		if ("t".equals(category)) {
			list = service.readAllTravelPlanOrderByTitle(usersId);
		} else {
			list = service.readAllTravelPlan(usersId);
		}
		model.addAttribute("travelPlan", list);
		return "/travel/plan_list";
	}
	
}
