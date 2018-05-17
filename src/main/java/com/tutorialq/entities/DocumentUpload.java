package com.tutorialq.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Entity
@EqualsAndHashCode(exclude = {"employee", "clientDetailsId"})
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DocumentUpload implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DOCUMENT_UPLOAD_ID", unique = true, nullable = false)
    private long documentUploadId;
    private long documentRefDataId;
    private java.sql.Blob blobMessage;
    private String dscFileName;
    private String rowId;
    private long fileSize;
    private String dscSectionName; //To get the section name of the uploaded file
    private String dscComments;
    //Extra fields to be populated from other tables.
    private String uploadedUserName;
    private String shortDescription; //This stores the display name of the uploaded section name.
    private int numOrder;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID", nullable = false)
    @JsonIgnore
    private Employee employee;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "DOCUMENT_REF_ID", nullable = false)
    @JsonIgnore
    private DocumentRefData documentRefData;
    //Audit Information
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateCreated;
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateLastModified;
    @DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
    private LocalDateTime dateApproved;
    private String nameCreated;
    private String nameLastModified;
    private String nameApproved;

}
