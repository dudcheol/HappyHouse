package com.hh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hh.service.HouseMapService;
import com.hh.vo.HouseDealDto;
import com.hh.vo.HouseInfoDto;
import com.hh.vo.SidoGugunCodeDto;

@CrossOrigin
@RestController
public class HappyHouseRestController {

	@Autowired
	HouseMapService service;

	@GetMapping(value = "/map/sido")
	public List<SidoGugunCodeDto> getSido() {
		try {
			List<SidoGugunCodeDto> dto = service.getSido();
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping(value = "/map/gugun/{sido}")
	public List<SidoGugunCodeDto> getGugun(@PathVariable String sido) {
		try {
			return service.getGugunInSido(sido);
		} catch (Exception e) {
			return null;
		}
	}

	@GetMapping(value = "/map/dong/{gugun}")
	public List<HouseInfoDto> getDong(@PathVariable String gugun) {
		try {
			return service.getDongInGugun(gugun);
		} catch (Exception e) {
			return null;
		}
	}

	@GetMapping(value = "/map/housedeal/{dong}")
	public List<HouseDealDto> getHouseDeal(@PathVariable String dong) {
		try {
			return service.getDealsInDong(dong);
		} catch (Exception e) {
			return null;
		}
	}

	@GetMapping(value = "/map/search/{aptName}")
	public List<HouseDealDto> getSearchByAptName(@PathVariable String aptName) {
		try {
			return service.getSearchByAptName(aptName);
		} catch (Exception e) {
			return null;
		}
	}

	@GetMapping(value = "/map/range")
	public List<HouseDealDto> getHouseDealInRange(@RequestParam(value = "swlat") String swlat,
			@RequestParam(value = "swlng") String swlng, @RequestParam(value = "nelat") String nelat,
			@RequestParam(value = "nelng") String nelng) {
		try {
			return service.getHouseDealInRange(swlat, swlng, nelat, nelng);
		} catch (Exception e) {
			return null;
		}
	}

	@GetMapping(value = "/map/search/latlng")
	public List<HouseDealDto> getSearchByLatLng(@RequestParam(value = "lat") String lat,
			@RequestParam(value = "lng") String lng) {
		try {
			return service.getSearchByLatLng(lat, lng);
		} catch (Exception e) {
			return null;
		}
	}

}
