package com.example.afterSchoolLms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
@EnableScheduling
@SpringBootApplication
public class AfterSchoolLmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(AfterSchoolLmsApplication.class, args);
	}

}
