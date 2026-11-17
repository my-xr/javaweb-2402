package com.gzu.ctts.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gzu.ctts.entity.User;

import java.util.List;

public interface UserService {

    List<User> getAllUsers();

    void addUser(User user);

    void updateUser(User user);

    void deleteUser(Long id);

    User getUserById(Long id);

    User getByIdWithRoles(Long id);

    List<User> getPagesWithRoles(IPage<User> page);

}
