package com.gzu.ctts.service;

import com.gzu.ctts.entity.Task;

import java.util.List;

public interface TaskService {

    List<Task> getList();

    void addTask(Task task);

    Task getById(Long id);

    void deleteById(Long id);

    void updateTask(Task task);

    List<Task> searchTaskByTitle(String title);
}
