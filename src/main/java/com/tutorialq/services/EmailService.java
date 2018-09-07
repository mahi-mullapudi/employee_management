package com.tutorialq.services;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Common Mail Service to send mails.
 * <b><u>NOTE:</u></b>
 * 1. Bcc is NOT supported, for business transparency.
 * 2. No Validations are performed for validity of email addresses.
 * 3. No Validations for size of attachments.
 * 4. No Validation for the type of attachments.
 * 5. <b>Exception Handling</b> - some methods throws exception which
 * needs to be handled according to business need i.e. to stop the
 * execution flow in case of execution (or) silently log it and move on.
 */
public interface EmailService {

    /**
     * Service method to send simple plain text mail without attachments.
     *
     * @param fromAddress String
     * @param toAddress   String
     * @param ccAddress   String
     * @param subject     String
     * @param mailContent String
     */
    void sendPlainTextMailWithoutAttachment(String fromAddress, String toAddress, String ccAddress, String subject, String mailContent);

    /**
     * Service method to send plain text mail <b>WITH</b> multiple attachments.
     *
     * @param fromAddress String
     * @param toAddress   String
     * @param ccAddress   String
     * @param subject     String
     * @param mailContent String of mail content.
     * @param attachFiles List of files attached.
     *                    For single files add it to list.
     *                    Ex: Arrays.asList(uploadedFile)
     */
    void sendPlainTextMailWithAttachment(String fromAddress, String toAddress, String ccAddress, String subject, String mailContent, List<MultipartFile> attachFiles);

    /**
     * Service method to send simple plain text mail to multiple recipients
     * <b>without</b> attachment(s).
     *
     * @param fromAddress String
     * @param toAddress   List<String>
     * @param ccAddress   List<String>
     * @param subject     String
     * @param mailContent String of mail content.
     */
    void sendBulkPlainTextMailWithoutAttachment(String fromAddress, List<String> toAddress, List<String> ccAddress, String subject, String mailContent);

    /**
     * Service method to send simple plain text mail to multiple recipients
     * <b>WITH</b> attachment(s).
     *
     * @param fromAddress String
     * @param toAddress   List<String>
     * @param ccAddress   List<String>
     * @param subject     String
     * @param mailContent String of mail content.
     * @param attachFiles List of files attached.
     *                    For single files add it to list.
     *                    Ex: Arrays.asList(uploadedFile)
     */
    void sendBulkPlainTextMailWithAttachment(String fromAddress, List<String> toAddress, List<String> ccAddress, String subject, String mailContent, List<MultipartFile> attachFiles);

    /**
     * @param fromAddress
     * @param toAddress
     * @param ccAddress
     * @param subject
     * @param mailContent
     * @throws Exception
     */
    void sendMimeMailWithoutAttachment(String fromAddress, List<String> toAddress, List<String> ccAddress, String subject, String mailContent, boolean isMailHtml) throws Exception;
}

