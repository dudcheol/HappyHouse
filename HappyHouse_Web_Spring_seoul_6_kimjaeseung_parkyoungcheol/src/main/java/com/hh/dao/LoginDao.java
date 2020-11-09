package com.hh.dao;

import java.sql.SQLException;

import com.hh.vo.UserDto;

public interface LoginDao {
	public UserDto login(String userid, String userpwd) throws SQLException;

	public void join(String userid, String username, String userpwd, String email);

	public void modify(String org_userid, String org_userpwd, String username, String address, String email, String password);
}
