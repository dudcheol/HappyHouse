//package com.hh.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import com.hh.vo.UserDto;
//
//public class LoginDaoImpl implements LoginDao {
//
//	@Override
//	public UserDto login(String userid, String userpwd) throws SQLException {
//		UserDto userDto = null;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select * \n");
//			sql.append("from ssafy_member \n");
//			sql.append("where userid = ? and userpwd = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, userid);
//			pstmt.setString(2, userpwd);
//			rs = pstmt.executeQuery();
//			rs.next();
//			//System.out.println(rs.getString(2));
//			String username = rs.getString(2);
//			String email = rs.getString(4);
//			String address = rs.getString(5);
//			String joindate = rs.getString(6);
//			//System.out.println(username);
//			userDto = new UserDto(userid, username, userpwd, email, address, joindate);
//			//System.out.println(UserDto);
//		} catch (SQLException e) {
//			e.printStackTrace();
//			userDto = null;
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//		//System.out.println(UserDto);
//		return userDto;
//	}
//
//	@Override
//	public void modify(String org_userid, String org_userpwd, String username, String address, String email, String password) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("update ssafy_member \n");
//			sql.append("set username=? \n");
//			sql.append("and address=? \n");
//			sql.append("and email=? \n");
//			sql.append("and userpwd=? \n");
//			sql.append("where userid=? and userpwd = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, username);
//			pstmt.setString(2, address);
//			pstmt.setString(3, email);
//			pstmt.setString(4, password);
//			pstmt.setString(5, org_userid);
//			pstmt.setString(6, org_userpwd);
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//	}
//
//	@Override
//	public void join(String userid, String username, String userpwd, String email) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("insert into ssafy_member(userid, username, userpwd, email, joindate) values(?, ?, ?, ?, sysdate())");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, userid);
//			pstmt.setString(2, username);
//			pstmt.setString(3, userpwd);
//			pstmt.setString(4, email);
//			pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//	}
//}
