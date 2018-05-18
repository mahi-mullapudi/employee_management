package com.tutorialq.web.controllers;

import com.tutorialq.constants.ApplicationConstants;
import com.tutorialq.entities.ClientDetails;
import com.tutorialq.entities.Employee;
import com.tutorialq.entities.ImmigrationDetails;
import com.tutorialq.exceptions.CustomException;
import com.tutorialq.services.EmailService;
import com.tutorialq.services.EmployeeService;
import com.tutorialq.services.RegistrationService;
import com.tutorialq.utils.EncryptDecryptUtils;
import com.tutorialq.web.validators.ClientDetailsValidator;
import com.tutorialq.web.validators.EmployeeDetailsValidator;
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
import java.time.LocalDateTime;
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
    EncryptDecryptUtils encryptDecryptUtils;


    @GetMapping("/employeeDetails")
    public String getEmployeeDetails(@RequestParam("empId") long empId,
                                     Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside getEmployeeDetails method of EmployeeDetails Controller:: empId: " + empId);
        Employee employeeDetails = employeeService.getEmployeeByEmployeeId(empId);
        model.addAttribute("employeeDetails", employeeDetails);
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
            employeeDetails.setDateLastModified(LocalDateTime.now());
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

    @GetMapping("/clientDetails")
    public String getClientDetails(@RequestParam("empId") long empId,
                                   Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside getClientDetails method of EmployeeDetails Controller:: empId: " + empId);
        Employee employee = employeeService.getEmployeeByEmployeeId(empId);
        model.addAttribute("employeeDetails", employee);
        model.addAttribute("clientDetails", employeeService.getClientDetails(empId));
        return "staff/clientDetails";
    }

    @PostMapping("/clientDetails")
    public String submitClientDetails(
            @ModelAttribute("clientDetails") ClientDetails clientDetails, BindingResult result,
            SessionStatus status, Model model, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside submitClientDetails method of EmployeeDetails Controller:: clientDetails: " + clientDetails.getClientDetailsId());
        clientDetailsValidator.validate(clientDetails, result);
        if (result.hasErrors()) {
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Invalid / Missing Information. Please correct the information entered below!!");
            return "staff/clientDetails";
        }
        try {
            log.info("Saving the registration details of the Employee.");
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
    public String getImmigrationDetails(@RequestParam("empId") long empId,
                                        Model model, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside getImmigrationDetails method of EmployeeDetails Controller:: empId: " + empId);
        ImmigrationDetails immigrationDetails = employeeService.getImmigrationDetails(empId);
        model.addAttribute("immigrationDetails", immigrationDetails);
        return "staff/immigrationDetails";
    }

    @PostMapping("/immiDetails")
    public String submitImmigrationDetails(
            @ModelAttribute("clientDetails") ImmigrationDetails immigrationDetails, BindingResult result,
            SessionStatus status, Model model, RedirectAttributes redirectAttributes) throws Exception {
        log.info("Inside immigrationDetails method of EmployeeDetails Controller:: immigrationDetailsId: " + immigrationDetails.getImmiDetailsId());
        clientDetailsValidator.validate(immigrationDetails, result);
        if (result.hasErrors()) {
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
            model.addAttribute("msg", "Technical issue while saving the Client information. " +
                    "Please contact Admin for more information!!");
            throw new CustomException("");
        }
        log.info("Successfully saved the Client Details information!!!");
        redirectAttributes.addFlashAttribute("msg", "You have successfully updated Employee Details.");
        redirectAttributes.addFlashAttribute("css", "success");

        return "redirect:/clientDetails?empId=" + immigrationDetails.getEmployee().getEmployeeId();
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

}
