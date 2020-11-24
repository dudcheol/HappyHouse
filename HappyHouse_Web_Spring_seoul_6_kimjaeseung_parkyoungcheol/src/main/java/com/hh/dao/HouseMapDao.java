package com.hh.dao;

import java.util.List;

import com.hh.vo.HouseDealDto;
import com.hh.vo.HouseInfoDto;
import com.hh.vo.SidoGugunCodeDto;

public interface HouseMapDao {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseDealDto> getSearchByAptName(String aptName) throws Exception;
	List<HouseDealDto> getDealsInDong(String dong) throws Exception;
	List<HouseDealDto> getHouseDealInRange(String swlat, String swlng, String nelat, String nelng) throws Exception;
	List<HouseDealDto> getSearchByLatLng(String lat, String lng) throws Exception;
	List<HouseDealDto> getHouseDealInRangeByPrice(String swlat, String swlng, String nelat, String nelng, String price) throws Exception;
	
}
