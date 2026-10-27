package com.gzu.ctts.service.impl;

import com.gzu.ctts.dao.TaskDao;
import com.gzu.ctts.entity.Task;
import com.gzu.ctts.mapper.TaskMapper;
import com.gzu.ctts.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    private final TaskDao taskDao = new TaskDao();

    @Autowired
    private TaskMapper taskMapper;

    @Override
    public List<Task> getList() {
        return taskDao.getTaskList();
    }

    @Override
    public void addTask(Task task) {
        taskDao.addTask(task);
    }

    @Override
    public Task getById(Long id) {
        return taskMapper.getById(id);
    }

    @Override
    public void deleteById(Long id) {
        taskMapper.deleteById(id);
    }

    @Override
    public void updateTask(Task task) {
        taskMapper.updateById(task);
    }

    @Override
    public List<Task> searchTaskByTitle(String title) {
        return taskMapper.selectByTitle(title);
    }


}
