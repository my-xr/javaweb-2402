package com.gzu.ctts.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class TaskDTO {
    private Long id; // Task ID
    private Long projectId; // Project ID
    private String title; // Task title
    private String description; // Task description

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime deadline; // Task deadline
    private Integer totalScore;
    private Integer status; // Task status

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime; // Task creation time
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime updateTime; // Task update time
}
