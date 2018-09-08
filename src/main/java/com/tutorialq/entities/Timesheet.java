package com.tutorialq.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Maintains Timesheet Information.
 */
@Data
@Entity
@EqualsAndHashCode(exclude = {"employee", "timesheetId"})
@NoArgsConstructor
@AllArgsConstructor
public class Timesheet extends AuditModel implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "TIMESHEET_ID", unique = true, nullable = false)
    private long timesheetId;
    private String timesheetType;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate fromDate;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate toDate;
    private String timesheetStatus;
    //Timesheet Information
    private double regularHours;
    private double extraHours;
    private String employeeName;
    private String clientName; //Employee Client Name while submitting the Timesheet.
    //File Upload Information
    @Transient
    private MultipartFile uploadFile; //Just to get the uploaded file.
    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(length = 1048576)
    private byte[] blobContent; //Byte stream of the file saved in the database.
    private String dscFileName;
    private long fileSize;
    private String dscComments;
    private String reviewerComments;
    /* Mapping*/
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private Employee employee;
    //Audit Information
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateSubmitted;
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateApproved;
    private String nameCreated; //Name of the user Uploaded the timesheet.
    private String nameLastModified;
    private String nameApproved;

}
