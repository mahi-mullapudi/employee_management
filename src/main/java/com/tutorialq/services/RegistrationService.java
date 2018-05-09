package com.tutorialq.services;

import com.tutorialq.entities.Employee;

public interface RegistrationService {
    /**
     * Method to save User Registration details.
     *
     * @param employee
     * @return
     * @throws Exception
     */
    void saveRegistrationDetails(Employee employee) throws Exception;

    /**
     * Update the password with the temporary password by given Email Id.
     *
     * @param password
     * @param emailId
     * @return
     * @throws Exception
     */
    int updatePassword(String password, String emailId) throws Exception;

    /**
     * Update the profile information for Employee role.
     *
     * @param employee
     * @return
     * @throws Exception
     */
    int updateEmployeeProfile(Employee employee) throws Exception;

    /**
     * Update the profile information for Supervisor role.
     *
     * @param employee
     * @return
     * @throws Exception
     */
    int updateStaffProfile(Employee employee) throws Exception;
}
