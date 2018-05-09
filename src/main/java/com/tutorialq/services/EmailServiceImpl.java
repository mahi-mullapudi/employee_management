package com.tutorialq.services;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Mail Service to Send text mails and mails with template (HTML / text).
 * Service support bulk emails and multiple attachments.
 */
@Service
@Slf4j
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void sendPlainTextMailWithoutAttachment(String fromAddress, String toAddress, String ccAddress, String subject, String mailContent) {
        if (StringUtils.isNotBlank(ccAddress)) {
            sendSimpleMailWithoutAttachment(fromAddress, Arrays.asList(toAddress), Arrays.asList(ccAddress), subject, mailContent);
        } else {
            sendSimpleMailWithoutAttachment(fromAddress, Arrays.asList(toAddress), new ArrayList<String>(), subject, mailContent);
        }
    }

    @Override
    public void sendPlainTextMailWithAttachment(final String fromAddress, final String toAddress, final String ccAddress, final String subject, final String mailContent, final List<MultipartFile> attachFiles) {
        if (StringUtils.isNotBlank(ccAddress)) {
            sendSimpleMailWithAttachment(fromAddress, Arrays.asList(toAddress), Arrays.asList(ccAddress), subject, mailContent, attachFiles);
        } else {
            sendSimpleMailWithAttachment(fromAddress, Arrays.asList(toAddress), new ArrayList<String>(), subject, mailContent, attachFiles);
        }
    }

    @Override
    public void sendBulkPlainTextMailWithoutAttachment(String fromAddress, List<String> toAddress, List<String> ccAddress, String subject, final String mailContent) {
        sendSimpleMailWithoutAttachment(fromAddress, toAddress, ccAddress, subject, mailContent);
    }

    @Override
    public void sendBulkPlainTextMailWithAttachment(final String fromAddress, final List<String> toAddress, final List<String> ccAddress, final String subject, final String mailContent, final List<MultipartFile> attachFiles) {
        sendSimpleMailWithAttachment(fromAddress, toAddress, ccAddress, subject, mailContent, attachFiles);
    }

    private void sendSimpleMailWithoutAttachment(String fromAddress, List<String> toAddress, List<String> ccAddress, String subject, final String mailContent) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setFrom(fromAddress);
        email.setTo(toAddress.toArray(new String[toAddress.size()]));
        if (ccAddress != null && ccAddress.size() > 0) {
            email.setCc(ccAddress.toArray(new String[ccAddress.size()]));
        }
        email.setSubject(subject);
        email.setText(mailContent);
        mailSender.send(email);
        log.debug("Text Mail successfully sent !! \nFrom Addres: " + fromAddress + " To Address: " + toAddress + " CC Address: " + ccAddress + "\n Subject: " + subject);
    }

    private void sendSimpleMailWithAttachment(final String fromAddress, final List<String> toAddress, final List<String> ccAddress, final String subject, final String mailContent, final List<MultipartFile> attachFiles) {
        mailSender.send(new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                messageHelper.setFrom(fromAddress);
                messageHelper.setTo(toAddress.toArray(new String[toAddress.size()]));
                if (ccAddress != null && ccAddress.size() > 0) {
                    messageHelper.setCc(ccAddress.toArray(new String[ccAddress.size()]));
                }
                messageHelper.setSubject(subject);
                messageHelper.setText(mailContent);

                for (final MultipartFile attachFile : attachFiles) {
                    // determines if there is an upload file, attach it to the e-mail
                    if (attachFile != null) {
                        String attachName = attachFile.getOriginalFilename();
                        messageHelper.addAttachment(attachName, new InputStreamSource() {
                            @Override
                            public InputStream getInputStream() throws IOException {
                                return attachFile.getInputStream();
                            }
                        });
                    } else {
                        log.info("Attached file is Empty. Skipping the file " + attachFile + " in mail.");
                    }
                }
            }
        });
    }

    @Override
    public void sendMimeMailWithoutAttachment(final String fromAddress, final List<String> toAddress, final List<String> ccAddress, final String subject,
                                              final String mailContent, final boolean isMailHtml) throws Exception {

        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
                helper.setSubject(subject);
                helper.setFrom(fromAddress);
                helper.setTo(toAddress.toArray(new String[toAddress.size()]));

                if (ccAddress != null && ccAddress.size() > 0) {
                    helper.setCc(ccAddress.toArray(new String[ccAddress.size()]));
                }

                // use the true flag to indicate you need a multipart message
                helper.setText(mailContent, isMailHtml);
            }
        };
        try {
            mailSender.send(preparator);
            log.debug("EMail without attachment successfully sent !! \nFrom Addres: " + fromAddress + " To Address: " + toAddress + " CC Address: " + ccAddress + "\n Subject: " + subject);
            log.debug(subject);
        } catch (MailException ex) {
            log.error("Error Sending email: " + ex.getMessage());
            log.error("Sending mail failed for \nFrom Addres: " + fromAddress + " To Address: " + toAddress + " CC Address: " + ccAddress + "\n Subject: " + subject + " Content: " + mailContent + " isTemplateHtml: " + isMailHtml);
            throw new Exception("Error Sending Velocity Template mail. " + ex.getMessage(), ex);
        }

    }

}
