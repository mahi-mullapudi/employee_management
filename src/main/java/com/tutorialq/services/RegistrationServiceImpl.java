package com.tutorialq.services;

import com.tutorialq.entities.Employee;
import com.tutorialq.repositories.EmployeeRepository;
import com.tutorialq.utils.AuthenticationUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class RegistrationServiceImpl implements RegistrationService {

    @Autowired
    AuthenticationUtils authUtils;
    @Autowired
    EmployeeRepository employeeRepository;

    @Override
    public void saveRegistrationDetails(Employee employee) throws Exception {
        log.info("Inside saveRegistrationDetails of RegistrationServiceImpl: ");
        try {
            employee.setEmpPassword(authUtils.getHashValue(employee.getEmpPassword())); //Generating Hash for the password.
            employeeRepository.save(employee);
        } catch (Exception ex) {
            log.error("Exception while saving the Registration Details", ex);
            throw ex;
        }
    }

    @Override
    public int updatePassword(String password, String emailId) throws Exception {
        log.info("Inside updatePassword of RegistrationServiceImpl:: " + emailId);
        try {
            log.info("Inside updatePassword of RegistrationServiceImpl ");
            return employeeRepository.updatePassword(authUtils.getHashValue(password), emailId);
        } catch (Exception ex) {
            log.error("Exception while saving the Registration Details", ex);
            throw ex;
        }
    }

    @Override
    public int updateEmployeeProfile(Employee employee) throws Exception {
        log.info("Inside update Employee Profile of RegistrationServiceImpl:: ");
        try {
            return employeeRepository.updateEmployeeProfile(employee.getEmployeeFirstName(), employee.getEmployeeLastName(),
                    employee.getEmployeeTitle(), employee.getEmployeePhone(),
                    employee.getEmployeeId());
        } catch (Exception ex) {
            log.error("Exception while saving the Registration Details", ex);
            throw ex;
        }
    }

    @Override
    public int updateStaffProfile(Employee employee) throws Exception {
        log.info("Inside update Staff Profile of RegistrationServiceImpl:: ");
        try {
            return employeeRepository.updateStaffProfile(employee.getEmployeeFirstName(), employee.getEmployeeLastName(),
                    employee.getEmployeeTitle(), employee.getEmployeePhone(),
                    employee.getEmployeeId());
        } catch (Exception ex) {
            log.error("Exception while saving the Registration Details", ex);
            throw ex;
        }
    }
}
