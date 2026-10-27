package com.gzu.ctts.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gzu.ctts.entity.Task;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TaskMapper extends BaseMapper<Task> {
    Task getById(Long id);

    @Select("SELECT * FROM task WHERE title LIKE CONCAT('%',#{title},'%')")
    List<Task> selectByTitle(String title);
}
