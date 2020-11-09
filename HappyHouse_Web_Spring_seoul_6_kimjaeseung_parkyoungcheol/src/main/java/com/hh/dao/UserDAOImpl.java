package com.hh.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hh.mapper.UserMapper;
import com.hh.vo.UserDto;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	UserMapper mapper;
	
	@Override
	public ArrayList<UserDto> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public UserDto selectOne(String num) {
		return mapper.selectOne(num);
	}

	@Override
	public void insert(UserDto u) {
		mapper.insert(u);
	}

	@Override
	public void delete(String num) {
		mapper.delete(num);
	}

	@Override
	public void update(String num, String name, String pass, String email, String phone) {
		mapper.update(num, name, pass, email, phone);
	}
}
