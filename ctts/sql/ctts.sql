/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : ctts

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 19/10/2026 10:23:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '稳定权限编码，如 PROJECT_CREATE',
  `permission_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称',
  `resource` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源名称，如 project',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动作名称，如 create',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限说明',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sys_permission_code`(`permission_code` ASC) USING BTREE,
  INDEX `idx_sys_permission_resource`(`resource` ASC) USING BTREE,
  INDEX `idx_sys_permission_status`(`status` ASC) USING BTREE,
  CONSTRAINT `ck_sys_permission_status` CHECK (`status` in (0,1))
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 'USER_READ', '查看用户', 'user', 'read', '分页查看用户', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (2, 'USER_UPDATE', '修改用户资料', 'user', 'update', '修改用户基础资料', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (3, 'USER_STATUS_UPDATE', '维护用户状态', 'user', 'status_update', '启用或禁用用户', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (4, 'ROLE_READ', '查看角色', 'role', 'read', '查看角色目录', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (5, 'PERMISSION_READ', '查看权限', 'permission', 'read', '查看权限目录', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (6, 'USER_ROLE_ASSIGN', '分配用户角色', 'user_role', 'assign', '维护用户角色关联', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (7, 'ROLE_PERMISSION_ASSIGN', '配置角色权限', 'role_permission', 'assign', '维护角色权限关联', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (8, 'PROJECT_READ', '查看项目', 'project', 'read', '按权限范围查看项目', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (9, 'PROJECT_CREATE', '创建项目', 'project', 'create', '教师创建项目', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (10, 'PROJECT_UPDATE', '修改项目', 'project', 'update', '负责人修改项目', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (11, 'PROJECT_DELETE', '删除项目', 'project', 'delete', '删除无子数据项目', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (12, 'PROJECT_STATUS_CHANGE', '变更项目状态', 'project', 'status_change', '发布、结束或下线项目', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (13, 'PROJECT_STATISTICS', '查看项目统计', 'project', 'statistics', '查看项目提交统计', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (14, 'TASK_READ', '查看任务', 'task', 'read', '查看项目任务', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (15, 'TASK_CREATE', '创建任务', 'task', 'create', '负责教师创建任务', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (16, 'TASK_UPDATE', '修改任务', 'task', 'update', '负责教师修改任务', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (17, 'TASK_DELETE', '删除任务', 'task', 'delete', '删除无提交任务', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (18, 'TASK_STATUS_CHANGE', '变更任务状态', 'task', 'status_change', '调整任务状态', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (19, 'SUBMISSION_CREATE', '创建提交', 'submission', 'create', '学生提交任务成果', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (20, 'SUBMISSION_READ_OWN', '查看本人提交', 'submission', 'read_own', '学生查看本人提交历史', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (21, 'SUBMISSION_READ_PROJECT', '查看项目提交', 'submission', 'read_project', '教师或管理员查看项目提交', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (22, 'REVIEW_CREATE', '创建评审', 'review', 'create', '负责教师评审提交', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (23, 'REVIEW_READ_OWN', '查看本人评审', 'review', 'read_own', '学生查看本人评审', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (24, 'REVIEW_READ_PROJECT', '查看项目评审', 'review', 'read_project', '教师或管理员查看项目评审', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_permission` VALUES (25, 'STATISTICS_READ_OWN', '查看本人成绩', 'statistics', 'read_own', '学生查看本人成绩', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '稳定角色编码，如 STUDENT',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称，如“学生”',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色说明',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sys_role_code`(`role_code` ASC) USING BTREE,
  INDEX `idx_sys_role_status`(`status` ASC) USING BTREE,
  CONSTRAINT `ck_sys_role_status` CHECK (`status` in (0,1))
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'STUDENT', '学生', '完成任务、提交成果、查看本人反馈', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_role` VALUES (2, 'TEACHER', '教师', '组织项目、管理任务、评审提交', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_role` VALUES (3, 'ADMIN', '管理员', '管理用户、角色权限和项目生命周期', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色ID，引用 sys_role.id',
  `permission_id` bigint UNSIGNED NOT NULL COMMENT '权限ID，引用 sys_permission.id',
  `assigned_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '权限分配时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_permission`(`role_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `idx_role_permission_role`(`role_id` ASC) USING BTREE,
  INDEX `idx_role_permission_permission`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `fk_role_permission_permission` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_role_permission_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1, 8, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (2, 1, 23, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (3, 1, 25, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (4, 1, 19, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (5, 1, 20, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (6, 1, 14, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (8, 2, 9, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (9, 2, 11, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (10, 2, 8, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (11, 2, 13, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (12, 2, 10, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (13, 2, 22, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (14, 2, 24, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (15, 2, 21, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (16, 2, 15, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (17, 2, 17, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (18, 2, 14, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (19, 2, 18, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (20, 2, 16, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (23, 3, 5, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (24, 3, 11, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (25, 3, 8, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (26, 3, 13, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (27, 3, 12, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (28, 3, 24, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (29, 3, 7, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (30, 3, 4, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (31, 3, 21, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (32, 3, 1, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (33, 3, 6, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (34, 3, 3, '2026-09-29 08:06:32');
INSERT INTO `sys_role_permission` VALUES (35, 3, 2, '2026-09-29 08:06:32');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录用户名，全局唯一',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'BCrypt密码密文',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '真实姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sys_user_username`(`username` ASC) USING BTREE,
  INDEX `idx_sys_user_status`(`status` ASC) USING BTREE,
  CONSTRAINT `ck_sys_user_status` CHECK (`status` in (0,1))
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'stu001', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrqD3UaIvJbkVh1xOYvVnQ9qX0X1aP2', '张三', '13800138001', 'zhangsan@ctts.edu', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_user` VALUES (2, 'stu002', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrqD3UaIvJbkVh1xOYvVnQ9qX0X1aP2', '李四', '13800138002', 'lisi@ctts.edu', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_user` VALUES (3, 'tea001', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrqD3UaIvJbkVh1xOYvVnQ9qX0X1aP2', '王老师', '13800138003', 'wang@ctts.edu', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_user` VALUES (4, 'admin001', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrqD3UaIvJbkVh1xOYvVnQ9qX0X1aP2', '管理员甲', '13800138004', 'admin@ctts.edu', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `sys_user` VALUES (5, 'stu003', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MrqD3UaIvJbkVh1xOYvVnQ9qX0X1aP2', '王五', '13800138005', 'wangwu@ctts.edu', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID，引用 sys_user.id',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色ID，引用 sys_role.id',
  `assigned_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '角色分配时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_role`(`user_id` ASC, `role_id` ASC) USING BTREE,
  INDEX `idx_user_role_user`(`user_id` ASC) USING BTREE,
  INDEX `idx_user_role_role`(`role_id` ASC) USING BTREE,
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 4, 3, '2026-09-29 08:06:32');
INSERT INTO `sys_user_role` VALUES (2, 1, 1, '2026-09-29 08:06:32');
INSERT INTO `sys_user_role` VALUES (3, 2, 1, '2026-09-29 08:06:32');
INSERT INTO `sys_user_role` VALUES (4, 5, 1, '2026-09-29 08:06:32');
INSERT INTO `sys_user_role` VALUES (5, 3, 2, '2026-09-29 08:06:32');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `project_id` bigint UNSIGNED NOT NULL COMMENT '所属项目ID，引用 training_project.id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务标题',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务描述',
  `deadline` datetime NOT NULL COMMENT '截止时间',
  `total_score` int UNSIGNED NOT NULL DEFAULT 100 COMMENT '任务满分（1~100）',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1未开始 2进行中 3已截止',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_project`(`project_id` ASC) USING BTREE,
  INDEX `idx_task_status_deadline`(`status` ASC, `deadline` ASC) USING BTREE,
  CONSTRAINT `fk_task_project` FOREIGN KEY (`project_id`) REFERENCES `training_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ck_task_status` CHECK (`status` in (1,2,3)),
  CONSTRAINT `ck_task_total_score` CHECK ((`total_score` > 0) and (`total_score` <= 100))
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 1, '需求分析与数据库设计', '提交需求分析、ER 图和 schema.sql', '2026-09-20 23:59:59', 100, 2, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `task` VALUES (2, 1, 'RESTful 接口开发', '完成项目、任务和提交接口', '2026-10-20 23:59:59', 100, 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `task` VALUES (3, 2, '范式分析报告', '完成 1NF、2NF、3NF 分析', '2026-10-15 23:59:59', 100, 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `task` VALUES (5, 2, 'JavaWeb', 'JDBC练习', '2026-10-25 23:59:59', 100, 1, '2026-10-09 23:59:59', '2026-10-09 23:59:59');
INSERT INTO `task` VALUES (6, 1, '任务1', '这是任务1', '2026-10-16 10:42:36', 100, 3, '2026-10-09 10:42:36', '2026-10-09 10:42:36');
INSERT INTO `task` VALUES (7, 2, '关于脊梁年度朝向围绕着沼泽爬教师飞行员', '保起中。意争物阶阶受立段。报认土研电列非点音。老体接。学识步院真则持许对近。线当满于点同种使车。许过周般须做张又。', '2026-12-11 15:06:06', 100, 1, '2026-07-12 12:25:37', '2026-10-09 10:29:30');
INSERT INTO `task` VALUES (8, 1, 'JAVAWEB', 'JDBC', '2026-11-10 15:34:00', 100, 1, '2026-10-10 15:34:00', '2026-10-10 15:34:00');
INSERT INTO `task` VALUES (9, 1, '测试任务', '这是测试任务', '2026-10-10 15:42:27', 100, 3, '2026-10-10 15:42:27', '2026-10-10 15:42:27');
INSERT INTO `task` VALUES (10, 2, '统统哇塞围绕着挥捉鳄鱼哇塞', '制少离感易我并。们图命想。设根使二到感你间育气。', '2005-12-15 11:17:49', 91, 1, '2015-01-23 23:07:46', '1980-07-20 06:19:02');
INSERT INTO `task` VALUES (11, 2, '但是不像滑呼以免对于地址', '把由的领去时。最支路属温约山。保八据系安色。', '1995-11-17 03:26:04', 67, 3, '1995-10-18 09:06:36', '2006-02-03 12:59:54');
INSERT INTO `task` VALUES (12, 2, 'Python', 'Python web', '2026-11-10 20:27:00', 100, 1, '2026-10-10 20:27:00', '2026-10-10 20:27:00');
INSERT INTO `task` VALUES (13, 2, 'Task 1', 'This is task 1', '2026-11-09 20:35:51', 100, 2, '2026-10-10 20:35:51', '2026-10-10 20:35:51');
INSERT INTO `task` VALUES (14, 2, '噢轻松从红脊梁因为优秀必定箱子短', '音全第整化报精况器任。办委及先教流高着该解。工酸常思记。题出全织白文外养白。', '1984-04-10 05:40:01', 100, 3, '1972-01-14 16:20:07', '1973-03-22 09:34:29');

-- ----------------------------
-- Table structure for task_review
-- ----------------------------
DROP TABLE IF EXISTS `task_review`;
CREATE TABLE `task_review`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评审ID',
  `submission_id` bigint UNSIGNED NOT NULL COMMENT '提交ID，引用 task_submission.id',
  `reviewer_id` bigint UNSIGNED NOT NULL COMMENT '评审教师ID，引用 sys_user.id',
  `score` int UNSIGNED NOT NULL COMMENT '评分（0~任务满分，上限由Service校验）',
  `comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评审评语',
  `review_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评审时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_review_submission`(`submission_id` ASC) USING BTREE,
  INDEX `idx_review_reviewer`(`reviewer_id` ASC) USING BTREE,
  INDEX `idx_review_time`(`review_time` ASC) USING BTREE,
  CONSTRAINT `fk_review_reviewer` FOREIGN KEY (`reviewer_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_submission` FOREIGN KEY (`submission_id`) REFERENCES `task_submission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ck_review_score_nonnegative` CHECK (`score` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务评审表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_review
-- ----------------------------
INSERT INTO `task_review` VALUES (1, 1, 3, 85, '初评：需求分析完整，RBAC 五表拆分合理；索引设计说明不足，暂计 85 分。', '2026-09-21 10:30:00');
INSERT INTO `task_review` VALUES (2, 1, 3, 92, '需求完整，建议补充索引选择说明。', '2026-09-29 08:06:32');

-- ----------------------------
-- Table structure for task_submission
-- ----------------------------
DROP TABLE IF EXISTS `task_submission`;
CREATE TABLE `task_submission`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '提交ID',
  `task_id` bigint UNSIGNED NOT NULL COMMENT '任务ID，引用 task.id',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '提交学生ID，引用 sys_user.id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '提交说明或文本成果',
  `file_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件地址',
  `submit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1待评审 2已评审',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_submission_task`(`task_id` ASC) USING BTREE,
  INDEX `idx_submission_user`(`user_id` ASC) USING BTREE,
  INDEX `idx_submission_status`(`status` ASC) USING BTREE,
  INDEX `idx_submission_submit_time`(`submit_time` ASC) USING BTREE,
  CONSTRAINT `fk_submission_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_submission_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ck_submission_content` CHECK ((`content` is not null) or (`file_url` is not null)),
  CONSTRAINT `ck_submission_status` CHECK (`status` in (1,2))
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务提交表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_submission
-- ----------------------------
INSERT INTO `task_submission` VALUES (1, 1, 1, '已完成需求分析与五类 RBAC 表设计。', '/files/stu001-task-1.zip', '2026-09-29 08:06:32', 2);
INSERT INTO `task_submission` VALUES (2, 1, 2, '已完成 ER 图和建表脚本。', '/files/stu002-task-1.zip', '2026-09-29 08:06:32', 1);
INSERT INTO `task_submission` VALUES (3, 1, 5, NULL, '/files/stu003-task-1.docx', '2026-09-29 08:06:32', 1);
INSERT INTO `task_submission` VALUES (4, 1, 1, '根据评审意见补充了索引设计说明，重新提交。', NULL, '2026-09-29 08:06:32', 1);

-- ----------------------------
-- Table structure for training_project
-- ----------------------------
DROP TABLE IF EXISTS `training_project`;
CREATE TABLE `training_project`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '项目标题',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目描述',
  `teacher_id` bigint UNSIGNED NOT NULL COMMENT '负责教师ID，引用 sys_user.id',
  `start_date` date NOT NULL COMMENT '开始日期',
  `end_date` date NOT NULL COMMENT '结束日期',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：1待发布 2进行中 3已结束 4已下线',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_teacher`(`teacher_id` ASC) USING BTREE,
  INDEX `idx_project_status`(`status` ASC) USING BTREE,
  CONSTRAINT `fk_project_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ck_project_date` CHECK (`start_date` <= `end_date`),
  CONSTRAINT `ck_project_status` CHECK (`status` in (1,2,3,4))
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '实训项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of training_project
-- ----------------------------
INSERT INTO `training_project` VALUES (1, 'Java Web 后端实训', '完成 CTTS 后端接口开发', 3, '2026-09-01', '2026-12-31', 2, '2026-09-29 08:06:32', '2026-09-29 08:06:32');
INSERT INTO `training_project` VALUES (2, '数据库设计实训', '完成 ER 图、范式分析和 SQL 脚本', 3, '2026-09-01', '2026-10-31', 1, '2026-09-29 08:06:32', '2026-09-29 08:06:32');

-- ----------------------------
-- Table structure for training_project_student
-- ----------------------------
DROP TABLE IF EXISTS `training_project_student`;
CREATE TABLE `training_project_student`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `project_id` bigint UNSIGNED NOT NULL COMMENT '项目ID，引用 training_project.id',
  `student_id` bigint UNSIGNED NOT NULL COMMENT '学生ID，引用 sys_user.id',
  `join_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入或分配时间',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态：0无效/已移除 1有效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_project_student`(`project_id` ASC, `student_id` ASC) USING BTREE,
  INDEX `idx_project_student_project`(`project_id` ASC) USING BTREE,
  INDEX `idx_project_student_student`(`student_id` ASC) USING BTREE,
  INDEX `idx_project_student_status`(`status` ASC) USING BTREE,
  CONSTRAINT `fk_project_student_project` FOREIGN KEY (`project_id`) REFERENCES `training_project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_project_student_student` FOREIGN KEY (`student_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ck_project_student_status` CHECK (`status` in (0,1))
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '项目成员关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of training_project_student
-- ----------------------------
INSERT INTO `training_project_student` VALUES (1, 1, 1, '2026-09-29 08:06:32', 1);
INSERT INTO `training_project_student` VALUES (2, 1, 2, '2026-09-29 08:06:32', 1);
INSERT INTO `training_project_student` VALUES (3, 1, 5, '2026-09-29 08:06:32', 1);
INSERT INTO `training_project_student` VALUES (4, 2, 1, '2026-09-29 08:06:32', 1);
INSERT INTO `training_project_student` VALUES (5, 2, 5, '2026-09-29 08:06:32', 1);
INSERT INTO `training_project_student` VALUES (7, 2, 2, '2026-09-29 08:06:32', 0);

SET FOREIGN_KEY_CHECKS = 1;
