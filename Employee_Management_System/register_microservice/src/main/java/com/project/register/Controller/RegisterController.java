package com.project.register.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.register.model.RegisterModel;
import com.project.register.service.RegisterService;

@Controller
//@RequestMapping("/register")
public class RegisterController {
	@Autowired
	RegisterService registerService;
	
	@GetMapping("/index")
	public String registerPage()
	{
		return "index";
	}
	
	@GetMapping("/getname/{name}")
	@ResponseBody
	public String getUserName(@PathVariable String name) {
		
		return registerService.getUserName(name);
	}
	
	@GetMapping("/getpassword/{name}")
	@ResponseBody
	public String getPassword(@PathVariable String name) {
		
		return registerService.getPassword(name);
	}
	
	@GetMapping("/getId/{name}")
	@ResponseBody
	public String getUserId(@PathVariable String name) {
		return registerService.getUserId(name);
	}
	
	@PostMapping("/registeremp")
	public String register(@ModelAttribute RegisterModel registerModel,Model model)
	{
		String registeredUserName =  registerService.getUserName(registerModel.getUserName()) ;
		Optional<String> registeredEmail = registerService.getEmail(registerModel.getEmail());
		if(registeredUserName != null && registeredEmail.isPresent()) {
			model.addAttribute("userNameErrorMessage", "*username already taken");
			model.addAttribute("emailErrorMessage","* email already registered");
			return "index";
		}else if (registeredUserName != null) {
			
			model.addAttribute("userNameErrorMessage", "*username already taken");
			return "index";
			
		}else if (registeredEmail.isPresent()) {
			model.addAttribute("emailErrorMessage","* email already registered");
			return "index";
		}
		else {
		registerService.register(registerModel);
		model.addAttribute("registrationSucess","user registration sucessfull");
		return "redirect:http://localhost:9292/log/login";
		}
		
		
	}

}
