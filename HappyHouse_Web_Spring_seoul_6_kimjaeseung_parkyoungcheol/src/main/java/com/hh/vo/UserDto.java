package com.hh.vo;

public class UserDto {
	private String num;
	private String userid;
	private String username;
	private String password;
	private String email;
 
	public UserDto() {
	}

	public UserDto(String num, String userid, String username, String password, String email) {
		this.num = num;
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.email = email;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
