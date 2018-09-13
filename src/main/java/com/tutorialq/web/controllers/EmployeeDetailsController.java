package com.tutorialq.web.controllers;

import com.tutorialq.constants.ApplicationConstants;
import com.tutorialq.entities.ClientDetail;
import com.tutorialq.entities.Employee;
import com.tutorialq.entities.ImmigrationDetail;
import com.tutorialq.exceptions.CustomException;
import com.tutorialq.services.EmailService;
import com.tutorialq.services.EmployeeService;
import com.tutorialq.services.RegistrationService;
import com.tutorialq.utils.EncryptDecryptUtils;
import com.tutorialq.web.validators.ClientDetailsValidator;
import com.tutorialq.web.validators.EmployeeDetailsValidator;
import com.tutorialq.web.validators.ImmigrationDetailsValidator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class EmployeeDetailsController {

    @Autowired
    EmployeeService employeeService;
    @Autowired
    RegistrationService registrationService;
    @Autowired
    EmailService emailService;
    @Autowired
    EmployeeDetailsValidator empDetailsValidator;
    @Autowired
    ClientDetailsValidator clientDetailsValidator;
    @Autowired
    ImmigrationDetailsValidator immigrationDetailsValidator;
    @Autowired
    EncryptDecryptUtils encryptDecryptUtils;

    @GetMapping("/employeeDetailsSummary")
    public String getEmployeeDetailsSummary(Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside getEmployeeDetailsSummary method of EmployeeDetails Controller.");
        return "staff/employeeDetailsSummary";
    }

    @GetMapping("/employeeDetails")
    public String getEmployeeDetails(@RequestParam("empId") Long empId,
                                     Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside getEmployeeDetails method of EmployeeDetails Controller:: empId: " + empId);
        Employee employeeDetails = employeeService.getEmployeeById(empId);
        model.addAttribute("employeeDetails", employeeDetails);
        model.addAttribute("empId", empId);
        //Initiating ModelAndView object with the Employee object
        return "staff/employeeDetails";
    }

    @PostMapping("/employeeDetails")
    public String submitEmployeeDetails(@ModelAttribute("employeeDetails") Employee employeeDetails, BindingResult result,
                                        SessionStatus status, Model model, RedirectAttributes redirectAttributes) {
        log.info("Inside submitEmployeeDetails method of Registration Controller.");
        empDetailsValidator.validate(employeeDetails, result);
        if (result.hasErrors()) {
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Invalid / Missing Information. Please correct the information entered below!!");
            return "staff/employeeDetails";
        }

        log.info("The form has no errors, so persisting the data.");
        try {
            employeeDetails.setNameLastModified(employeeDetails.getEmployeeFullName());
            log.info("Saving the registration details of the Employee.");
            registrationService.saveRegistrationDetails(employeeDetails);
            emailService.sendPlainTextMailWithoutAttachment(ApplicationConstants.fromAddress, employeeDetails.getEmployeeEmailId(),
                    "",
                    "Employee Management - Registration Successful",
                    "This is to confirm that you have successfully created your profile.");
            status.setComplete();
        } catch (Exception ex) {
            log.error("Exception while saving Registration details: " + ex);
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Technical issue while saving the Registration information. " +
                    "Please contact Admin for more information!!");
            return "staff/employeeDetails";
        }
        log.info("Successfully Registered the user, forwarding to the Login page.");
        redirectAttributes.addFlashAttribute("msg", "You have successfully updated Employee Details.");
        redirectAttributes.addFlashAttribute("css", "success");

        return "redirect:/employeeDetails?empId=" + employeeDetails.getEmployeeId();
    }

    @GetMapping("/clientDetailsSummary")
    public String getClientDetailsSummary(@RequestParam("empId") Long empId,
                                          Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside the getClientDetailsSummary method of Employee Details Controller:: empId: " + empId);
        List<ClientDetail> clientDetailsList = employeeService.getClientDetailsSummary(empId);
        model.addAttribute("clientDetailsSummary", clientDetailsList);
        if (clientDetailsList.size() > 0) {
            model.addAttribute("clientDetails", clientDetailsList.get(0));
        }
        return "staff/clientDetails";
    }

    @GetMapping("/clientDetails")
    public String getClientDetails(@RequestParam("empId") Long empId,
                                   Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside getClientDetails method of EmployeeDetails Controller:: empId: " + empId);
        Employee employee = (Employee) session.getAttribute("user");
        //Check if the employee object exist or not one of the Supervisor role or Admin role.
        if (employee == null || (!employee.isSupervisorRole() && !employee.isAdminRole())) {
            log.error("Cannot find employee object in the session, so forwarding to Login page");
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Your role do not have access to view the Client Details. Please login as Supervisor/Admin to continue.");
            return "redirect:/login";
        }
        ClientDetail clientDetails = new ClientDetail();
        clientDetails.setEmployee(employeeService.getEmployeeById(empId));
        model.addAttribute("clientDetails", clientDetails);
        model.addAttribute("empId", empId);
        return "staff/clientDetails";
    }

    @PostMapping("/clientDetails")
    public String submitClientDetails(
            @ModelAttribute("clientDetails") ClientDetail clientDetails, BindingResult result,
            SessionStatus status, Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside submitClientDetails method of EmployeeDetails Controller:: clientDetails: " + clientDetails.getClientDetailsId());
        Employee employee = (Employee) session.getAttribute("user");
        //Check if the employee object exist or not one of the Supervisor role or Admin role.
        if (employee == null || (!employee.isAdminRole())) {
            log.error("Cannot find employee object in the session, so forwarding to Login page");
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Your role do not have access to update the Client Details. Please login as Admin to continue.");
            return "redirect:/login";
        }
        clientDetailsValidator.validate(clientDetails, result);
        if (result.hasErrors()) {
            log.warn("Validation errors: " + result.toString());
            model.addAttribute("showDivFlag", true);
            model.addAttribute("empId", clientDetails.getEmployee().getEmployeeId());
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Invalid / Missing Information. Please correct the Client details information below!!");
            return "staff/clientDetails";
        }
        try {
            log.info("No errors found. Saving the Client details of the Employee.");
            employeeService.saveClientDetails(clientDetails);
            status.setComplete();
        } catch (Exception ex) {
            log.error("Exception while saving Client details: " + ex);
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Technical issue while saving the Client information. " +
                    "Please contact Admin for more information!!");
            throw new CustomException("");
        }
        log.info("Successfully saved the Client Details information!!!");
        redirectAttributes.addFlashAttribute("msg", "You have successfully updated Employee Details.");
        redirectAttributes.addFlashAttribute("css", "success");

        return "redirect:/clientDetails?empId=" + clientDetails.getEmployee().getEmployeeId();
    }

    @GetMapping("/immiDetails")
    public String getImmigrationDetails(@RequestParam("empId") Long empId,
                                        Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside getImmigrationDetails method of EmployeeDetails Controller:: empId: " + empId);
        Employee employee = (Employee) session.getAttribute("user");
        //Check if the employee object exist or not one of the Supervisor role or Admin role.
        if (employee == null || (!employee.isSupervisorRole() && !employee.isAdminRole())) {
            log.error("Cannot find employee object in the session, so forwarding to Login page");
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Your role do not have access to view the Immigration Details. Please login as Supervisor/Admin to continue.");
            return "redirect:/login";
        }
        ImmigrationDetail immigrationDetail = new ImmigrationDetail();
        immigrationDetail.setEmployee(employeeService.getEmployeeById(empId));
        model.addAttribute("empId", empId);
        model.addAttribute("immigrationDetails", immigrationDetail);
        return "staff/immigrationDetails";
    }

    @PostMapping("/immiDetails")
    public String submitImmigrationDetails(
            @ModelAttribute("immigrationDetails") ImmigrationDetail immigrationDetails, BindingResult result,
            SessionStatus status, Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside immigrationDetails method of EmployeeDetails Controller:: immigrationDetailsId: " + immigrationDetails.getImmiDetailsId());
        Employee employee = (Employee) session.getAttribute("user");
        //Check if the employee object exist or not one of the Supervisor role or Admin role.
        if (employee == null || (!employee.isAdminRole())) {
            log.error("Cannot find employee object in the session, so forwarding to Login page");
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Your role do not have access to update the Immigration Details. Please login as Admin to continue.");
            return "redirect:/login";
        }
        immigrationDetailsValidator.validate(immigrationDetails, result);
        if (result.hasErrors()) {
            model.addAttribute("showDivFlag", true);
            model.addAttribute("empId", immigrationDetails.getEmployee().getEmployeeId());
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Invalid / Missing Information. Please correct the information entered below!!");
            return "staff/immigrationDetails";
        }
        try {
            log.info("Saving the immigration details of the Employee.");
            employeeService.saveImmigrationDetails(immigrationDetails);
            status.setComplete();
        } catch (Exception ex) {
            log.error("Exception while saving Immigration details: " + ex);
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Technical issue while saving the Immigration Details. " +
                    "Please contact Admin for more information!!");
            throw new CustomException("");
        }
        log.info("Successfully saved the Client Details information!!!");
        redirectAttributes.addFlashAttribute("msg", "You have successfully updated Immigration Details.");
        redirectAttributes.addFlashAttribute("css", "success");

        return "redirect:/immiDetails?empId=" + immigrationDetails.getEmployee().getEmployeeId();
    }

    @ModelAttribute("skillSetMap")
    public Map<String, String> getSkillSet() {
        return ApplicationConstants.skillMap;
    }

    @ModelAttribute("companyNamesMap")
    public Map<String, String> companyNames() {
        return ApplicationConstants.companyNamesMap;
    }

    @ModelAttribute("empTypeMap")
    public Map<String, String> empTypeMap() {
        return ApplicationConstants.empTypeMap;
    }

    @ModelAttribute("paymentTermsMap")
    public Map<String, String> paymentTermsMap() {
        return ApplicationConstants.paymentTermsMap;
    }

    @ModelAttribute("invoiceFrequencyMap")
    public Map<String, String> invoiceFrequencyMap() {
        return ApplicationConstants.invoiceFrequencyMap;
    }

    @ModelAttribute("immiStatusMap")
    public Map<String, String> immigrtationStatusMap() {
        return ApplicationConstants.immiStatusMap;
    }

}
