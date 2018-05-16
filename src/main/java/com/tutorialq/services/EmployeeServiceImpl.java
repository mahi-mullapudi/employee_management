package com.tutorialq.services;

import com.tutorialq.entities.ClientDetails;
import com.tutorialq.entities.Employee;
import com.tutorialq.entities.ImmigrationDetails;
import com.tutorialq.repositories.ClientDetailsRepository;
import com.tutorialq.repositories.EmployeeRepository;
import com.tutorialq.repositories.ImmigrationDetailsRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeRepository employeeRepository;
    @Autowired
    ClientDetailsRepository clientRepository;
    @Autowired
    ImmigrationDetailsRepository immigrationRepository;

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

    @Override
    public ClientDetails getClientDetails(long clientDetailsId) throws Exception {
        log.info("Inside getClientDetails method of EmployeeServiceImpl:: clientDetailsId: " + clientDetailsId);
        return clientRepository.findById(clientDetailsId).orElse(new ClientDetails());
    }

    @Override
    public void saveClientDetails(ClientDetails clientDetails) throws Exception {
        log.info("Inside the saveClientDetails method of EmployeeServiceImpl");
        clientRepository.save(clientDetails);
    }

    @Override
    public ImmigrationDetails getImmigrationDetails(long immigrationDetailsId) throws Exception {
        log.info("Inside the getImmigrationDetails method of EmployeeServiceImpl");
        return immigrationRepository.findById(immigrationDetailsId).orElse(new ImmigrationDetails());
    }

    @Override
    public void saveImmigrationDetails(ImmigrationDetails immigrationDetails) throws Exception {
        log.info("Inside the saveImmigrationDetails method of EmployeeServiceImpl");
        immigrationRepository.save(immigrationDetails);
    }

}

