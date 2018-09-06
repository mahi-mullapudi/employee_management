package com.tutorialq.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ImmigrationDetail extends AuditModel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DOCUMENT_UPLOAD_ID", unique = true, nullable = false)
    private long immiDetailsId;
    private String currentStatus;
    private String receiptNumber;
    private String lcaNumber;
    private BigDecimal currentWage;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate startDate;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate endDate;
    private String dscComments;

    private String greenCardStatus;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate gcStartDate;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID", nullable = false)
    @JsonIgnore
    private Employee employee;

    //Audit Information
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDate dateApproved;
    private String nameCreated;
    private String nameLastModified;
    private String nameApproved;
}
