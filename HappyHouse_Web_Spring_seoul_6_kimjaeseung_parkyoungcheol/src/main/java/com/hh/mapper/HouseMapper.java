package com.hh.mapper;

import java.util.List;

import com.hh.vo.HouseDealDto;
import com.hh.vo.HouseInfoDto;
import com.hh.vo.SidoGugunCodeDto;

public interface HouseMapper {

	public List<SidoGugunCodeDto> getSido() throws Exception;
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	public List<HouseDealDto> getDealsInDong(String dong) throws Exception;
	public List<HouseDealDto> getSearchByAptName(String aptName) throws Exception;
	
}
