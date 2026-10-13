package com.gzu.ctts.controller;

import com.gzu.ctts.common.Result;
import com.gzu.ctts.dto.ProjectDTO;
import com.gzu.ctts.entity.Project;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/projects")
public class ProjectController {

    @Operation(summary = "获取项目列表", description = "分页获取项目列表")
    @GetMapping
    public Result<List<Project>> getProjects(@RequestParam Integer page, @RequestParam Integer size) {

        //调用service 去数据库中获取项目列表
        List<Project> list = new ArrayList<>();
        Project project = new Project();
        project.setId(1);
        project.setName("Project 1");
        project.setDescription("This is project 1");
        project.setCreateTime(new Date());
        list.add(project);

        Project project2 = new Project();
        project2.setId(2);
        project2.setName("Project 2");
        project2.setCreateTime(new Date());
        project2.setDescription("This is project 2");
        list.add(project2);


        return Result.success(list);
    }

    @GetMapping("/{id}")
    public Result<Project> getProject(@PathVariable String id) {

        Project project = new Project();
        project.setId(1);
        project.setName("Project 1");
        project.setDescription("This is project 1");
        project.setCreateTime(new Date());

        return Result.success(project);
    }

    @PostMapping
    public Result<String> createProject(@RequestBody ProjectDTO projectDTO) {
        System.out.println(projectDTO);
        return Result.created();
    }

    @PutMapping("/{id}")
    public Result<String> updateProject(@PathVariable String id) {
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<String> deleteProject(@PathVariable String id) {
        return Result.success();
    }

    @GetMapping("/test")
    public Result<String> test(@RequestHeader("Authorization") String token) {
        System.out.println("token: " + token);
        return Result.success("测试成功");
    }

}
