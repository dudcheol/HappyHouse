package com.hh.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hh.mapper.HouseMapper;
import com.hh.vo.HouseDealDto;
import com.hh.vo.HouseInfoDto;
import com.hh.vo.SidoGugunCodeDto;

@Repository
public class HouseMapDaoImpl implements HouseMapDao {

	@Autowired
	private HouseMapper mapper;
	
	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return mapper.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return mapper.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return mapper.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return mapper.getAptInDong(dong);
	}

	@Override
	public List<HouseDealDto> getDealsInDong(String dong) throws Exception {
		return mapper.getDealsInDong(dong);
	}

	@Override
	public List<HouseDealDto> getSearchByAptName(String aptName) throws Exception {
		return mapper.getSearchByAptName(aptName);
	}

	@Override
	public List<HouseDealDto> getHouseDealInRange(String swlat, String swlng, String nelat, String nelng)
			throws Exception {
		return mapper.getHouseDealInRange(swlat, swlng, nelat, nelng);
	}

}
