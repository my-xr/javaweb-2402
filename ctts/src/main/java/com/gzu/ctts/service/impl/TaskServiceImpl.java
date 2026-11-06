package com.gzu.ctts.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gzu.ctts.dao.TaskDao;
import com.gzu.ctts.dto.TaskDTO;
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

    @Override
    public List<Task> getByTitleOrDescription(String title, String description) {
        return taskMapper.selectByTitleOrDescription(title, description);
    }

    @Override
    public List<Task> getByPidAndStatus(Long projectId, Integer status) {
        return taskMapper.selectByPidAndStatus(projectId, status);
    }

    @Override
    public List<Task> getByStatusList(List<Integer> statusList) {
        return taskMapper.selectByStatusList(statusList);
    }

    @Override
    public List<Task> getByOptions(TaskDTO taskDTO) {

        LambdaQueryWrapper<Task> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(taskDTO.getProjectId()!=null,Task::getProjectId,taskDTO.getProjectId());

        queryWrapper.like(taskDTO.getTitle()!=null && !taskDTO.getTitle().isEmpty(), Task::getTitle, taskDTO.getTitle())
                .like(taskDTO.getDescription()!=null && !taskDTO.getDescription().isEmpty(), Task::getDescription, taskDTO.getDescription())
                .eq(taskDTO.getStatus()!=null, Task::getStatus, taskDTO.getStatus())
                .eq(taskDTO.getDeadline()!=null, Task::getDeadline, taskDTO.getDeadline())
                .eq(taskDTO.getCreateTime()!=null, Task::getCreateTime, taskDTO.getCreateTime())
                .eq(taskDTO.getUpdateTime()!=null, Task::getUpdateTime, taskDTO.getUpdateTime())
                .orderByDesc(Task::getCreateTime);

        return taskMapper.selectList(queryWrapper);
    }

    @Override
    public IPage<Task> selectPageVo(IPage<?> page) {
        return taskMapper.selectPageVo(page);
    }

    @Override
    public IPage<Task> getOptionsByPage(TaskDTO taskDTO, IPage<?> page) {
        return taskMapper.selectOptionsByPage(page, taskDTO);
    }


}
