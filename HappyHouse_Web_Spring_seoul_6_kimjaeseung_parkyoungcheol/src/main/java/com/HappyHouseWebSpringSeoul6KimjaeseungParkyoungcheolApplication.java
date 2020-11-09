package com;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.hh.mapper")
public class HappyHouseWebSpringSeoul6KimjaeseungParkyoungcheolApplication {

	public static void main(String[] args) {
		SpringApplication.run(HappyHouseWebSpringSeoul6KimjaeseungParkyoungcheolApplication.class, args);
	}

}
