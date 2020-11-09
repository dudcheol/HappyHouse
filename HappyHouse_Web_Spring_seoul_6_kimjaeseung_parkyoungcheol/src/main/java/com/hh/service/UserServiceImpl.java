package com.hh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hh.dao.UserDAO;
import com.hh.vo.UserDto;

@Service
public class UserServiceImpl implements UserService{

	@Autowired  
	UserDAO dao;
	
	@Override
	public ArrayList<UserDto> selectAll() {
		return dao.selectAll();
	}

	@Override
	public UserDto selectOne(String num) {
		return dao.selectOne(num);
	}

	@Override
	public void insert(UserDto u) {
		dao.insert(u);
	}

	@Override
	public void delete(String num) {
		dao.delete(num);
	}

	@Override
	public void update(String num, String name, String pass, String email, String phone) {
		dao.update(num, name, pass, email, phone);
	}

}
