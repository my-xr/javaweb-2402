package com.gzu.ctts.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class Task {
    private Long id; // Task ID
    private Long projectId; // Project ID
    private String title; // Task title
    private String description; // Task description
    private LocalDateTime deadline; // Task deadline
    private Integer totalScore;
    private Integer status; // Task status
    private LocalDateTime createTime; // Task creation time
    private LocalDateTime updateTime; // Task update time
}
