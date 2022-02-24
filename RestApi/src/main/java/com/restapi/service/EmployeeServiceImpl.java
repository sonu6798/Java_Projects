package com.restapi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.restapi.entity.Employee;
import com.restapi.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Override
	public Employee save(Employee employee) {
		
		return employeeRepository.save(employee);
	}
	
	@Override
	public List<Employee> getAllEmployee() {
		
		return employeeRepository.findAll();
	}
	
	@Override
	public Employee getById(int id) {
		
		return employeeRepository.getById(id);
	}

	@Override
	public Employee update(Employee employee) {
		
		return employeeRepository.save(employee);
	}

	@Override
	public void deleteById(int id) {
		employeeRepository.deleteById(id);
	}
	
	

	
}
