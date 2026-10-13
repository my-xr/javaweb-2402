package com.gzu.ctts.dao;

import com.gzu.ctts.entity.Task;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class TaskDao {

    private static final String URL = "jdbc:mysql://localhost:3306/ctts?characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public List<Task> getTaskList() {

        List<Task> taskList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String SQL = "SELECT id, project_id, title, description, deadline, total_score, `status`, create_time, update_time FROM task";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(SQL);
             ResultSet resultSet = preparedStatement.executeQuery();
        ) {
            while (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getLong("id"));
                task.setProjectId(resultSet.getLong("project_id"));
                task.setTitle(resultSet.getString("title"));
                task.setDescription(resultSet.getString("description"));
                task.setDeadline(resultSet.getObject("deadline", LocalDateTime.class));
                task.setTotalScore(resultSet.getInt("total_score"));
                task.setStatus(resultSet.getInt("status"));
                task.setCreateTime(resultSet.getObject("create_time", LocalDateTime.class));
                task.setUpdateTime(resultSet.getObject("update_time", LocalDateTime.class));
                taskList.add(task);
            }
            return taskList;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public static void main(String[] args) {
        TaskDao taskDao = new TaskDao();
//        List<Task> list = taskDao.getTaskList();
//        for (Task task : list) {
//            System.out.println(task.toString());
//        }
        Task task = new Task();
        task.setProjectId(1L);
        task.setTitle("测试任务");
        task.setDescription("这是测试任务");
        task.setDeadline(LocalDateTime.now());
        task.setTotalScore(100);
        task.setStatus(3);
        task.setCreateTime(LocalDateTime.now());
        task.setUpdateTime(LocalDateTime.now());

        taskDao.addTask(task);
    }

    public void addTask(Task task) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String SQL = "INSERT INTO task(project_id, title, description, deadline,total_score, `status`,create_time, update_time) VALUES(?,?,?,?,?,?,?,?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            // 增删改 关闭自动提交
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setLong(1, task.getProjectId());
            preparedStatement.setString(2, task.getTitle());
            preparedStatement.setString(3, task.getDescription());
            preparedStatement.setObject(4, task.getDeadline());
            preparedStatement.setInt(5, task.getTotalScore());
            preparedStatement.setInt(6, task.getStatus());
            preparedStatement.setObject(7, task.getCreateTime());
            preparedStatement.setObject(8, task.getUpdateTime());
            int i = preparedStatement.executeUpdate();
            if (i > 0) {
                connection.commit();
                System.out.println("添加成功");
            }
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            throw new RuntimeException(e);
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
