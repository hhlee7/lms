package com.example.afterSchoolLms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@ServletComponentScan
@SpringBootApplication
@EnableAsync
@MapperScan("com.example.afterSchoolLms.mapper")
public class AfterSchoolLmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(AfterSchoolLmsApplication.class, args);
	}

}
