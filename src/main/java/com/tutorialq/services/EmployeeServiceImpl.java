package com.tutorialq.services;

import com.tutorialq.entities.ClientDetail;
import com.tutorialq.entities.Employee;
import com.tutorialq.entities.ImmigrationDetail;
import com.tutorialq.exceptions.CustomException;
import com.tutorialq.repositories.ClientDetailRepository;
import com.tutorialq.repositories.EmployeeRepository;
import com.tutorialq.repositories.ImmigrationDetailRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeRepository employeeRepository;
    @Autowired
    ClientDetailRepository clientRepository;
    @Autowired
    ImmigrationDetailRepository immigrationRepository;

    @Override
    public List<Employee> getEmployeeDetailsSummary() throws Exception {
        log.info("Inside getEmployeeDetailsSummary method of EmployeeServiceImpl: ");
        return employeeRepository.findAll();
    }

    @Override
    public Employee getEmployeeById(long employeeId) throws Exception {
        log.info("Inside getEmployeeById method of EmployeeServiceImpl: " + employeeId);
        return employeeRepository.findById(employeeId).orElse(new Employee());
    }

    @Override
    public boolean checkIfEmployeeIdExists(String emailAddress) throws Exception {
        log.info("Inside checkIfEmployeeIdExists method of EmployeeServiceImpl:: emailAddress: " + emailAddress);
        return employeeRepository.countEmployeeByEmployeeEmailId(emailAddress) > 0;
    }

    @Override
    public List<ClientDetail> getClientDetailsSummary(long employeeId) throws Exception {
        log.info("Inside getClientDetailsSummary method of EmployeeServiceImpl:: employeeId: " + employeeId);
        return clientRepository.findAllByEmployeeEmployeeIdOrderByCreatedAtDesc(employeeId);
    }

    @Override
    public ClientDetail getClientDetails(long clientDetailsId) throws Exception {
        log.info("Inside getClientDetails method of EmployeeServiceImpl:: clientDetailsId: " + clientDetailsId);
        return clientRepository.findById(clientDetailsId).orElse(new ClientDetail());
    }

    @Override
    public void saveClientDetails(ClientDetail clientDetails) throws Exception {
        log.info("Inside the saveClientDetails method of EmployeeServiceImpl");
        clientRepository.save(clientDetails);

    }

    @Override
    public void saveClientDetails(long empId, ClientDetail clientDetails) throws Exception {
        log.info("Inside the saveClientDetails method of EmployeeServiceImpl:: empId: " + empId);
        employeeRepository.findById(empId).map(employee -> {
            clientDetails.setEmployee(employee);
            return clientRepository.save(clientDetails);
        }).orElseThrow(() -> new CustomException("empId " + empId + " not found"));
    }

    @Override
    public List<ImmigrationDetail> getImmigrationDetailsSummary(long employeeId) throws Exception {
        log.info("Inside the getImmigrationDetailsSummary method of EmployeeServiceImpl");
        return immigrationRepository.findAllByEmployeeEmployeeId(employeeId);
    }

    @Override
    public ImmigrationDetail getImmigrationDetails(long immigrationDetailsId) throws Exception {
        log.info("Inside the getImmigrationDetails method of EmployeeServiceImpl");
        return immigrationRepository.findById(immigrationDetailsId).orElse(new ImmigrationDetail());
    }

    @Override
    public void saveImmigrationDetails(ImmigrationDetail immigrationDetails) throws Exception {
        log.info("Inside the saveImmigrationDetails method of EmployeeServiceImpl");
        immigrationRepository.save(immigrationDetails);
    }

}

