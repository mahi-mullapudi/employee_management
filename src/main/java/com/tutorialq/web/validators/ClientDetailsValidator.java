package com.tutorialq.web.validators;

import com.tutorialq.entities.ClientDetail;
import com.tutorialq.services.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
@Slf4j
public class ClientDetailsValidator implements Validator {
    @Autowired
    EmailValidator emailValidator;
    @Autowired
    PhoneNumberValidator phoneValidator;
    @Autowired
    EmployeeService employeeService;

    @Override
    public boolean supports(Class<?> clazz) {
        return ClientDetail.class.equals(clazz);
    }

    /*
     *   This validate() method checks for all the validations related to
     *   Client Details Information.
     */
    @Override
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "clientName", "NotEmpty.clientDetails.clientName");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "clientStreet", "NotEmpty.clientDetails.clientAddress");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "clientCity", "NotEmpty.clientDetails.clientCity");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "clientState", "NotEmpty.clientDetails.clientState");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "clientZip", "NotEmpty.clientDetails.confirm.clientZip");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contractStartDate", "NotEmpty.clientDetails.contractStartDate");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "vendorCompany", "NotEmpty.clientDetails.vendorCompany");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "vendorContactName", "NotEmpty.clientDetails.vendorContactName");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "vendorPhone", "NotEmpty.clientDetails.vendorPhone");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "vendorEmail", "NotEmpty.clientDetails.vendorEmail");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "invoiceFrequency", "NotEmpty.clientDetails.invoiceFrequency");

        ClientDetail clientDetails = (ClientDetail) target;

        //Email Validation
        if (StringUtils.isNotBlank(clientDetails.getVendorEmail())
                && !emailValidator.validate(clientDetails.getVendorEmail())) {
            errors.rejectValue("vendorEmail", "NotValid.clientDetails.email");
        }

        if (StringUtils.isNotBlank(clientDetails.getVendorPhone())
                && !phoneValidator.validate(clientDetails.getVendorPhone().replaceAll("[()-]", ""))) {
            errors.rejectValue("vendorPhone", "NotValid.clientDetails.phoneNum");
        }

        if (StringUtils.isNotBlank(clientDetails.getInvoiceContactEmail())
                && !emailValidator.validate(clientDetails.getInvoiceContactEmail())) {
            errors.rejectValue("vendorEmail", "NotValid.clientDetails.email");
        }

        if (StringUtils.isNotBlank(clientDetails.getInvoiceContactPhone())
                && !phoneValidator.validate(clientDetails.getInvoiceContactPhone().replaceAll("[()-]", ""))) {
            errors.rejectValue("vendorPhone", "NotValid.clientDetails.phoneNum");
        }

    }
}
