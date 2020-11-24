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
	public List<HouseDealDto> getHouseDealInRange(String swlat, String swlng, String nelat, String nelng) throws Exception;
	public List<HouseDealDto> getSearchByLatLng(String lat, String lng) throws Exception;
	public List<HouseDealDto> getHouseDealInRangeByPrice(String swlat, String swlng, String nelat, String nelng,
			String price) throws Exception;
	
}
