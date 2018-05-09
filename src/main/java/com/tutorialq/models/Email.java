package com.tutorialq.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Email {
    public String from;
    public String to;
    public String subject;
    public String text;
    public boolean status;
}