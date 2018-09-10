package com.tutorialq.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Entity
@EqualsAndHashCode(exclude = {"employee", "clientDetailsId"})
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ClientDetail extends AuditModel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "CLIENT_DETAILS_ID", unique = true, nullable = false)
    private long clientDetailsId;
    private String clientName; //Name of the Client.
    private String clientStreet;
    private String clientCity;
    private String clientState;
    private String clientZip;
    private String contractCompany;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate contractStartDate;
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private LocalDate contractEndDate;
    //Vendor Contact Details
    private String vendorCompany;
    private String vendorContactName;
    private String vendorPhone;
    private String vendorEmail;
    private String paymentTerms;
    //Invoice Details
    private String invoiceContactName;
    private String invoiceContactPhone;
    private String invoiceContactEmail;
    private String invoiceFrequency;
    private String comments;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID", nullable = false)
    @JsonIgnore
    private Employee employee;
    //Audit Information
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateApproved;
    private String nameCreated;
    private String nameLastModified;
    private String nameApproved;
    @Transient
    private String clientAddress;//Address of the Client.

    public String getClientAddress() {
        return (StringUtils.isNotBlank(this.clientStreet) ? (this.clientStreet + " ") : "")
                + (StringUtils.isNotBlank(this.clientCity) ? (this.clientCity + " ") : "")
                + (StringUtils.isNotBlank(this.clientState) ? (this.clientState + " ") : "")
                + (StringUtils.isNotBlank(this.clientZip) ? (this.clientZip + " ") : "");
    }

}
