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
	
	public String getUserName(String userName){
		java.util.Optional<String> registerUserName = registerRepository.findByUserName(userName);
		return registerUserName.orElse(null);
	}
	
	public java.util.Optional<String> getEmail(String email)
	{
		return registerRepository.findByEmail(email);
	}

	public String getPassword(String name) {
		
		return registerRepository.getPassword(name);
	}

	public String getUserId(String name) {
		return registerRepository.getUserId(name);
	}

}
