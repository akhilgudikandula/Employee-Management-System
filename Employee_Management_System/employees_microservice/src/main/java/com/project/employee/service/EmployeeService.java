package com.project.employee.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.employee.model.Employee;
import com.project.employee.repository.EmployeeRepository;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeRepository employeeRepository;
	
	public List<Object[]> employeeList() {
		
		return employeeRepository.employeeList();
	}
	
	public List<Employee> adminEmployeeList() {
		
		return employeeRepository.findAll();
	}

	

	public List<Object[]> searchById(String searchData) {
		
		return employeeRepository.searchById(searchData);
	}

	public List<Object[]> searchByName(String searchData) {
		
		return employeeRepository.searchByName(searchData);
	}

	public List<Object[]> searchByJob(String searchData) {
		return employeeRepository.searchByJob(searchData);
	}

	public List<Object[]> searchByLocation(String searchData) {
		return employeeRepository.searchByLocation(searchData);
	}

	public void addEmployee(Employee employee) {
		employeeRepository.save(employee);
		
	}
	
	public Optional<Long> getEmpId(long id) {
		return employeeRepository.getEmpId(id);
	}

	public Optional<Employee> editEmployee(long empId) {
		return employeeRepository.findById(empId);
		
	}

	public void deleteEmp(long empId) {
		employeeRepository.deleteById(empId);
		
	}


}
