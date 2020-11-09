//package com.hh.service;
//
//import com.hh.dao.LoginDao;
//import com.hh.dao.LoginDaoImpl;
//import com.hh.vo.UserDto;
//
//public class LoginServiceImpl implements LoginService {
//
//	LoginDao loginDao;
//	
//	public LoginServiceImpl() {
//		loginDao = new LoginDaoImpl();
//	}
//	
//	@Override
//	public UserDto login(String userid, String userpwd) throws Exception {
//		if(userid == null || userpwd == null)
//			return null;
//		return loginDao.login(userid, userpwd);
//	}
//
//	@Override
//	public void modify(String org_userid, String org_userpwd, String username, String address, String email, String password) {
//		loginDao.modify(org_userid, org_userpwd, username, address, email, password);
//	}
//
//	@Override
//	public void join(String userid, String username, String userpwd, String email) {
//		loginDao.join(userid, username, userpwd, email);
//	}
//	
//}
