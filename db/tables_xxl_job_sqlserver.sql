--
-- XXL-JOB v2.3.0
-- Copyright (c) 2015-present, xuxueli.

-- 创建数据库
CREATE DATABASE [xxl_job_2.3]
GO

ALTER DATABASE [xxl_job_2.3] COLLATE Chinese_PRC_CI_AS
GO

ALTER DATABASE [xxl_job_2.3] SET RECOVERY SIMPLE
GO

EXEC [xxl_job_2.3].dbo.sp_changedbowner N'sa'
use [xxl_job_2.3];


-- 创建表
/*
 Navicat Premium Data Transfer
*/
-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_group]') AND type IN ('U'))
DROP TABLE [dbo].[xxl_job_group]
    GO

CREATE TABLE [dbo].[xxl_job_group] (
    [id] int  NOT NULL,
    [app_name] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [title] nvarchar(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [address_type] tinyint DEFAULT ((0)) NOT NULL,
    [address_list] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
    [update_time] datetime2(7)  NULL
    )
    GO

ALTER TABLE [dbo].[xxl_job_group] SET (LOCK_ESCALATION = TABLE)
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器AppName',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_group',
    'COLUMN', N'app_name'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器名称',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_group',
    'COLUMN', N'title'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器地址类型：0=自动注册、1=手动录入',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_group',
    'COLUMN', N'address_type'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器地址列表，多地址逗号分隔',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_group',
    'COLUMN', N'address_list'
    GO


    -- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
    INSERT INTO [dbo].[xxl_job_group]  VALUES (N'1', N'xxl-job-executor-sample', N'示例执行器', N'0', NULL, N'2022-05-03 17:02:39.1520000')
    GO

    INSERT INTO [dbo].[xxl_job_group]  VALUES (N'2', N'wms-main-api', N'WMS仓库管理系统', N'0', N'http://192.168.50.1:9806/', N'2022-05-03 17:02:39.1070000')
    GO

    INSERT INTO [dbo].[xxl_job_group]  VALUES (N'3', N'pay-api', N'支付中心2', N'0', NULL, N'2022-05-03 17:02:39.0620000')
    GO


    -- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
    IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_info]') AND type IN ('U'))
DROP TABLE [dbo].[xxl_job_info]
    GO

CREATE TABLE [dbo].[xxl_job_info] (
    [id] int  NOT NULL,
    [job_group] int  NOT NULL,
    [job_desc] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [add_time] datetime2(7)  NULL,
    [update_time] datetime2(7)  NULL,
    [author] nvarchar(64) COLLATE Chinese_PRC_CI_AS  NULL,
    [alarm_email] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
    [schedule_type] nvarchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT ('NONE') NOT NULL,
    [schedule_conf] nvarchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
    [misfire_strategy] nvarchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT ('DO_NOTHING') NOT NULL,
    [executor_route_strategy] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
    [executor_handler] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
    [executor_param] nvarchar(512) COLLATE Chinese_PRC_CI_AS  NULL,
    [executor_block_strategy] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
    [executor_timeout] int DEFAULT ((0)) NOT NULL,
    [executor_fail_retry_count] int DEFAULT ((0)) NOT NULL,
    [glue_type] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [glue_source] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
    [glue_remark] nvarchar(128) COLLATE Chinese_PRC_CI_AS  NULL,
    [glue_updatetime] datetime2(7)  NULL,
    [child_jobid] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
    [trigger_status] tinyint DEFAULT ((0)) NOT NULL,
    [trigger_last_time] bigint DEFAULT ((0)) NOT NULL,
    [trigger_next_time] bigint DEFAULT ((0)) NOT NULL
    )
    GO

