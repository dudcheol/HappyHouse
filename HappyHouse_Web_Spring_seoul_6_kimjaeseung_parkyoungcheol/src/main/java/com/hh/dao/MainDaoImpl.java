//package com.hh.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.stereotype.Repository;
//
//import com.hh.mapper.HouseMapper;
//import com.hh.vo.HouseInfoDto;
//import com.hh.vo.SidoGugunCodeDto;
//
//import ch.qos.logback.core.db.dialect.DBUtil;
//
//@Repository
//public class MainDaoImpl implements MainDao {
//
//	private HouseMapper mapper;
//
//	@Override
//	public List<SidoGugunCodeDto> getSido() throws Exception {
//		return mapper.getSido();
//	}
//
//	@Override
//	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<SidoGugunCodeDto> list = new ArrayList<SidoGugunCodeDto>();
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("SELECT left(gugun_code,5) gugun_code, gugun_name FROM guguncode \n");
//			sql.append("where left(gugun_code,2) = ?");
//			sql.append("ORDER BY gugun_code");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, sido);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				SidoGugunCodeDto dto = new SidoGugunCodeDto();
//				dto.setGugunCode(rs.getString("gugun_code"));
//				dto.setGugunName(rs.getString("gugun_name"));
//				list.add(dto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//		return list;
//	}
//
//	@Override
//	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<HouseInfoDto> list = new ArrayList<HouseInfoDto>();
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("SELECT distinct dong, code FROM houseinfo \n");
//			sql.append("where code = ? \n");
//			sql.append("ORDER BY dong");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, gugun);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				HouseInfoDto dto = new HouseInfoDto();
//				dto.setCode(rs.getString("code"));
//				dto.setDong(rs.getString("dong"));
//				list.add(dto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//		return list;
//	}
//
//	@Override
//	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<HouseInfoDto> list = new ArrayList<HouseInfoDto>();
//		try {
//			conn = DBUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("SELECT no,dong,AptName,code,jibun FROM houseinfo WHERE dong = ? \n");
//			sql.append("ORDER BY AptName");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, dong);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				HouseInfoDto dto = new HouseInfoDto();
//				dto.setNo(rs.getString("no"));
//				dto.setDong(rs.getString("dong"));
//				dto.setAptName(rs.getString("AptName"));
//				dto.setCode(rs.getString("code"));
//				dto.setJibun(rs.getString("jibun"));
//				list.add(dto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(rs);
//			DBUtil.close(pstmt);
//			DBUtil.close(conn);
//		}
//		return list;
//	}
//
//}
