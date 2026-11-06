package com.gzu.ctts.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gzu.ctts.dto.TaskDTO;
import com.gzu.ctts.entity.Task;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TaskMapper extends BaseMapper<Task> {
    Task getById(Long id);

    @Select("SELECT * FROM task WHERE title LIKE CONCAT('%',#{title},'%')")
    List<Task> selectByTitle(String title);

    List<Task> selectByTitleOrDescription(String title, String description);

    List<Task> selectByPidAndStatus(Long projectId, Integer status);

    List<Task> selectByStatusList(List<Integer> statusList);

    IPage<Task> selectPageVo(IPage<?> page);

    IPage<Task> selectOptionsByPage(@Param("page") IPage<?> page, @Param("taskDTO") TaskDTO taskDTO);

}