ALTER TABLE [dbo].[xxl_job_info] SET (LOCK_ESCALATION = TABLE)
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器主键ID',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'job_group'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'作者',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'author'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'报警邮件',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'alarm_email'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'调度类型',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'schedule_type'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'调度配置，值含义取决于调度类型',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'schedule_conf'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'调度过期策略',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'misfire_strategy'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器路由策略',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'executor_route_strategy'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器任务handler',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'executor_handler'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器任务参数',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'executor_param'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'阻塞处理策略',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'executor_block_strategy'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'任务执行超时时间，单位秒',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'executor_timeout'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'失败重试次数',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'executor_fail_retry_count'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'GLUE类型',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'glue_type'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'GLUE源代码',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'glue_source'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'GLUE备注',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'glue_remark'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'GLUE更新时间',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'glue_updatetime'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'子任务ID，多个逗号分隔',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'child_jobid'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'调度状态：0-停止，1-运行',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'trigger_status'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'上次调度时间',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'trigger_last_time'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'下次调度时间',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_info',
    'COLUMN', N'trigger_next_time'
    GO


    -- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
    INSERT INTO [dbo].[xxl_job_info]  VALUES (N'1', N'1', N'测试任务1', N'2018-11-03 22:21:31.0000000', N'2018-11-03 22:21:31.0000000', N'XXL', N'', N'CRON', N'0 0 0 * * ? *', N'DO_NOTHING', N'FIRST', N'demoJobHandler', N'', N'SERIAL_EXECUTION', N'0', N'0', N'BEAN', N'', N'GLUE代码初始化', N'2018-11-03 22:21:31.0000000', N'', N'0', N'0', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_info]  VALUES (N'2', N'2', N'定时检查库存', N'2022-05-02 19:23:02.0000000', N'2022-05-03 16:59:50.1010000', N'徐海峰', N'', N'FIX_RATE', N'5', N'DO_NOTHING', N'FAILOVER', N'checkStockJobHandler', N'8', N'DISCARD_LATER', N'0', N'0', N'BEAN', N'', N'GLUE代码初始化', N'2022-05-02 19:23:02.0000000', N'', N'0', N'0', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_info]  VALUES (N'3', N'3', N'定时检查回调', N'2022-05-02 20:44:44.0000000', N'2022-05-02 20:44:44.0000000', N'刘星', N'', N'CRON', N'* 2 * * * ?', N'DO_NOTHING', N'FAILOVER', N'checkPayJobHandler', N'', N'SERIAL_EXECUTION', N'0', N'0', N'BEAN', N'', N'GLUE代码初始化', N'2022-05-02 20:44:44.0000000', N'', N'0', N'0', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_info]  VALUES (N'4', N'2', N'发送指令给WCS系统', N'2022-05-03 16:08:29.0000000', N'2022-05-03 16:08:29.0000000', N'徐海峰', N'', N'FIX_RATE', N'5', N'DO_NOTHING', N'LEAST_FREQUENTLY_USED', N'sendWcsJobHandler', N'8', N'SERIAL_EXECUTION', N'0', N'0', N'BEAN', N'', N'GLUE代码初始化', N'2022-05-03 16:08:29.0000000', N'', N'0', N'0', N'0')
    GO


    -- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
    IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_lock]') AND type IN ('U'))
DROP TABLE [dbo].[xxl_job_lock]
    GO

CREATE TABLE [dbo].[xxl_job_lock] (
    [lock_name] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
    )
    GO

ALTER TABLE [dbo].[xxl_job_lock] SET (LOCK_ESCALATION = TABLE)
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'锁名称',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_lock',
    'COLUMN', N'lock_name'
    GO


    -- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
    INSERT INTO [dbo].[xxl_job_lock]  VALUES (N'schedule_lock')
    GO


    -- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
    IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_log]') AND type IN ('U'))
DROP TABLE [dbo].[xxl_job_log]
    GO

CREATE TABLE [dbo].[xxl_job_log] (
    [id] bigint  NOT NULL,
    [job_group] int  NOT NULL,
    [job_id] int  NOT NULL,
    [executor_address] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
    [executor_handler] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
    [executor_param] nvarchar(512) COLLATE Chinese_PRC_CI_AS  NULL,
    [executor_sharding_param] nvarchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
    [executor_fail_retry_count] int DEFAULT ((0)) NOT NULL,
    [trigger_time] datetime2(7)  NULL,
    [trigger_code] int  NOT NULL,
    [trigger_msg] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
    [handle_time] datetime2(7)  NULL,
    [handle_code] int  NOT NULL,
    [handle_msg] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
    [alarm_status] tinyint DEFAULT ((0)) NOT NULL
    )
    GO

