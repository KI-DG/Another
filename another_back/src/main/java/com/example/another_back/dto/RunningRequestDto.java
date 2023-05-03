package com.example.another_back.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

@Getter
@Setter
public class RunningRequestDto {
    private Long userId;
    private String runningId;
    private String runningTime;
    private Float runningDistance;
    private Date createDate;
    private Integer walkCount;
    private Integer kcal;
    private Float speed;
    private MultipartFile runningPic;
}