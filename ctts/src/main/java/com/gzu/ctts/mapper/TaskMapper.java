package com.gzu.ctts.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gzu.ctts.entity.Task;
import org.apache.ibatis.annotations.Mapper;

public interface TaskMapper extends BaseMapper<Task> {
    Task getById(Long id);
}
