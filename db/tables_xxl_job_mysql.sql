/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mydev-mysql8.0.28
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3309
 Source Schema         : xxl_job_2.3

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 03/05/2022 15:05:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `XXL_JOB_GROUP`;
CREATE TABLE `XXL_JOB_GROUP`  (
    `ID` int(0) NOT NULL,
    `APP_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器AppName',
    `TITLE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器名称',
    `ADDRESS_TYPE` tinyint(0) NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
    `ADDRESS_LIST` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
    `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `XXL_JOB_GROUP` VALUES (1, 'xxl-job-executor-sample', '示例执行器', 0, NULL, '2022-05-02 20:52:11');
INSERT INTO `XXL_JOB_GROUP` VALUES (2, 'wms-main-api', 'WMS仓库管理系统', 0, NULL, '2022-05-02 20:52:11');
INSERT INTO `XXL_JOB_GROUP` VALUES (3, 'pay-api', '支付中心', 0, NULL, '2022-05-02 20:52:09');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `XXL_JOB_INFO`;
CREATE TABLE `XXL_JOB_INFO`  (
    `ID` int(0) NOT NULL,
    `JOB_GROUP` int(0) NOT NULL COMMENT '执行器主键ID',
    `JOB_DESC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `ADD_TIME` datetime(0) NULL DEFAULT NULL,
    `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
    `AUTHOR` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
    `ALARM_EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报警邮件',
    `SCHEDULE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
    `SCHEDULE_CONF` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
    `MISFIRE_STRATEGY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
    `EXECUTOR_ROUTE_STRATEGY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
    `EXECUTOR_HANDLER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
    `EXECUTOR_PARAM` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
    `EXECUTOR_BLOCK_STRATEGY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
    `EXECUTOR_TIMEOUT` int(0) NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
    `EXECUTOR_FAIL_RETRY_COUNT` int(0) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
    `GLUE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE类型',
    `GLUE_SOURCE` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
    `GLUE_REMARK` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
    `GLUE_UPDATETIME` datetime(0) NULL DEFAULT NULL COMMENT 'GLUE更新时间',
    `CHILD_JOBID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
    `TRIGGER_STATUS` tinyint(0) NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
    `TRIGGER_LAST_TIME` bigint(0) NOT NULL DEFAULT 0 COMMENT '上次调度时间',
    `TRIGGER_NEXT_TIME` bigint(0) NOT NULL DEFAULT 0 COMMENT '下次调度时间',
    PRIMARY KEY (`ID`) USING BTREE
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `XXL_JOB_INFO` VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);
INSERT INTO `XXL_JOB_INFO` VALUES (2, 2, '定时检查库存', '2022-05-02 19:23:02', '2022-05-02 19:40:51', '徐海峰', '', 'FIX_RATE', '5', 'DO_NOTHING', 'FAILOVER', 'checkStockJobHandler', '8', 'DISCARD_LATER', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-05-02 19:23:02', '', 0, 0, 0);
INSERT INTO `XXL_JOB_INFO` VALUES (3, 3, '定时检查回调', '2022-05-02 20:44:44', '2022-05-02 20:44:44', '刘星', '', 'CRON', '* 2 * * * ?', 'DO_NOTHING', 'FAILOVER', 'checkPayJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-05-02 20:44:44', '', 0, 0, 0);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `XXL_JOB_LOCK`;
CREATE TABLE `XXL_JOB_LOCK`  (
    `LOCK_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁名称',
    PRIMARY KEY (`LOCK_NAME`) USING BTREE
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `XXL_JOB_LOCK` VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `XXL_JOB_LOG`;
CREATE TABLE `XXL_JOB_LOG`  (
    `ID` bigint(0) NOT NULL,
    `JOB_GROUP` int(0) NOT NULL COMMENT '执行器主键ID',
    `JOB_ID` int(0) NOT NULL COMMENT '任务，主键ID',
    `EXECUTOR_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
    `EXECUTOR_HANDLER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
    `EXECUTOR_PARAM` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
    `EXECUTOR_SHARDING_PARAM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
    `EXECUTOR_FAIL_RETRY_COUNT` int(0) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
    `TRIGGER_TIME` datetime(0) NULL DEFAULT NULL COMMENT '调度-时间',
    `TRIGGER_CODE` int(0) NOT NULL COMMENT '调度-结果',
    `TRIGGER_MSG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '调度-日志',
    `HANDLE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '执行-时间',
    `HANDLE_CODE` int(0) NOT NULL COMMENT '执行-状态',
    `HANDLE_MSG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行-日志',
    `ALARM_STATUS` tinyint(0) NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
    PRIMARY KEY (`ID`) USING BTREE,
    INDEX `I_TRIGGER_TIME`(`TRIGGER_TIME`) USING BTREE,
    INDEX `I_HANDLE_CODE`(`HANDLE_CODE`) USING BTREE
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
INSERT INTO `XXL_JOB_LOG` VALUES (1521108569972543488, 2, 2, 'http://192.168.50.1:9806/', 'checkStockJobHandler', 'test', NULL, 0, '2022-05-02 20:45:19', 200, '任务触发类型：手动触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', '2022-05-02 20:45:19', 200, '', 0);
INSERT INTO `XXL_JOB_LOG` VALUES (1521108589652217856, 2, 2, 'http://192.168.50.1:9806/', 'checkStockJobHandler', 'sfds', NULL, 0, '2022-05-02 20:45:23', 200, '任务触发类型：手动触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', '2022-05-02 20:45:23', 200, '', 0);
INSERT INTO `XXL_JOB_LOG` VALUES (1521108613803020288, 2, 2, 'http://192.168.50.1:9806/', 'checkStockJobHandler', 'bbd', NULL, 0, '2022-05-02 20:45:29', 200, '任务触发类型：手动触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', '2022-05-02 20:45:29', 200, '', 0);

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `XXL_JOB_LOG_REPORT`;
CREATE TABLE `XXL_JOB_LOG_REPORT`  (
    `ID` bigint(0) NOT NULL,
    `TRIGGER_DAY` datetime(0) NULL DEFAULT NULL COMMENT '调度-时间',
    `RUNNING_COUNT` int(0) NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
    `SUC_COUNT` int(0) NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
    `FAIL_COUNT` int(0) NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
    `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE,
    UNIQUE INDEX `I_TRIGGER_DAY`(`TRIGGER_DAY`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO `XXL_JOB_LOG_REPORT` VALUES (1, '2022-05-02 00:00:00', 0, 3, 0, NULL);
INSERT INTO `XXL_JOB_LOG_REPORT` VALUES (2, '2022-05-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `XXL_JOB_LOG_REPORT` VALUES (3, '2022-04-30 00:00:00', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `XXL_JOB_LOGGLUE`;
CREATE TABLE `XXL_JOB_LOGGLUE`  (
    `ID` bigint(0) NOT NULL,
    `JOB_ID` int(0) NOT NULL COMMENT '任务，主键ID',
    `GLUE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
    `GLUE_SOURCE` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
    `GLUE_REMARK` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE备注',
    `ADD_TIME` datetime(0) NULL DEFAULT NULL,
    `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE
    ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `XXL_JOB_REGISTRY`;
CREATE TABLE `XXL_JOB_REGISTRY`  (
    `ID` bigint(0) NOT NULL,
    `REGISTRY_GROUP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `REGISTRY_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `REGISTRY_VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
    PRIMARY KEY (`ID`) USING BTREE,
    INDEX `I_G_K_V`(`REGISTRY_GROUP`, `REGISTRY_KEY`, `REGISTRY_VALUE`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `XXL_JOB_USER`;
CREATE TABLE `XXL_JOB_USER`  (
    `ID` bigint(0) NOT NULL,
    `USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
    `PASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
    `ROLE` tinyint(0) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
    `PERMISSION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
    PRIMARY KEY (`ID`) USING BTREE,
    UNIQUE INDEX `I_USERNAME`(`USERNAME`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `XXL_JOB_USER` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);
INSERT INTO `XXL_JOB_USER` VALUES (2, 'devtest', 'e10adc3949ba59abbe56e057f20f883e', 0, '1');
INSERT INTO `XXL_JOB_USER` VALUES (3, 'mytest', 'ff9830c42660c1dd1942844f8069b74a', 0, '2');

SET FOREIGN_KEY_CHECKS = 1;
