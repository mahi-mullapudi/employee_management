package com.tutorialq.services;

import com.tutorialq.entities.Employee;

public interface EmployeeService {

    /**
     * Returns Employee object for a given EmployeeId.
     *
     * @param employeeId
     * @return
     * @throws Exception
     */
    public Employee getEmployeeByEmployeeId(long employeeId) throws Exception;

    /**
     * Returns true if the email already exist for an active Employee record.
     *
     * @param emailAddress
     * @return
     * @throws Exception
     */
    public boolean checkIfEmployeeIdExists(String emailAddress) throws Exception;
}
