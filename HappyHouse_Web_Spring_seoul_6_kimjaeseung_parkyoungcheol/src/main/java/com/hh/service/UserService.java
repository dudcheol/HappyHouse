package com.hh.service;

import java.util.ArrayList;

import com.hh.vo.UserDto;

public interface UserService {
	public ArrayList<UserDto> selectAll();//모든 회원정보
	public UserDto selectOne(String num);//고객 한명 정보
	public void insert(UserDto u);//회원가입
	public void delete(String num);//회원 삭제
	public void update(String num, String name, String pass, String email, String phone);
}
 