ALTER TABLE [dbo].[xxl_job_log] SET (LOCK_ESCALATION = TABLE)
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器主键ID',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'job_group'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'任务，主键ID',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'job_id'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器地址，本次执行的地址',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'executor_address'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器任务handler',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'executor_handler'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器任务参数',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'executor_param'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行器任务分片参数，格式如 1/2',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'executor_sharding_param'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'失败重试次数',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'executor_fail_retry_count'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'调度-时间',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'trigger_time'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'调度-结果',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'trigger_code'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'调度-日志',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'trigger_msg'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行-时间',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'handle_time'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行-状态',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'handle_code'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行-日志',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'handle_msg'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log',
    'COLUMN', N'alarm_status'
    GO


    -- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
    INSERT INTO [dbo].[xxl_job_log]  VALUES (N'1521414056723091456', N'2', N'2', N'http://192.168.50.1:9806/', N'checkStockJobHandler', N'8', NULL, N'0', N'2022-05-03 16:59:12.2860000', N'200', N'任务触发类型：Cron触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', N'2022-05-03 16:59:12.5890000', N'200', N'', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_log]  VALUES (N'1521414077895938048', N'2', N'2', N'http://192.168.50.1:9806/', N'checkStockJobHandler', N'8', NULL, N'0', N'2022-05-03 16:59:17.3340000', N'200', N'任务触发类型：Cron触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', N'2022-05-03 16:59:17.7970000', N'200', N'', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_log]  VALUES (N'1521414098724851712', N'2', N'2', N'http://192.168.50.1:9806/', N'checkStockJobHandler', N'8', NULL, N'0', N'2022-05-03 16:59:22.3000000', N'200', N'任务触发类型：Cron触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', N'2022-05-03 16:59:22.5040000', N'200', N'', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_log]  VALUES (N'1521414119667011584', N'2', N'2', N'http://192.168.50.1:9806/', N'checkStockJobHandler', N'8', NULL, N'0', N'2022-05-03 16:59:27.2930000', N'200', N'任务触发类型：Cron触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', N'2022-05-03 16:59:27.5040000', N'200', N'', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_log]  VALUES (N'1521414140634337280', N'2', N'2', N'http://192.168.50.1:9806/', N'checkStockJobHandler', N'8', NULL, N'0', N'2022-05-03 16:59:32.2920000', N'200', N'任务触发类型：Cron触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', N'2022-05-03 16:59:32.5070000', N'200', N'', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_log]  VALUES (N'1521414161601662976', N'2', N'2', N'http://192.168.50.1:9806/', N'checkStockJobHandler', N'8', NULL, N'0', N'2022-05-03 16:59:37.2910000', N'200', N'任务触发类型：Cron触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', N'2022-05-03 16:59:37.5050000', N'200', N'', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_log]  VALUES (N'1521414182615126016', N'2', N'2', N'http://192.168.50.1:9806/', N'checkStockJobHandler', N'8', NULL, N'0', N'2022-05-03 16:59:42.3010000', N'200', N'任务触发类型：Cron触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', N'2022-05-03 16:59:42.5300000', N'200', N'', N'0')
    GO

    INSERT INTO [dbo].[xxl_job_log]  VALUES (N'1521414203595034624', N'2', N'2', N'http://192.168.50.1:9806/', N'checkStockJobHandler', N'8', NULL, N'0', N'2022-05-03 16:59:47.3030000', N'200', N'任务触发类型：Cron触发<br>调度机器：192.168.50.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.50.1:9806/]<br>路由策略：故障转移<br>阻塞处理策略：丢弃后续调度<br>任务超时时间：0<br>失败重试次数：0<br><br><span style="color:#00c0ef;" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>心跳检测：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null<br><br>触发调度：<br>address：http://192.168.50.1:9806/<br>code：200<br>msg：null', N'2022-05-03 16:59:47.5050000', N'200', N'', N'0')
    GO


    -- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
    IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_log_report]') AND type IN ('U'))
DROP TABLE [dbo].[xxl_job_log_report]
    GO

