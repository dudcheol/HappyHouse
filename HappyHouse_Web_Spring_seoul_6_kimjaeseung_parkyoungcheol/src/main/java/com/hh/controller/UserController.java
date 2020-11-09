package com.hh.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.hh.service.UserService;
import com.hh.vo.UserDto;

@RestController
public class UserController {
	@Autowired
	UserService service;
	
	@GetMapping(value = "/user")
	public List<UserDto> selectAll(){
		return service.selectAll();
	}
	
	@PostMapping(value = "/insert")
	public void insert(@RequestBody UserDto d) {
		service.insert(d);
	}
	
	@PostMapping(value = "/insertProcess.bod")
	public void insertProcess(UserDto u, HttpServletResponse response) { //vo. 사용자가 입력한 4개의 값을 받아옴.
		service.insert(u);
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping(value = "/loginprocess.bod")
	public void loginProcess(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("loginprocess들어옴!");
		String userid = request.getParameter("userid");
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
		System.out.println(userid);

		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping(value = "/logout.bod")
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("로그아웃 들어옴");
		
		HttpSession session = request.getSession();
		session.setAttribute("userid", null);
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
