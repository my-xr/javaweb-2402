package com.gzu.ctts.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
    public Result<IPage<Task>> getTask(@RequestParam Integer pageNumber, @RequestParam Integer pageSize){
        IPage<Task> page = new Page<>(pageNumber, pageSize);
        return Result.success(taskService.selectPageVo(page)) ;
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

    @GetMapping("/search")
    public Result<List<Task>> searchTaskByTitle(@RequestParam String title){
        return Result.success(taskService.searchTaskByTitle(title));
    }

    @GetMapping("/searchByTitleOrDescription")
    public Result<List<Task>> searchTaskByTitleOrDescription(@RequestParam String title, @RequestParam String description){
        return Result.success(taskService.getByTitleOrDescription(title, description));
    }

    @GetMapping("/searchByPidAndStatus")
    public Result<List<Task>> getByPidAndStatus(@RequestParam(required = false) Long projectId, @RequestParam(required = false) Integer status){
        return Result.success(taskService.getByPidAndStatus(projectId, status));
    }

    @GetMapping("/searchByStatusList")
    public Result<List<Task>> getByStatusList(@RequestParam(required = false) List<Integer> statusList){
        System.out.println(statusList);
        return Result.success(taskService.getByStatusList(statusList));
    }

    @PostMapping("/options")
    public Result<List<Task>> getOptions(@RequestBody TaskDTO taskDTO){
        return Result.success(taskService.getByOptions(taskDTO));
    }


    @PostMapping("/optionsByPage")
    public Result<IPage<Task>> getOptionsByPage(@RequestBody TaskDTO taskDTO, @RequestParam Integer pageNumber, @RequestParam Integer pageSize){
        IPage<Task> page = new Page<>(pageNumber, pageSize);
        return Result.success(taskService.getOptionsByPage(taskDTO, page));
    }


}
