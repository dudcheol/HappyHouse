package com.hh.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hh.service.HouseMapService;

@Controller
public class HappyHouseController {

	@Autowired
	HouseMapService service;

	@GetMapping(value = "/")
	public String main() {
		return "index";
	}

	@PostMapping(value = "/map")
	public String goMap(Model model, HttpServletRequest req) {
		System.out.println("map!!");
		model.addAttribute("sido", req.getParameter("sido"));
		model.addAttribute("gugun", req.getParameter("gugun"));
		model.addAttribute("dong", req.getParameter("dong"));
		return "map";
	}

}
