package com.tutorialq.services;

import com.tutorialq.entities.Employee;
import com.tutorialq.repositories.EmployeeRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeRepository employeeRepository;

    @Override
    public Employee getEmployeeByEmployeeId(long employeeId) throws Exception {
        log.info("Inside getEmployeeByEmployeeId method of EmployeeServiceImpl: " + employeeId);
        return employeeRepository.findById(employeeId).orElse(new Employee());
    }

    @Override
    public boolean checkIfEmployeeIdExists(String emailAddress) throws Exception {
        log.info("Inside checkIfEmployeeIdExists method of EmployeeServiceImpl:: emailAddress: " + emailAddress);
        return employeeRepository.countEmployeeByEmployeeEmailId(emailAddress) > 0;
    }
}

