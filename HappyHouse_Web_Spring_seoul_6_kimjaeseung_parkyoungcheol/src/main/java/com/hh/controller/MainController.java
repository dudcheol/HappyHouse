package com.hh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hh.service.HouseMapService;

@Controller
public class MainController {
	
	@Autowired
	HouseMapService service;
	
	
}
