
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_group]') AND type in (N'U')) DROP TABLE [dbo].[xxl_job_group];
CREATE TABLE [dbo].[xxl_job_group](
    id INT(11) NOT NULL IDENTITY(1,1),
    app_name VARCHAR(64) NOT NULL,
    title VARCHAR(12) NOT NULL,
    address_type TINYINT(4) NOT NULL DEFAULT  0,
    address_list TEXT,
    update_time DATETIME,
    PRIMARY KEY (id)
    );

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_group, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_group, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '执行器AppName', 'SCHEMA', dbo, 'table', xxl_job_group, 'column', app_name;
EXEC sp_addextendedproperty 'MS_Description', '执行器名称', 'SCHEMA', dbo, 'table', xxl_job_group, 'column', title;
EXEC sp_addextendedproperty 'MS_Description', '执行器地址类型：0=自动注册、1=手动录入', 'SCHEMA', dbo, 'table', xxl_job_group, 'column', address_type;
EXEC sp_addextendedproperty 'MS_Description', '执行器地址列表;多地址逗号分隔', 'SCHEMA', dbo, 'table', xxl_job_group, 'column', address_list;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_group, 'column', update_time;


CREATE UNIQUE INDEX PRIMARY ON xxl_job_group(id);

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_info]') AND type in (N'U')) DROP TABLE [dbo].[xxl_job_info];
CREATE TABLE [dbo].[xxl_job_info](
    id INT(11) NOT NULL IDENTITY(1,1),
    job_group INT(11) NOT NULL,
    job_desc VARCHAR(255) NOT NULL,
    add_time DATETIME,
    update_time DATETIME,
    author VARCHAR(64),
    alarm_email VARCHAR(255),
    schedule_type VARCHAR(50) NOT NULL DEFAULT  'NONE',
    schedule_conf VARCHAR(128),
    misfire_strategy VARCHAR(50) NOT NULL DEFAULT  'DO_NOTHING',
    executor_route_strategy VARCHAR(50),
    executor_handler VARCHAR(255),
    executor_param VARCHAR(512),
    executor_block_strategy VARCHAR(50),
    executor_timeout INT(11) NOT NULL DEFAULT  0,
    executor_fail_retry_count INT(11) NOT NULL DEFAULT  0,
    glue_type VARCHAR(50) NOT NULL,
    glue_source MEDIUMTEXT,
    glue_remark VARCHAR(128),
    glue_updatetime DATETIME,
    child_jobid VARCHAR(255),
    trigger_status TINYINT(4) NOT NULL DEFAULT  0,
    trigger_last_time BIGINT(20) NOT NULL DEFAULT  0,
    trigger_next_time BIGINT(20) NOT NULL DEFAULT  0,
    PRIMARY KEY (id)
    );

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_info, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '执行器主键ID', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', job_group;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', job_desc;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', add_time;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', update_time;
EXEC sp_addextendedproperty 'MS_Description', '作者', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', author;
EXEC sp_addextendedproperty 'MS_Description', '报警邮件', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', alarm_email;
EXEC sp_addextendedproperty 'MS_Description', '调度类型', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', schedule_type;
EXEC sp_addextendedproperty 'MS_Description', '调度配置;值含义取决于调度类型', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', schedule_conf;
EXEC sp_addextendedproperty 'MS_Description', '调度过期策略', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', misfire_strategy;
EXEC sp_addextendedproperty 'MS_Description', '执行器路由策略', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', executor_route_strategy;
EXEC sp_addextendedproperty 'MS_Description', '执行器任务handler', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', executor_handler;
EXEC sp_addextendedproperty 'MS_Description', '执行器任务参数', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', executor_param;
EXEC sp_addextendedproperty 'MS_Description', '阻塞处理策略', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', executor_block_strategy;
EXEC sp_addextendedproperty 'MS_Description', '任务执行超时时间;单位秒', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', executor_timeout;
EXEC sp_addextendedproperty 'MS_Description', '失败重试次数', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', executor_fail_retry_count;
EXEC sp_addextendedproperty 'MS_Description', 'GLUE类型', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', glue_type;
EXEC sp_addextendedproperty 'MS_Description', 'GLUE源代码', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', glue_source;
EXEC sp_addextendedproperty 'MS_Description', 'GLUE备注', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', glue_remark;
EXEC sp_addextendedproperty 'MS_Description', 'GLUE更新时间', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', glue_updatetime;
EXEC sp_addextendedproperty 'MS_Description', '子任务ID;多个逗号分隔', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', child_jobid;
EXEC sp_addextendedproperty 'MS_Description', '调度状态：0-停止;1-运行', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', trigger_status;
EXEC sp_addextendedproperty 'MS_Description', '上次调度时间', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', trigger_last_time;
EXEC sp_addextendedproperty 'MS_Description', '下次调度时间', 'SCHEMA', dbo, 'table', xxl_job_info, 'column', trigger_next_time;


