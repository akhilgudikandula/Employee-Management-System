package com.project.employee.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.employee.model.Employee;
import com.project.employee.service.EmployeeService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/main")
    public String main() {
    	return "mainindex";
    }
 
    @GetMapping("/employeelist")
    public String employeeList(Model model) {
        List<Object[]> employeeList = employeeService.employeeList();
        model.addAttribute("list", employeeList);
        return "employeelist";
    }
    
    @GetMapping("/edit/{empId}")
    public String editEmployee(@PathVariable long empId,Model model) {
    	Optional<Employee> emp = employeeService.editEmployee(empId);
    	if(emp.isPresent()) {
    		Employee employee = emp.get();
    	model.addAttribute("employee",employee);
    	return"editemployee";
    	}else {
    		return"redirect:/employee/adminemployeelist";
    	}
    }

    @PostMapping("/editemployee")
    public String edtEmployee(Employee updateEmployee,Model model,HttpSession session) {
    	Employee employee = (Employee) model.getAttribute("employee");
    	employee.setAdminId((Long) session.getAttribute("userId"));
    	employee.setEmpName(updateEmployee.getEmpName());
    	employee.setEmpJob(updateEmployee.getEmpJob());
    	employee.setEmpLocation(updateEmployee.getEmpLocation());
    	employee.setEmpHireDate(updateEmployee.getEmpHireDate());
    	employee.setEmpSalary(updateEmployee.getEmpSalary());
    	employeeService.addEmployee(employee);
    	return"redirect:/employee/adminemployeelist";
    }
  
    @PostMapping("/searchby")
    public String searchBy(@RequestParam(name = "searchData") String searchData, 
                           @RequestParam(name = "searchBy") String searchBy, Model model) {
        List<Object[]> employeeList = null;

        if (searchBy == null || searchBy.isEmpty()) {
            
            employeeList = employeeService.employeeList();
        } else {
            switch (searchBy) {
                case "Id":
                	
;                    employeeList = employeeService.searchById(searchData);
                    break;
                case "Name":
                    employeeList = employeeService.searchByName(searchData);
                    break;
                case "Job":
                    employeeList = employeeService.searchByJob(searchData);
                    break;
                case "Location":
                    employeeList = employeeService.searchByLocation(searchData);
                    break;
                default:
                   
                    employeeList = employeeService.employeeList();
                    break;
            }
        }
        
        model.addAttribute("list", employeeList);
        
        return "employeelist";
        
    }

    
    @GetMapping("/adminemployeelist")
    public String adminEmployeeList(Model model,HttpSession session) {
    	List<Employee> list= employeeService.adminEmployeeList();
    	
    	model.addAttribute("list",list);
    	String userName=(String) session.getAttribute("userName");
    	if(userName==null ) {
    		return"redirect:http://localhost:9292/log/login";
    	}else {
    		
    	return "adminemployeelist";
    	}
    }
    
    @PostMapping("/add")
    public String addEmployee(@ModelAttribute Employee employee, HttpSession session,Model model) {
    	
    	long adminId = (Long) session.getAttribute("userId");
    	employee.setAdminId(adminId);
    	Optional<Long> empId=employeeService.getEmpId(employee.getEmpId());
    	if(empId.isPresent()) {
    		model.addAttribute("empIdErrorMessage", "user already registered");
    		
        	List<Employee> list = employeeService.adminEmployeeList();
        	model.addAttribute("list",list);
    		return "adminemployeelist";
    	
    	}else {
    	employeeService.addEmployee(employee);
    	
    	return"redirect:/employee/adminemployeelist";
    	}
    	
    }
    
    @GetMapping("/delete/{empId}")
    public String delete(@PathVariable long empId,Model model) {
    	employeeService.deleteEmp(empId);
    	return"redirect:/employee/adminemployeelist";
    }
    
    @GetMapping("/logout")
    public String logOut(HttpSession session) {
    	session.invalidate();
    	return"redirect:http://localhost:9292/log/login";
    }
}
