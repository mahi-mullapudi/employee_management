package com.tutorialq.services;

import com.tutorialq.entities.ClientDetail;
import com.tutorialq.entities.Employee;
import com.tutorialq.entities.ImmigrationDetail;

import java.util.List;

public interface EmployeeService {

    /**
     * List of Active Employee Details Summary Information.
     *
     * @return
     * @throws Exception
     */
    List<Employee> getEmployeeDetailsSummary() throws Exception;

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
    List<ClientDetail> getClientDetailsSummary(long employeeId) throws Exception;

    /**
     * Returns ClientDetails object for a given clientDetailsId object.
     *
     * @param clientDetailsId
     * @return
     * @throws Exception
     */
    ClientDetail getClientDetails(long clientDetailsId) throws Exception;

    /**
     * Returns ImmigrationDetails object for a given Immigration Details Id.
     *
     * @return
     * @throws Exception
     */
    ImmigrationDetail getImmigrationDetails(long immigrationDetailsId) throws Exception;

    /**
     * Save Client Details.
     *
     * @throws Exception
     */
    void saveClientDetails(ClientDetail clientDetails) throws Exception;

    /**
     * Save Client Details by getting the Employee object and setting it.
     *
     * @throws Exception
     */
    void saveClientDetails(long employeeId, ClientDetail clientDetails) throws Exception;

    /**
     * Save Immigration Details.
     *
     * @param immigrationDetails
     * @throws Exception
     */
    void saveImmigrationDetails(ImmigrationDetail immigrationDetails) throws Exception;

    /**
     * Returns the list of ImmigrationDetails for a given EmployeeId.
     *
     * @param empId
     * @return
     * @throws Exception
     */
    List<ImmigrationDetail> getImmigrationDetailsSummary(long empId) throws Exception;
}
