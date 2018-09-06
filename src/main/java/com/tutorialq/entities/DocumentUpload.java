package com.tutorialq.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@EqualsAndHashCode(exclude = {"employee", "documentUploadId"})
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DocumentUpload extends AuditModel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "DOCUMENT_UPLOAD_ID", unique = true, nullable = false)
    private long documentUploadId;
    private java.sql.Blob blobMessage;
    private String dscFileName;
    private long fileSize;
    private String dscSectionName; //To get the section name of the uploaded file
    private String dscComments;
    //Extra fields to be populated from other tables.
    private String uploadedUserName;
    private int numOrder;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_ID", nullable = false)
    @JsonIgnore
    private Employee employee;
    //Audit Information
    private String nameCreated;
    private String nameLastModified;

}
