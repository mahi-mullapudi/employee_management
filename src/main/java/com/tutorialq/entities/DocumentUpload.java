package com.tutorialq.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

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
    private String dscSectionName; //To get the section name of the uploaded file
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