CREATE TABLE [dbo].[xxl_job_log_report] (
    [id] bigint  NOT NULL,
    [trigger_day] datetime2(7)  NULL,
    [running_count] int DEFAULT ((0)) NOT NULL,
    [suc_count] int DEFAULT ((0)) NOT NULL,
    [fail_count] int DEFAULT ((0)) NOT NULL,
    [update_time] datetime2(7)  NULL
    )
    GO

ALTER TABLE [dbo].[xxl_job_log_report] SET (LOCK_ESCALATION = TABLE)
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'调度-时间',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log_report',
    'COLUMN', N'trigger_day'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'运行中-日志数量',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log_report',
    'COLUMN', N'running_count'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行成功-日志数量',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log_report',
    'COLUMN', N'suc_count'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'执行失败-日志数量',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_log_report',
    'COLUMN', N'fail_count'
    GO


    -- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
    INSERT INTO [dbo].[xxl_job_log_report]  VALUES (N'1', N'2022-05-02 00:00:00.0000000', N'0', N'0', N'0', NULL)
    GO

    INSERT INTO [dbo].[xxl_job_log_report]  VALUES (N'2', N'2022-05-01 00:00:00.0000000', N'0', N'0', N'0', NULL)
    GO

    INSERT INTO [dbo].[xxl_job_log_report]  VALUES (N'3', N'2022-04-30 00:00:00.0000000', N'0', N'0', N'0', NULL)
    GO

    INSERT INTO [dbo].[xxl_job_log_report]  VALUES (N'1521398998664220672', N'2022-05-03 00:00:00.0000000', N'0', N'8', N'0', NULL)
    GO


    -- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
    IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_logglue]') AND type IN ('U'))
DROP TABLE [dbo].[xxl_job_logglue]
    GO

CREATE TABLE [dbo].[xxl_job_logglue] (
    [id] bigint  NOT NULL,
    [job_id] int  NOT NULL,
    [glue_type] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
    [glue_source] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NULL,
    [glue_remark] nvarchar(128) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [add_time] datetime2(7)  NULL,
    [update_time] datetime2(7)  NULL
    )
    GO

ALTER TABLE [dbo].[xxl_job_logglue] SET (LOCK_ESCALATION = TABLE)
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'任务，主键ID',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_logglue',
    'COLUMN', N'job_id'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'GLUE类型',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_logglue',
    'COLUMN', N'glue_type'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'GLUE源代码',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_logglue',
    'COLUMN', N'glue_source'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'GLUE备注',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_logglue',
    'COLUMN', N'glue_remark'
    GO


    -- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
    IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_registry]') AND type IN ('U'))
DROP TABLE [dbo].[xxl_job_registry]
    GO

CREATE TABLE [dbo].[xxl_job_registry] (
    [id] bigint  NOT NULL,
    [registry_group] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [registry_key] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [registry_value] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [update_time] datetime2(7)  NULL
    )
    GO

ALTER TABLE [dbo].[xxl_job_registry] SET (LOCK_ESCALATION = TABLE)
    GO


    -- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
    INSERT INTO [dbo].[xxl_job_registry]  VALUES (N'1521413334623326208', N'EXECUTOR', N'wms-main-api', N'http://192.168.50.1:9806/', N'2022-05-03 17:02:50.1710000')
    GO


    -- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
    IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_user]') AND type IN ('U'))
DROP TABLE [dbo].[xxl_job_user]
    GO

CREATE TABLE [dbo].[xxl_job_user] (
    [id] bigint  NOT NULL,
    [username] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [password] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
    [role] tinyint  NOT NULL,
    [permission] nvarchar(255) COLLATE Chinese_PRC_CI_AS  NULL
    )
    GO

ALTER TABLE [dbo].[xxl_job_user] SET (LOCK_ESCALATION = TABLE)
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'账号',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_user',
    'COLUMN', N'username'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'密码',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_user',
    'COLUMN', N'password'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'角色：0-普通用户、1-管理员',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_user',
    'COLUMN', N'role'
    GO

    EXEC sp_addextendedproperty
    'MS_Description', N'权限：执行器ID列表，多个逗号分割',
    'SCHEMA', N'dbo',
    'TABLE', N'xxl_job_user',
    'COLUMN', N'permission'
    GO


    -- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
    INSERT INTO [dbo].[xxl_job_user]  VALUES (N'1', N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'1', NULL)
    GO

    INSERT INTO [dbo].[xxl_job_user]  VALUES (N'2', N'devtest', N'e10adc3949ba59abbe56e057f20f883e', N'0', N'1')
    GO

    INSERT INTO [dbo].[xxl_job_user]  VALUES (N'3', N'mytest', N'ff9830c42660c1dd1942844f8069b74a', N'0', N'2')
    GO

    INSERT INTO [dbo].[xxl_job_user]  VALUES (N'4', N'wmsdev', N'e10adc3949ba59abbe56e057f20f883e', N'0', N'2')
    GO


