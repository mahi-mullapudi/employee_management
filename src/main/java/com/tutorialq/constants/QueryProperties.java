package com.tutorialq.constants;

public class QueryProperties {

    public final static String updateEmployeeProfileByEmpId = "UPDATE Employee emp "
            + "SET emp.employeeFirstName = :employeeFirstName, "
            + " emp.employeeLastName = :employeeLastName,"
            + " emp.employeeTitle = :employeeTitle, "
            + " emp.employeePhone = :employeePhone "
            + " WHERE emp.employeeId = :employeeId";

    public final static String updateStaffProfileByEmpId = "UPDATE Employee emp "
            + "SET emp.employeeFirstName = :employeeFirstName, "
            + " emp.employeeLastName = :employeeLastName,"
            + " emp.employeeTitle = :employeeTitle, "
            + " emp.employeePhone = :employeePhone "
            + " WHERE emp.employeeId = :employeeId";

    public final static String updatePassword = "UPDATE Employee emp "
            + " SET emp.empPassword = :password "
            + " WHERE UPPER(emp.employeeEmailId) = UPPER(:emailId)";
}
