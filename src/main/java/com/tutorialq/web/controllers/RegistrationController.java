package com.tutorialq.web.controllers;

import com.tutorialq.constants.ApplicationConstants;
import com.tutorialq.entities.Employee;
import com.tutorialq.models.ResetPassword;
import com.tutorialq.services.AuthenticationService;
import com.tutorialq.services.EmailService;
import com.tutorialq.services.RegistrationService;
import com.tutorialq.utils.AuthenticationUtils;
import com.tutorialq.utils.EncryptDecryptUtils;
import com.tutorialq.web.validators.RegistrationValidator;
import com.tutorialq.web.validators.UpdatePasswordValidator;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Map;
import java.util.TreeMap;

@Controller
@Slf4j
public class RegistrationController {

    @Autowired
    RegistrationService registrationService;
    @Autowired
    AuthenticationService authService;
    @Autowired
    EmailService emailService;
    @Autowired
    EncryptDecryptUtils encryptDecryptUtils;
    @Autowired
    AuthenticationUtils authUtils;
    @Autowired
    RegistrationValidator registrationValidator;
    @Autowired
    UpdatePasswordValidator updatePasswordValidator;

    @GetMapping("/registration")
    public ModelAndView getRegistration() {
        log.info("Inside getRegistration method of Registration Controller.");
        Employee employeeRegistration = new Employee();
        employeeRegistration.setEmployeeRoleId(ApplicationConstants.USER_ROLE_EMPLOYEE_ID);
        employeeRegistration.setEmployeeRoleDesc(ApplicationConstants.USER_ROLE_EMPLOYEE);
        log.info("Completed setting required parameter values.");
        //Initiating ModelAndView object with the Employee object
        return new ModelAndView("registration", "employee", employeeRegistration);
    }

    @GetMapping("/staffRegistration")
    public ModelAndView getStaffRegistration(ModelMap modelMap) {
        log.info("Inside getStaffRegistration method of Registration Controller.");

        modelMap.addAttribute("employee", new Employee());
        //Initiating ModelAndView object with the Employee object
        return new ModelAndView("registration-staff", modelMap);
    }

    @PostMapping("/registration")
    public ModelAndView submitRegistration(@ModelAttribute("employee") Employee employeeRegistration, BindingResult result,
                                           SessionStatus status, Model model, RedirectAttributes redirectAttributes) {
        log.info("Inside submitRegistation method of Registration Controller.");
        registrationValidator.validate(employeeRegistration, result);
        if (result.hasErrors()) {
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Invalid / Missing Information. Please correct the information entered below!!");
            return new ModelAndView("registration", "employee", employeeRegistration);
        }

        log.info("The form has no errors, so persisting the data.");
        try {
            employeeRegistration.setAccountStatusFlag(ApplicationConstants.REGISTRATION_STATUS_ACTIVE);
            employeeRegistration.setNameCreated(employeeRegistration.getEmployeeFullName());
            if (employeeRegistration.getEmployeeRoleId() != ApplicationConstants.USER_ROLE_EMPLOYEE_ID) {
                Map<Integer, String> roleDescMap = getRoleDescMap();
                employeeRegistration.setEmployeeRoleDesc(roleDescMap.get(employeeRegistration.getEmployeeRoleId()));
            }
            log.info("Saving the registration details of the Employee.");
            registrationService.saveRegistrationDetails(employeeRegistration);
            emailService.sendPlainTextMailWithoutAttachment(ApplicationConstants.fromAddress, employeeRegistration.getEmployeeEmailId(),
                    "",
                    "Employee Management - Registration Successful",
                    "This is to confirm that you have successfully created your profile.");

            status.setComplete();
        } catch (Exception ex) {
            log.error("Exception while saving Registration details: " + ex);
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Technical issue while saving the Registration information. " +
                    "Please contact Admin for more information!!");
            return new ModelAndView("registration", "employee", employeeRegistration);
        }
        log.info("Successfully Registered the user, forwarding to the Login page.");
        redirectAttributes.addFlashAttribute("msg", "You are successfully registered. Please Login to Continue.");
        redirectAttributes.addFlashAttribute("css", "success");

