package com.tutorialq.web.controllers;

import com.tutorialq.constants.ApplicationConstants;
import com.tutorialq.entities.Employee;
import com.tutorialq.models.DashboardSearch;
import com.tutorialq.utils.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping(value = "/dashboard")
public class DashboardController {

    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView forwardToAppropriateDashboard(HttpSession session, Model model) {
        log.info("Inside the forwardToAppropriateDashboard method of DashboardController");
        Employee employee = (Employee) session.getAttribute("user");
        //Check if the employee object exist in the session.
        if (employee == null) {
            log.error("Cannot find employee object in the session, so forwarding to Login page");
            return new ModelAndView("redirect:/login");
        }
        log.info("Check for Employee role and forward to appropriate employee role");
        String viewName = "";
        log.info("Switch case to check for the Employee role based on the employeeRoleId");
        switch (employee.getEmployeeRoleId()) {
            //Employee
            case ApplicationConstants.USER_ROLE_EMPLOYEE_ID:
                employee.setEmployeeRoleDesc(ApplicationConstants.USER_ROLE_EMPLOYEE);
                viewName = "employee/dashboard";
                break;
            //Supervisor
            case ApplicationConstants.USER_ROLE_SUPERVISOR_ID:
                employee.setEmployeeRoleDesc(ApplicationConstants.USER_ROLE_SUPERVISOR);
                session.setAttribute("weekStartDatesList", DateUtils.getListLocalWeekStartDatesOfLastThreeMonths());
                session.setAttribute("weekEndDatesList", DateUtils.getListLocalWeekEndDatesOfLastThreeMonths());
                session.setAttribute("timesheetStatusList", ApplicationConstants.TIMESHEET_STATUS_LIST);
                model.addAttribute("dashboardSearch", new DashboardSearch());
                viewName = "staff/dashboard-staff";
                break;
            //Admin
            case ApplicationConstants.USER_ROLE_ADMIN_ID:
                employee.setEmployeeRoleDesc(ApplicationConstants.USER_ROLE_ADMIN);
                session.setAttribute("weekStartDatesList", DateUtils.getListLocalWeekStartDatesOfLastThreeMonths());
                session.setAttribute("weekEndDatesList", DateUtils.getListLocalWeekEndDatesOfLastThreeMonths());
                session.setAttribute("timesheetStatusList", ApplicationConstants.TIMESHEET_STATUS_LIST);
                model.addAttribute("dashboardSearch", new DashboardSearch());
                viewName = "staff/dashboard-staff";
                break;
            default:
                viewName = "login";
        }

        log.info("View Name from the switch case: " + viewName);
        model.addAttribute("currentEndDate", DateUtils.getLocalTimesheetWeekEndDate());
        return new ModelAndView(viewName);
    }
}
