package com.tutorialq.web.restControllers;

import com.tutorialq.entities.Employee;
import com.tutorialq.services.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
@Slf4j
public class EmployeeRestController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/employeeDetails")
    public ResponseEntity<List<Employee>> getEmpDetailsSummary() {
        log.info("Inside getEmpDetailsSummary method of EmployeeRestController..");
        try {
            List<Employee> employeeDetailsSummary = employeeService.getEmployeeDetailsSummary();
            return new ResponseEntity(employeeDetailsSummary, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Employee Details Summary: " + ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

}
