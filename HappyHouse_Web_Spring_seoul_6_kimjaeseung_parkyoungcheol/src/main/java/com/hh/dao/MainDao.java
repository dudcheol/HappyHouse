package com.hh.dao;

import java.util.List;

import com.hh.vo.HouseInfoDto;
import com.hh.vo.SidoGugunCodeDto;

public interface MainDao {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	
}
