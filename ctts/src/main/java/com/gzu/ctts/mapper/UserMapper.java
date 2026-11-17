package com.gzu.ctts.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gzu.ctts.entity.User;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {

    User selectByIdWithRoles(Long id);

    List<User> selectPagesWithRoles(IPage<User> page);

    List<User> selectUserWithRoles(List<Long> ids);
}
