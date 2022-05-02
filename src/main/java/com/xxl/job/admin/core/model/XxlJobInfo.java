package com.xxl.job.admin.core.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author xuxueli 2019-05-04 16:43:12
 */
@Table(name = "xxl_job_info")
public class XxlJobInfo {

    public XxlJobInfo() {
        this.triggerStatus = 0;
        this.triggerLastTime = 0L;
        this.triggerNextTime = 0L;
    }

    @Id
    @Column(name = "id")
    private Integer id;

    // 执行器主键ID
    @Column(name = "job_group")
    private Integer jobGroup;

    @Column(name = "job_desc")
    private String jobDesc;

    @Column(name = "add_time")
    private Date addTime;

    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "author")
    private String author;        // 负责人

    @Column(name = "alarm_email")
    private String alarmEmail;    // 报警邮件

    @Column(name = "schedule_type")
    private String scheduleType;            // 调度类型

    @Column(name = "schedule_conf")
    private String scheduleConf;            // 调度配置，值含义取决于调度类型

    @Column(name = "misfire_strategy")
    private String misfireStrategy;            // 调度过期策略

    @Column(name = "executor_route_strategy")
    private String executorRouteStrategy;    // 执行器路由策略

    @Column(name = "executor_handler")
    private String executorHandler;            // 执行器，任务Handler名称

    @Column(name = "executor_param")
    private String executorParam;            // 执行器，任务参数

    @Column(name = "executor_block_strategy")
    private String executorBlockStrategy;    // 阻塞处理策略

    @Column(name = "executor_timeout")
    private Integer executorTimeout;            // 任务执行超时时间，单位秒

    @Column(name = "executor_fail_retry_count")
    private Integer executorFailRetryCount;        // 失败重试次数

    @Column(name = "glue_type")
    private String glueType;        // GLUE类型	#com.xxl.job.core.glue.GlueTypeEnum

    @Column(name = "glue_source")
    private String glueSource;        // GLUE源代码

    @Column(name = "glue_remark")
    private String glueRemark;        // GLUE备注

    @Column(name = "glue_updatetime")
    private Date glueUpdatetime;    // GLUE更新时间

    @Column(name = "child_jobid")
    private String childJobId;        // 子任务ID，多个逗号分隔

    @Column(name = "trigger_status")
    private Integer triggerStatus;        // 调度状态：0-停止，1-运行

    @Column(name = "trigger_last_time")
    private Long triggerLastTime;    // 上次调度时间

    @Column(name = "trigger_next_time")
    private Long triggerNextTime;    // 下次调度时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getJobGroup() {
        return jobGroup;
    }

    public void setJobGroup(Integer jobGroup) {
        this.jobGroup = jobGroup;
    }

    public String getJobDesc() {
        return jobDesc;
    }

    public void setJobDesc(String jobDesc) {
        this.jobDesc = jobDesc;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAlarmEmail() {
        return alarmEmail;
    }

    public void setAlarmEmail(String alarmEmail) {
        this.alarmEmail = alarmEmail;
    }

    public String getScheduleType() {
        return scheduleType;
    }

    public void setScheduleType(String scheduleType) {
        this.scheduleType = scheduleType;
    }

    public String getScheduleConf() {
        return scheduleConf;
    }

    public void setScheduleConf(String scheduleConf) {
        this.scheduleConf = scheduleConf;
    }

    public String getMisfireStrategy() {
        return misfireStrategy;
    }

    public void setMisfireStrategy(String misfireStrategy) {
        this.misfireStrategy = misfireStrategy;
    }

    public String getExecutorRouteStrategy() {
        return executorRouteStrategy;
    }

    public void setExecutorRouteStrategy(String executorRouteStrategy) {
        this.executorRouteStrategy = executorRouteStrategy;
    }

    public String getExecutorHandler() {
        return executorHandler;
    }

    public void setExecutorHandler(String executorHandler) {
        this.executorHandler = executorHandler;
    }

    public String getExecutorParam() {
        return executorParam;
    }

    public void setExecutorParam(String executorParam) {
        this.executorParam = executorParam;
    }

    public String getExecutorBlockStrategy() {
        return executorBlockStrategy;
    }

    public void setExecutorBlockStrategy(String executorBlockStrategy) {
        this.executorBlockStrategy = executorBlockStrategy;
    }

    public Integer getExecutorTimeout() {
        return executorTimeout;
    }

    public void setExecutorTimeout(Integer executorTimeout) {
        this.executorTimeout = executorTimeout;
    }

    public Integer getExecutorFailRetryCount() {
        return executorFailRetryCount;
    }

    public void setExecutorFailRetryCount(Integer executorFailRetryCount) {
        this.executorFailRetryCount = executorFailRetryCount;
    }

    public String getGlueType() {
        return glueType;
    }

    public void setGlueType(String glueType) {
        this.glueType = glueType;
    }

    public String getGlueSource() {
        return glueSource;
    }

    public void setGlueSource(String glueSource) {
        this.glueSource = glueSource;
    }

    public String getGlueRemark() {
        return glueRemark;
    }

    public void setGlueRemark(String glueRemark) {
        this.glueRemark = glueRemark;
    }

    public Date getGlueUpdatetime() {
        return glueUpdatetime;
    }

    public void setGlueUpdatetime(Date glueUpdatetime) {
        this.glueUpdatetime = glueUpdatetime;
    }

    public String getChildJobId() {
        return childJobId;
    }

    public void setChildJobId(String childJobId) {
        this.childJobId = childJobId;
    }

    public Integer getTriggerStatus() {
        return triggerStatus;
    }

    public void setTriggerStatus(Integer triggerStatus) {
        this.triggerStatus = triggerStatus;
    }

    public Long getTriggerLastTime() {
        return triggerLastTime;
    }

    public void setTriggerLastTime(Long triggerLastTime) {
        this.triggerLastTime = triggerLastTime;
    }

    public Long getTriggerNextTime() {
        return triggerNextTime;
    }

    public void setTriggerNextTime(Long triggerNextTime) {
        this.triggerNextTime = triggerNextTime;
    }
}
