package com.tutorialq.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
@Scope("prototype")
@Data
@Slf4j
@NoArgsConstructor
@AllArgsConstructor
public class RestResponseEntity implements Serializable {
    private String responseCode;
    private String responseMessage;
    private String responseClass; // Maintains the bootstrap alert class to display the type of error.
}
