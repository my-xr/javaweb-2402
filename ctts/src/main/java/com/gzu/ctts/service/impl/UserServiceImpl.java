package com.gzu.ctts.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gzu.ctts.entity.User;
import com.gzu.ctts.mapper.UserMapper;
import com.gzu.ctts.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getAllUsers() {
        return userMapper.selectList(null);
    }

    @Override
    public void addUser(User user) {
        userMapper.insert(user);
        System.out.println(user.getId());
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateById(user);
    }

    @Override
    public void deleteUser(Long id) {
        userMapper.deleteById(id);
    }

    @Override
    public User getUserById(Long id) {
        return userMapper.selectById(id);
    }

    @Override
    public User getByIdWithRoles(Long id) {
        return userMapper.selectByIdWithRoles(id);
    }

    @Override
    public List<User> getPagesWithRoles(IPage<User> page) {
        List<User> list = userMapper.selectPagesWithRoles(page);
        List<Long> ids = list.stream().map(User::getId).toList();
        List<User> users = userMapper.selectUserWithRoles(ids);

        // 根据userid合并list 和users
        for(User user : list){
            for (User u : users){
                if (user.getId().equals(u.getId())){
                    user.setRoles(u.getRoles());
                }
            }
        }

        return list;
    }
}
