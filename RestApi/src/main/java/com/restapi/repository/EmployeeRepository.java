package com.restapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.restapi.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer>{

}
