package com.gzu.ctts.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gzu.ctts.dto.TaskDTO;
import com.gzu.ctts.entity.Task;

import java.util.List;

public interface TaskService {

    List<Task> getList();

    void addTask(Task task);

    Task getById(Long id);

    void deleteById(Long id);

    void updateTask(Task task);

    List<Task> searchTaskByTitle(String title);

    List<Task> getByTitleOrDescription(String title, String description);

    List<Task> getByPidAndStatus(Long projectId, Integer status);

    List<Task> getByStatusList(List<Integer> statusList);

    List<Task> getByOptions(TaskDTO taskDTO);

    IPage<Task> selectPageVo(IPage<?> page);

    IPage<Task> getOptionsByPage(TaskDTO taskDTO, IPage<?> page);
}
