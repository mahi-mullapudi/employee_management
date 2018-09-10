package com.tutorialq.web.restControllers;

import com.tutorialq.entities.ClientDetail;
import com.tutorialq.entities.Employee;
import com.tutorialq.entities.ImmigrationDetail;
import com.tutorialq.services.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
            log.error("Exception while getting Employee Details Summary: ", ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/clientDetailsSummary")
    public ResponseEntity<List<ClientDetail>> getClientDetailsSummary(@RequestParam("empId") Long empId) {
        log.info("Inside getClientDetailsSummary method of Employee Rest Controller..");
        try {
            List<ClientDetail> clientDetailsSummary = employeeService.getClientDetailsSummary(empId);
            return new ResponseEntity(clientDetailsSummary, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Client Details Summary: ", ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/clientDetailById")
    public ResponseEntity<ClientDetail> getClientDetailById(@RequestParam("clientDetailsId") Long clientDetailsId) {
        log.info("Inside getClientDetailById method of Employee Rest Controller:: clientDetailsId: " + clientDetailsId);
        try {
            ClientDetail clientDetail = employeeService.getClientDetails(clientDetailsId);
            return new ResponseEntity(clientDetail, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Client Detail: ", ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/immigrationDetails")
    public ResponseEntity<List<ImmigrationDetail>> getImmigrationDetailsSummary(@RequestParam("empId") Long empId) {
        log.info("Inside getImmigrationDetailsSummary method of Employee Rest Controller:: empId: " + empId);
        try {
            List<ImmigrationDetail> immigrationDetailList = employeeService.getImmigrationDetailsSummary(empId);
            return new ResponseEntity(immigrationDetailList, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Client Details Summary: ", ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/immigrationDetailById")
    public ResponseEntity<ImmigrationDetail> getImmigrationDetailById(@RequestParam("immigrationDetailId") Long immigrationDetailId) {
        log.info("Inside getImmigrationDetailById method of Employee Rest Controller:: immigrationDetailsId: " + immigrationDetailId);
        try {
            ImmigrationDetail immigrationDetail = employeeService.getImmigrationDetails(immigrationDetailId);
            return new ResponseEntity(immigrationDetail, new HttpHeaders(), HttpStatus.OK);
        } catch (Exception ex) {
            log.error("Exception while getting Immigration Detail: ", ex);
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

}
