package com.project.register;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = "com.project.register")
public class RegisterMicroserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(RegisterMicroserviceApplication.class, args);
	}

}
