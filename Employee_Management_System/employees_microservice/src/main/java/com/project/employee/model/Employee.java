package com.project.employee.model;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="employee")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
	
	@Id
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long empId;
	private String empName;
	private String empJob;
	private String empLocation;
	private Date empHireDate;
	private double empSalary;
	private long adminId;
	

}
