package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.HouseDetailDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.HouseMapService;


@RestController
@RequestMapping("/map")
public class HouseMapController {
	
	@Autowired
	private HouseMapService houseMapService;

	@GetMapping(value = "" , headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getSido() throws Exception{
		//System.out.println("getSido");
		return houseMapService.getSido();
	}
	@GetMapping(value = "/{sido}", headers = { "Content-type=application/json" })
	public List<SidoGugunCodeDto> getGugun(@PathVariable String sido) throws Exception{
		//System.out.println("getGugun");
		return houseMapService.getGugunInSido(sido);
	}
	@GetMapping(value = "/{sido}/{gugun}", headers = { "Content-type=application/json" })
	public List<HouseInfoDto> getDong(@PathVariable String gugun) throws Exception{
		return houseMapService.getDongInGugun(gugun);
	}
	@GetMapping(value = "/{sido}/{gugun}/{dong}/{type}", headers = { "Content-type=application/json" })
	public List<HouseInfoDto> getApt(@PathVariable String dong, @PathVariable String type) throws Exception{
		return houseMapService.getAptInDong(dong, type);
	}
	
	@GetMapping(value = "/all" , headers = { "Content-type=application/json" })
	public List<HouseDetailDto> getAll() throws Exception{
		//System.out.println("getSido");
		return houseMapService.getAll();
	}
}