package com.hh.service;

import com.hh.vo.UserDto;

public interface LoginService {
	public UserDto login(String userid, String userpwd) throws Exception;

	public void modify(String org_userid, String org_userpwd, String username, String address, String email, String password);

	public void join(String userid, String username, String userpwd, String email);
}
