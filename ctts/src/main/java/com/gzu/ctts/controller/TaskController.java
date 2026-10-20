package com.gzu.ctts.controller;

import com.gzu.ctts.common.Result;
import com.gzu.ctts.dao.TaskDao;
import com.gzu.ctts.dto.TaskDTO;
import com.gzu.ctts.entity.Task;
import com.gzu.ctts.service.TaskService;
import com.gzu.ctts.service.impl.TaskServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tasks")
public class TaskController {

    @Autowired
    private TaskService taskService;

    @GetMapping
    public Result<List<Task>> getTask(){
        return Result.success(taskService.getList()) ;
    }

    @PostMapping
    public Result<String> addTask(@RequestBody TaskDTO taskDTO){

        Task task = new Task();
        BeanUtils.copyProperties(taskDTO, task);

        taskService.addTask(task);
        return Result.success("添加任务成功");
    }

    @GetMapping("/{id}")
    public Result<Task> getTaskById(@PathVariable Long id){
        return Result.success(taskService.getById(id));
    }

    @DeleteMapping("/{id}")
    public Result<String> deleteTask(@PathVariable Long id){
        taskService.deleteById(id);
        return Result.success("删除任务成功");
    }

    @PutMapping("/{id}")
    public Result<String> updateTask(@PathVariable Long id, @RequestBody TaskDTO taskDTO){
        Task task = new Task();
        BeanUtils.copyProperties(taskDTO, task);
        task.setId(id);
        taskService.updateTask(task);
        return Result.success("修改任务成功");
    }



}
