package com.project.log.RestTemplate;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class getTemplate {
	
	@Bean
	public RestTemplate  createTemplate() {
		
		return new RestTemplate();
	}

}
