package com.project.register.service;

import org.apache.el.stream.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.register.model.RegisterModel;
import com.project.register.repository.RegisterRepository;

@Service
public class RegisterService {
	
	@Autowired
	RegisterRepository registerRepository;

	public RegisterModel register(RegisterModel registerModel)
	{
		return registerRepository.save(registerModel);
	}
	
	public java.util.Optional<String> getUserName(String userName){
		
		return (java.util.Optional<String>) registerRepository.findByUserName(userName);
	}
	
	public java.util.Optional<String> getEmail(String email)
	{
		return registerRepository.findByEmail(email);
	}

}
