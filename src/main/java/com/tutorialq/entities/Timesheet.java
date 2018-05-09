package com.tutorialq.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Maintains Timesheet Information.
 */
@Data
@Entity
@EqualsAndHashCode(exclude = {"employee", "timesheetId"})
@NoArgsConstructor
@AllArgsConstructor
public class Timesheet implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "TIMESHEET_ID", unique = true, nullable = false)
    private long timesheetId;
    private String timesheetType;
    @Temporal(TemporalType.DATE)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
    private Date fromDate;
    @Temporal(TemporalType.DATE)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
    private Date toDate;
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
    //Audit Information
    @DateTimeFormat(pattern = "MM/dd/yyyy hh:mm")
    @Temporal(TemporalType.DATE)
    private Date dateCreated;
    @DateTimeFormat(pattern = "MM/dd/yyyy hh:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateLastModified;
    @DateTimeFormat(pattern = "MM/dd/yyyy hh:mm")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateApproved;
    private String nameCreated; //Name of the user Uploaded the timesheet.
    private String nameLastModified;
    private String nameApproved;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID", nullable = false)
    @JsonIgnore
    private Employee employee;
}