CREATE UNIQUE INDEX PRIMARY ON xxl_job_info(id);

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_lock]') AND type in (N'U')) DROP TABLE [dbo].[xxl_job_lock];
CREATE TABLE [dbo].[xxl_job_lock](
    lock_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (lock_name)
    );

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_lock, null, null;
EXEC sp_addextendedproperty 'MS_Description', '锁名称', 'SCHEMA', dbo, 'table', xxl_job_lock, 'column', lock_name;


CREATE UNIQUE INDEX PRIMARY ON xxl_job_lock(lock_name);

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_log]') AND type in (N'U')) DROP TABLE [dbo].[xxl_job_log];
CREATE TABLE [dbo].[xxl_job_log](
    id BIGINT(20) NOT NULL IDENTITY(1,1),
    job_group INT(11) NOT NULL,
    job_id INT(11) NOT NULL,
    executor_address VARCHAR(255),
    executor_handler VARCHAR(255),
    executor_param VARCHAR(512),
    executor_sharding_param VARCHAR(20),
    executor_fail_retry_count INT(11) NOT NULL DEFAULT  0,
    trigger_time DATETIME,
    trigger_code INT(11) NOT NULL,
    trigger_msg TEXT,
    handle_time DATETIME,
    handle_code INT(11) NOT NULL,
    handle_msg TEXT,
    alarm_status TINYINT(4) NOT NULL DEFAULT  0,
    PRIMARY KEY (id)
    );

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_log, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '执行器主键ID', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', job_group;
EXEC sp_addextendedproperty 'MS_Description', '任务;主键ID', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', job_id;
EXEC sp_addextendedproperty 'MS_Description', '执行器地址;本次执行的地址', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', executor_address;
EXEC sp_addextendedproperty 'MS_Description', '执行器任务handler', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', executor_handler;
EXEC sp_addextendedproperty 'MS_Description', '执行器任务参数', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', executor_param;
EXEC sp_addextendedproperty 'MS_Description', '执行器任务分片参数，格式如;1/2', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', executor_sharding_param;
EXEC sp_addextendedproperty 'MS_Description', '失败重试次数', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', executor_fail_retry_count;
EXEC sp_addextendedproperty 'MS_Description', '调度-时间', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', trigger_time;
EXEC sp_addextendedproperty 'MS_Description', '调度-结果', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', trigger_code;
EXEC sp_addextendedproperty 'MS_Description', '调度-日志', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', trigger_msg;
EXEC sp_addextendedproperty 'MS_Description', '执行-时间', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', handle_time;
EXEC sp_addextendedproperty 'MS_Description', '执行-状态', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', handle_code;
EXEC sp_addextendedproperty 'MS_Description', '执行-日志', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', handle_msg;
EXEC sp_addextendedproperty 'MS_Description', '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败', 'SCHEMA', dbo, 'table', xxl_job_log, 'column', alarm_status;


