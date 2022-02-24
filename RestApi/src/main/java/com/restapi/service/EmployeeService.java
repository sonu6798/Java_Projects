package com.restapi.service;

import java.util.List;

import com.restapi.entity.Employee;

public interface EmployeeService {

	public Employee save(Employee employee);
	
	public List<Employee> getAllEmployee();
	
	public Employee getById(int id);
	
	public Employee update(Employee employee);
	
	public void deleteById(int id);
}
