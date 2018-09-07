package com.tutorialq.services;


import com.tutorialq.entities.Employee;

/**
 * Maintains methods for Authenticating users based
 * on given UserId and Password.
 */
public interface AuthenticationService {
    /**
     * Returns true if the User account already exist, return false Otherwise.
     *
     * @param emailId
     * @return
     * @throws Exception
     */
    boolean checkEmailIdExists(String emailId) throws Exception;

    /**
     * Authenticates the user based on emailId and password entered in the Login page.
     *
     * @param emailId
     * @param password
     * @return
     * @throws Exception
     */
    boolean authenticatedLogin(String emailId, String password) throws Exception;

    /**
     * Get Employee details by EmailId.
     *
     * @param emailId
     * @return
     * @throws Exception
     */
    Employee getEmployeeByEmailId(String emailId) throws Exception;
}
