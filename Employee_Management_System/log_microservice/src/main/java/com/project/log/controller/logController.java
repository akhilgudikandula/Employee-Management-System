package com.project.log.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/log")
public class logController {
	
	@Autowired
	RestTemplate template;
	
	@GetMapping("/login")
	public String loginPage() {
		
		return "login";
	}
	
	@PostMapping("/loginuser")
	public String login( @RequestParam String userName, @RequestParam String password,HttpSession session,Model model) {
		
		
		String userNameUri = "http://localhost:9191/getname/"+userName;
		String passwordUri = "http://localhost:9191/getpassword/"+userName;
		
		
		String registeredUserName=template.getForObject(userNameUri, String.class);
		String registeredPassword = template.getForObject(passwordUri, String.class);
		
		if( registeredUserName==null || registeredUserName.trim().isEmpty()) {
			model.addAttribute("userNameErrorMessage", "*user not registered");
			return "login";
		}else if (password != null && password.equals(registeredPassword)) {
			String userIdUri = ("http://localhost:9191/getId/"+userName);
			long userId = Long.parseLong(template.getForObject(userIdUri, String.class));
			session.setAttribute("userName", registeredUserName);
			session.setAttribute("userId", userId);
            return "redirect:http://localhost:9393/employee/adminemployeelist"; 
        } else {
            model.addAttribute("passwordErrorMessage", "*Incorrect password");
            return "login";
        }
		
	
	}

}
