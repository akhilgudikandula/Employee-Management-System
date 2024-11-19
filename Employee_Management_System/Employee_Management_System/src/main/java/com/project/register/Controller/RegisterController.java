package com.project.register.Controller;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.register.model.RegisterModel;
import com.project.register.service.RegisterService;

import jakarta.servlet.ServletException;

@Controller
public class RegisterController {
	@Autowired
	RegisterService registerService;
	
	@GetMapping("/register")
	public String registerPage()
	{
		return "register";
	}
	
	@PostMapping("/registeremp")
	public String register(@ModelAttribute RegisterModel registerModel,Model model)
	{
		Optional<String> registeredUserName =  registerService.getUserName(registerModel.getUserName()) ;
		Optional<String> registeredEmail = registerService.getEmail(registerModel.getEmail());
		if(registeredUserName.isPresent() && registeredEmail.isPresent()) {
			model.addAttribute("userNameErrorMessage", "*username already taken");
			model.addAttribute("emailErrorMessage","* email already registered");
			return "register";
		}else if (registeredUserName.isPresent()) {
			
			model.addAttribute("userNameErrorMessage", "*username already taken");
			return "register";
			
		}else if (registeredEmail.isPresent()) {
			model.addAttribute("emailErrorMessage","* email already registered");
			return "register";
		}
		else {
		registerService.register(registerModel);
		return "registeredsuccessfully";
		}
	}

}