        return new ModelAndView("redirect:/login?encodedEmail=" + encryptDecryptUtils.encodeInputString(employeeRegistration.getEmployeeEmailId()));
    }

    @GetMapping("/forgotPassword")
    public ModelAndView forgotPassword() {
        log.info("Inside forgotPassword method of Registration Controller.");
        return new ModelAndView("forgotPassword", "resetPassword", new ResetPassword());
    }

    @PostMapping("/forgotPassword")
    public ModelAndView submitForgotPassword(@ModelAttribute("resetPassword") ResetPassword resetPassword, BindingResult result,
                                             SessionStatus status, Model model, Errors errors) {
        log.info("Inside submitForgotPassword method of Registration Controller.");
        try {
            if (!authService.checkEmailIdExists(resetPassword.getEmailId())) {
                log.info("EmailId not found in the system: ");
                errors.rejectValue("emailId", "NotValid.login.email");
            }
        } catch (Exception ex) {
            log.error("Exception while checking for the EmailId: " + ex);
            errors.rejectValue("emailId", "Error.login.email");
        }
        if (result.hasErrors()) {
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Invalid / Missing Information. Please correct the information entered below!!");
            return new ModelAndView("forgotPassword");
        }
        //Create a alpha numeric password
        String tempPassword = RandomStringUtils.randomAlphanumeric(8);
        log.info("After getting the tempPassword::");
        try {
            int numRows = registrationService.updatePassword(tempPassword, resetPassword.getEmailId());
            status.setComplete();
            log.info("Number of rows affected: " + numRows);
        } catch (Exception ex) {
            log.error("Exception while saving the new random password: " + ex);
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Technical issue while resetting the password. Please contact Admin for more details!!");
            return new ModelAndView("forgotPassword");
        }
        //Send an Email with the temporary password.
        emailService.sendPlainTextMailWithoutAttachment(ApplicationConstants.fromAddress, resetPassword.getEmailId(),
                "",
                "Employee Management - Password Reset",
                "We got a request to Reset your password. Below is the temporary password: "
                        + tempPassword + ". Please use this temporary password to Login to your account and then " +
                        "you can change your password from the Settings section.");

        model.addAttribute("resetEmail", resetPassword.getEmailId());
        model.addAttribute("resetConfirmationModal", "yes");

        return new ModelAndView("forgotPassword");
    }

    @GetMapping("/viewProfile")
    public ModelAndView viewProfile(HttpSession session, Model model) {
        log.info("Inside viewProfile method of Registration Controller.");
        Employee employee = (Employee) session.getAttribute("user");
        //Check if the employee object exist in the session.
        if (employee == null) {
            log.error("Cannot find employee object in the session, so forwarding to Login page");
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Your session expired, please login to continue!!");
            return new ModelAndView("redirect:/login");
        }
        model.addAttribute("employee", employee);
        if (employee.isEmployeeRole()) {
            return new ModelAndView("employee/viewProfile");
        } else if (employee.isSupervisorRole()) {
            return new ModelAndView("staff/viewProfileStaff");
        } else if (employee.isAdminRole()) {
            return new ModelAndView("staff/viewProfileStaff");
        } else {
            log.error("Cannot validate the role. Redirecting to the Login page.");
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Cannot validate the role, please login to continue!!");
            return new ModelAndView("redirect:/login");
        }

    }

    @PostMapping("/updateProfile")
    public ModelAndView updateProfile(@ModelAttribute("employee") Employee employee, BindingResult result,
                                      SessionStatus status, Model model, Errors errors) {
        log.info("Inside updateProfile method of Registration Controller.");
        //TODO implement validator for update profile information.
        if (employee.isEmployeeRole()) {
            if (result.hasErrors()) {
                model.addAttribute("css", "danger");
                model.addAttribute("msg", "Invalid / Missing Information. Please correct the information entered below!!");
                return new ModelAndView("employee/viewProfile");
            }
            try {
                registrationService.updateEmployeeProfile(employee);
            } catch (Exception ex) {
                log.error("Exception while updating Employee profile information.");
                model.addAttribute("css", "danger");
                model.addAttribute("msg", "Application issue while updating the profile information. Please contact Admin for more information!!");
                return new ModelAndView("employee/viewProfile");
            }
            status.setComplete();
            model.addAttribute("confirmationModal", "yes");
            //Send a confirmation Email.
            emailService.sendPlainTextMailWithoutAttachment(ApplicationConstants.fromAddress, employee.getEmployeeEmailId(),
                    "",
                    "Employee Management - Updated Profile Information",
                    "This is to confirm that we have successfully updated your profile information.");
            return new ModelAndView("employee/viewProfile");

        } else if (employee.isSupervisorRole()) {
            if (result.hasErrors()) {
                model.addAttribute("css", "danger");
                model.addAttribute("msg", "Invalid / Missing Information. Please correct the information entered below!!");
                return new ModelAndView("staff/viewProfileStaff");
            }
            try {
                registrationService.updateStaffProfile(employee);
            } catch (Exception ex) {
                log.error("Exception while updating Supervisor profile information.");
                model.addAttribute("css", "danger");
                model.addAttribute("msg", "Application issue while updating the profile information. Please contact Admin for more information!!");
                return new ModelAndView("staff/viewProfileStaff");
            }
            status.setComplete();
            model.addAttribute("confirmationModal", "yes");
            emailService.sendPlainTextMailWithoutAttachment(ApplicationConstants.fromAddress, employee.getEmployeeEmailId(),
                    "",
                    "Employee Management - Updated Profile Information",
                    "This is to confirm that we have successfully updated your profile information.");
            return new ModelAndView("staff/viewProfileStaff");

        } else if (employee.isAdminRole()) {
            return new ModelAndView("staff/viewProfileStaff");
        } else {
            log.error("Cannot find the role. So forwarding to Login.");
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Cannot validate the role, please login to continue!!");
            return new ModelAndView("redirect:/login");
        }

    }

    @GetMapping("/updatePassword")
    public ModelAndView updatePassword(HttpSession session, Model model) {
        log.info("Inside updatePassword method of Registration Controller.");
        Employee employee = (Employee) session.getAttribute("user");
        //Check if the employee object exist in the session.
        if (employee == null) {
            log.error("Cannot find employee object in the session, so forwarding to Login page");
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Session expired, please login to continue!!");
            return new ModelAndView("redirect:/login");
        }
        employee.setEmpPassword("");
        model.addAttribute("employee", employee);
        return new ModelAndView("updatePassword");
    }

    @PostMapping("/updatePassword")
    public ModelAndView updatePassword(@ModelAttribute("employee") Employee employee, BindingResult result,
                                       SessionStatus status, Model model, Errors errors) {
        log.info("Inside updatePassword method of Registration Controller. EmployeeId: " + employee.getEmployeeEmailId());
        updatePasswordValidator.validate(employee, errors);
        if (result.hasErrors()) {
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Invalid / Missing Information. Please correct the information entered below!!");
            return new ModelAndView("updatePassword");
        }
        try {
            registrationService.updatePassword(employee.getEmployeeEmailId(), employee.getEmpPassword());
        } catch (Exception ex) {
            log.error("Exception while updating Employee password.");
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Application issue while updating your password. Please contact Admin for more information!!");
            return new ModelAndView("updatePassword");
        }
        status.setComplete();
        //Send a confirmation Email.
        emailService.sendPlainTextMailWithoutAttachment(ApplicationConstants.fromAddress, employee.getEmployeeEmailId(),
                "",
                "Employee Management - Password updated",
                "This is to let you know that your password is updated successfully.");
        return new ModelAndView("updatePassword");

    }

    @ModelAttribute("roleIdDescMap")
    public Map<Integer, String> getRoleDescMap() {
        Map<Integer, String> roleIdDescMap = new TreeMap<>();
        roleIdDescMap.put(ApplicationConstants.USER_ROLE_SUPERVISOR_ID, ApplicationConstants.USER_ROLE_SUPERVISOR);
        roleIdDescMap.put(ApplicationConstants.USER_ROLE_ADMIN_ID, ApplicationConstants.USER_ROLE_ADMIN);

        return roleIdDescMap;
    }


}