-- ----------------------------
-- Primary Key structure for table xxl_job_group
-- ----------------------------
ALTER TABLE [dbo].[xxl_job_group] ADD CONSTRAINT [PK__xxl_job___3213E83F8A524CD6] PRIMARY KEY CLUSTERED ([id])
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
    ON [PRIMARY]
    GO


-- ----------------------------
-- Primary Key structure for table xxl_job_info
-- ----------------------------
ALTER TABLE [dbo].[xxl_job_info] ADD CONSTRAINT [PK__xxl_job___3213E83F298CE0B7] PRIMARY KEY CLUSTERED ([id])
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
    ON [PRIMARY]
    GO


-- ----------------------------
-- Primary Key structure for table xxl_job_lock
-- ----------------------------
ALTER TABLE [dbo].[xxl_job_lock] ADD CONSTRAINT [PK__xxl_job___7BE7AEAB0D35D594] PRIMARY KEY CLUSTERED ([lock_name])
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
    ON [PRIMARY]
    GO


-- ----------------------------
-- Indexes structure for table xxl_job_log
-- ----------------------------
CREATE NONCLUSTERED INDEX [I_trigger_time]
ON [dbo].[xxl_job_log] (
  [trigger_time] ASC
)
GO

CREATE NONCLUSTERED INDEX [I_handle_code]
ON [dbo].[xxl_job_log] (
  [handle_code] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table xxl_job_log
-- ----------------------------
ALTER TABLE [dbo].[xxl_job_log] ADD CONSTRAINT [PK__xxl_job___3213E83FCD23599E] PRIMARY KEY CLUSTERED ([id])
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
    ON [PRIMARY]
    GO


-- ----------------------------
-- Indexes structure for table xxl_job_log_report
-- ----------------------------
CREATE NONCLUSTERED INDEX [i_trigger_day]
ON [dbo].[xxl_job_log_report] (
  [trigger_day] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table xxl_job_log_report
-- ----------------------------
ALTER TABLE [dbo].[xxl_job_log_report] ADD CONSTRAINT [PK__xxl_job___3213E83F7A6FC514] PRIMARY KEY CLUSTERED ([id])
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
    ON [PRIMARY]
    GO


-- ----------------------------
-- Primary Key structure for table xxl_job_logglue
-- ----------------------------
ALTER TABLE [dbo].[xxl_job_logglue] ADD CONSTRAINT [PK__xxl_job___3213E83FA8F81DE7] PRIMARY KEY CLUSTERED ([id])
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
    ON [PRIMARY]
    GO


-- ----------------------------
-- Indexes structure for table xxl_job_registry
-- ----------------------------
CREATE NONCLUSTERED INDEX [i_g_k_v]
ON [dbo].[xxl_job_registry] (
  [registry_group] ASC,
  [registry_key] ASC,
  [registry_value] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table xxl_job_registry
-- ----------------------------
ALTER TABLE [dbo].[xxl_job_registry] ADD CONSTRAINT [PK__xxl_job___3213E83FC3F3844A] PRIMARY KEY CLUSTERED ([id])
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
    ON [PRIMARY]
    GO


-- ----------------------------
-- Indexes structure for table xxl_job_user
-- ----------------------------
CREATE NONCLUSTERED INDEX [i_username]
ON [dbo].[xxl_job_user] (
  [username] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table xxl_job_user
-- ----------------------------
ALTER TABLE [dbo].[xxl_job_user] ADD CONSTRAINT [PK__xxl_job___3213E83F35CED38C] PRIMARY KEY CLUSTERED ([id])
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
    ON [PRIMARY]
    GO