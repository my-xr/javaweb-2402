package com.gzu.ctts.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class TaskDTO {
    private Long id; // Task ID
    @NotNull(message = "项目ID不能为空")
    private Long projectId; // Project ID
    private String title; // Task title
    private String description; // Task description

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime deadline; // Task deadline
    private Integer totalScore;

    @Min(value = 0, message = "不能小于0")
    @Max(value = 3, message = "分数不能大于")
    private Integer status; // Task status

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime; // Task creation time
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime updateTime; // Task update time
}
