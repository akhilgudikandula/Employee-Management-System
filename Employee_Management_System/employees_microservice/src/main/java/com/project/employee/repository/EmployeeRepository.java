package com.project.employee.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.employee.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>{
	
	@Query("select e.empId,e.empName,e.empJob,e.empLocation,e.empHireDate,e.empSalary from Employee e")
	public List<Object[]> employeeList();

	
	@Query("select e.empId,e.empName,e.empJob,e.empLocation,e.empHireDate,e.empSalary from Employee e where e.empId=?1")
	public List<Object[]> searchById(String searchData);

	@Query("select e.empId,e.empName,e.empJob,e.empLocation,e.empHireDate,e.empSalary from Employee e where e.empName like ?1% ")
	public List<Object[]> searchByName(String searchData);

	@Query("select e.empId,e.empName,e.empJob,e.empLocation,e.empHireDate,e.empSalary from Employee e where e.empJob like ?1% ")
	public List<Object[]> searchByJob(String searchData);

	@Query("select e.empId,e.empName,e.empJob,e.empLocation,e.empHireDate,e.empSalary from Employee e where e.empLocation like ?1% ")
	public List<Object[]> searchByLocation(String searchData);

    @Query("select e.empId from Employee e where e.empId=?1")
	public Optional<Long> getEmpId(long id);

   

}
