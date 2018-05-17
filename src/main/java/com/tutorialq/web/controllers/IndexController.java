package com.tutorialq.web.controllers;

import com.tutorialq.entities.Employee;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;

/*
 *   Maintains methods for basic functions.
 */
@Controller
@Slf4j
public class IndexController {

    @GetMapping("/welcome")
    public String Welcome(Model model) {
        log.info("Inside welcome method of IndexController");
        model.addAttribute("time", LocalDate.now());
        model.addAttribute("message", "Hello Mahidhar");
        return "welcome";
    }

    @GetMapping("/reports")
    public String reports(Model model) {
        log.info("Inside reports method of IndexController");
        return "employee/reports";
    }

    @GetMapping("/settings")
    public String settings(HttpSession session, Model model) {
        log.info("Inside settings method of IndexController");
        Employee employee = (Employee) session.getAttribute("user");
        //Check if the employee object exist in the session.
        if (employee == null) {
            log.error("Cannot find employee object in the session, so forwarding to Login page");
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Your session expired, please login to continue!!");
            return "redirect:/login";
        }
        //Check for employee role and forward to corresponding page.
        if (employee.isEmployeeRole()) {
            return "employee/settings";
        } else if (employee.isSupervisorRole()) {
            return "staff/settings";
        } else if (employee.isAdminRole()) {
            return "staff/settings";
        } else {
            log.error("Cannot validate the role. Redirecting to the Login page.");
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Cannot validate the role, please login to continue!!");
            return "redirect:/login";
        }
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session, RedirectAttributes redirectAttributes) {
        log.info("Inside logout method of Index Controller.");
        if (session != null) {
            session.invalidate();
        }
        redirectAttributes.addFlashAttribute("msg", "Logged out successfully !!");
        redirectAttributes.addFlashAttribute("css", "success");

        return new ModelAndView("redirect:/login");
    }
}