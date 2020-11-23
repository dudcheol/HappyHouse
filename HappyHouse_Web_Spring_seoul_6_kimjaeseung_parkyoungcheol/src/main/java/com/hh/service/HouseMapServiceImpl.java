package com.hh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hh.dao.HouseMapDao;
import com.hh.vo.HouseDealDto;
import com.hh.vo.HouseInfoDto;
import com.hh.vo.SidoGugunCodeDto;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
	@Autowired
	private HouseMapDao dao;

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return dao.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return dao.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return dao.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return dao.getAptInDong(dong);
	}

	@Override
	public List<HouseDealDto> getDealsInDong(String dong) throws Exception {
		return dao.getDealsInDong(dong);
	}

	@Override
	public List<HouseDealDto> getSearchByAptName(String aptName) throws Exception {
		return dao.getSearchByAptName(aptName);
	}

	@Override
	public List<HouseDealDto> getHouseDealInRange(String swlat, String swlng, String nelat, String nelng)
			throws Exception {
		return dao.getHouseDealInRange(swlat, swlng, nelat, nelng);
	}

}
