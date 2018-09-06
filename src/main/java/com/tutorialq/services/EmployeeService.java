package com.tutorialq.services;

import com.tutorialq.entities.ClientDetails;
import com.tutorialq.entities.Employee;
import com.tutorialq.entities.ImmigrationDetails;

import java.util.List;

public interface EmployeeService {

    /**
     * Returns Employee object for a given EmployeeId.
     *
     * @param employeeId
     * @return
     * @throws Exception
     */
    Employee getEmployeeById(long employeeId) throws Exception;

    /**
     * Returns true if the email already exist for an active Employee record.
     *
     * @param emailAddress
     * @return
     * @throws Exception
     */
    boolean checkIfEmployeeIdExists(String emailAddress) throws Exception;

    /**
     * Returns Client Details Summary for a given EmployeeId.
     *
     * @param employeeId
     * @return
     * @throws Exception
     */
    List<ClientDetails> getClientDetailsSummary(long employeeId) throws Exception;

    /**
     * Returns ClientDetails object for a given clientDetailsId object.
     *
     * @param clientDetailsId
     * @return
     * @throws Exception
     */
    ClientDetails getClientDetails(long clientDetailsId) throws Exception;

    /**
     * Returns ImmigrationDetails object for a given Immigration Details Id.
     *
     * @return
     * @throws Exception
     */
    ImmigrationDetails getImmigrationDetails(long immigrationDetailsId) throws Exception;

    /**
     * Save Client Details.
     *
     * @throws Exception
     */
    void saveClientDetails(ClientDetails clientDetails) throws Exception;

    /**
     * Save Client Details by getting the Employee object and setting it.
     *
     * @throws Exception
     */
    void saveClientDetails(long employeeId, ClientDetails clientDetails) throws Exception;

    /**
     * Save Immigration Details.
     *
     * @param immigrationDetails
     * @throws Exception
     */
    void saveImmigrationDetails(ImmigrationDetails immigrationDetails) throws Exception;

    /**
     * Returns the list of ImmigrationDetails for a given EmployeeId.
     *
     * @param empId
     * @return
     * @throws Exception
     */
    List<ImmigrationDetails> getImmigrationDetailsSummary(long empId) throws Exception;
}
