package com.restapi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.restapi.entity.Employee;
import com.restapi.service.EmployeeService;

@RestController
@RequestMapping("/employees")
public class MyController {

	
	private EmployeeService employeeService;
	
	
	@Autowired
	public MyController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}


	@GetMapping
	public List<Employee> getAllEmployee(){
		return this.employeeService.getAllEmployee();
	}
	
	@PostMapping
	public Employee saveEmployee(@RequestBody Employee employee) {
		return this.employeeService.save(employee);
	}
	
	@GetMapping("/{id}")
	public Employee getById(@PathVariable int id) {
		return this.employeeService.getById(id);
	}

	@PutMapping
	public Employee updateEmployee(@RequestBody Employee theEmployee) {
		
		employeeService.save(theEmployee);
		
		return theEmployee;
	}

	@DeleteMapping("/{employeeId}")
	public String deleteEmployee(@PathVariable int employeeId) {
		
		employeeService.deleteById(employeeId);
		
		return "Deleted employee id - " + employeeId;
	}

	
}