CREATE UNIQUE INDEX PRIMARY ON xxl_job_log(id);
CREATE INDEX I_handle_code ON xxl_job_log(handle_code);
CREATE INDEX I_trigger_time ON xxl_job_log(trigger_time);

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_log_report]') AND type in (N'U')) DROP TABLE [dbo].[xxl_job_log_report];
CREATE TABLE [dbo].[xxl_job_log_report](
    id INT(11) NOT NULL IDENTITY(1,1),
    trigger_day DATETIME,
    running_count INT(11) NOT NULL DEFAULT  0,
    suc_count INT(11) NOT NULL DEFAULT  0,
    fail_count INT(11) NOT NULL DEFAULT  0,
    update_time DATETIME,
    PRIMARY KEY (id)
    );

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_log_report, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_log_report, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '调度-时间', 'SCHEMA', dbo, 'table', xxl_job_log_report, 'column', trigger_day;
EXEC sp_addextendedproperty 'MS_Description', '运行中-日志数量', 'SCHEMA', dbo, 'table', xxl_job_log_report, 'column', running_count;
EXEC sp_addextendedproperty 'MS_Description', '执行成功-日志数量', 'SCHEMA', dbo, 'table', xxl_job_log_report, 'column', suc_count;
EXEC sp_addextendedproperty 'MS_Description', '执行失败-日志数量', 'SCHEMA', dbo, 'table', xxl_job_log_report, 'column', fail_count;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_log_report, 'column', update_time;


CREATE UNIQUE INDEX i_trigger_day ON xxl_job_log_report(trigger_day);
CREATE UNIQUE INDEX PRIMARY ON xxl_job_log_report(id);

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_logglue]') AND type in (N'U')) DROP TABLE [dbo].[xxl_job_logglue];
CREATE TABLE [dbo].[xxl_job_logglue](
    id INT(11) NOT NULL IDENTITY(1,1),
    job_id INT(11) NOT NULL,
    glue_type VARCHAR(50),
    glue_source MEDIUMTEXT,
    glue_remark VARCHAR(128) NOT NULL,
    add_time DATETIME,
    update_time DATETIME,
    PRIMARY KEY (id)
    );

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_logglue, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_logglue, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '任务;主键ID', 'SCHEMA', dbo, 'table', xxl_job_logglue, 'column', job_id;
EXEC sp_addextendedproperty 'MS_Description', 'GLUE类型', 'SCHEMA', dbo, 'table', xxl_job_logglue, 'column', glue_type;
EXEC sp_addextendedproperty 'MS_Description', 'GLUE源代码', 'SCHEMA', dbo, 'table', xxl_job_logglue, 'column', glue_source;
EXEC sp_addextendedproperty 'MS_Description', 'GLUE备注', 'SCHEMA', dbo, 'table', xxl_job_logglue, 'column', glue_remark;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_logglue, 'column', add_time;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_logglue, 'column', update_time;


CREATE UNIQUE INDEX PRIMARY ON xxl_job_logglue(id);

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_registry]') AND type in (N'U')) DROP TABLE [dbo].[xxl_job_registry];
CREATE TABLE [dbo].[xxl_job_registry](
    id INT(11) NOT NULL IDENTITY(1,1),
    registry_group VARCHAR(50) NOT NULL,
    registry_key VARCHAR(255) NOT NULL,
    registry_value VARCHAR(255) NOT NULL,
    update_time DATETIME,
    PRIMARY KEY (id)
    );

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_registry, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_registry, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_registry, 'column', registry_group;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_registry, 'column', registry_key;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_registry, 'column', registry_value;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_registry, 'column', update_time;


CREATE UNIQUE INDEX PRIMARY ON xxl_job_registry(id);
CREATE INDEX i_g_k_v ON xxl_job_registry(registry_group,registry_key,registry_value);

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[xxl_job_user]') AND type in (N'U')) DROP TABLE [dbo].[xxl_job_user];
CREATE TABLE [dbo].[xxl_job_user](
    id INT(11) NOT NULL IDENTITY(1,1),
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role TINYINT(4) NOT NULL,
    permission VARCHAR(255),
    PRIMARY KEY (id)
    );

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_user, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', xxl_job_user, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '账号', 'SCHEMA', dbo, 'table', xxl_job_user, 'column', username;
EXEC sp_addextendedproperty 'MS_Description', '密码', 'SCHEMA', dbo, 'table', xxl_job_user, 'column', password;
EXEC sp_addextendedproperty 'MS_Description', '角色：0-普通用户、1-管理员', 'SCHEMA', dbo, 'table', xxl_job_user, 'column', role;
EXEC sp_addextendedproperty 'MS_Description', '权限：执行器ID列表;多个逗号分割', 'SCHEMA', dbo, 'table', xxl_job_user, 'column', permission;


CREATE UNIQUE INDEX i_username ON xxl_job_user(username);
CREATE UNIQUE INDEX PRIMARY ON xxl_job_user(id);