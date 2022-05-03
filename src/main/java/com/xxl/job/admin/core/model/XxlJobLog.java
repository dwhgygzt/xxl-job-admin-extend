package com.xxl.job.admin.core.model;

import com.xxl.job.admin.core.conf.SnowflakeConfig;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author xuxueli 2019-05-04 16:43:12
 */
@Table(name = "xxl_job_log")
public class XxlJobLog {

    public XxlJobLog() {
        this.id = SnowflakeConfig.nextId();
        this.triggerCode = 0;
        this.handleCode = 0;
        this.alarmStatus = 0;
        this.executorFailRetryCount = 0;
    }

    @Id
    @Column(name = "id")
    private Long id;

    // job info
    @Column(name = "job_group")
    private Integer jobGroup;

    @Column(name = "job_id")
    private Integer jobId;

    // execute info
    @Column(name = "executor_address")
    private String executorAddress;

    @Column(name = "executor_handler")
    private String executorHandler;

    @Column(name = "executor_param")
    private String executorParam;

    @Column(name = "executor_sharding_param")
    private String executorShardingParam;

    @Column(name = "executor_fail_retry_count")
    private Integer executorFailRetryCount;

    // trigger info
    @Column(name = "trigger_time")
    private Date triggerTime;

    @Column(name = "trigger_code")
    private Integer triggerCode;

    @Column(name = "trigger_msg")
    private String triggerMsg;

    // handle info
    @Column(name = "handle_time")
    private Date handleTime;

    @Column(name = "handle_code")
    private Integer handleCode;

    @Column(name = "handle_msg")
    private String handleMsg;

    // alarm info
    @Column(name = "alarm_status")
    private Integer alarmStatus;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getJobGroup() {
        return jobGroup;
    }

    public void setJobGroup(Integer jobGroup) {
        this.jobGroup = jobGroup;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getExecutorAddress() {
        return executorAddress;
    }

    public void setExecutorAddress(String executorAddress) {
        this.executorAddress = executorAddress;
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

    public String getExecutorShardingParam() {
        return executorShardingParam;
    }

    public void setExecutorShardingParam(String executorShardingParam) {
        this.executorShardingParam = executorShardingParam;
    }

    public Integer getExecutorFailRetryCount() {
        return executorFailRetryCount;
    }

    public void setExecutorFailRetryCount(Integer executorFailRetryCount) {
        this.executorFailRetryCount = executorFailRetryCount;
    }

    public Integer getAlarmStatus() {
        return alarmStatus;
    }

    public void setAlarmStatus(Integer alarmStatus) {
        this.alarmStatus = alarmStatus;
    }

    public Date getTriggerTime() {
        return triggerTime;
    }

    public void setTriggerTime(Date triggerTime) {
        this.triggerTime = triggerTime;
    }

    public Integer getTriggerCode() {
        return triggerCode;
    }

    public void setTriggerCode(Integer triggerCode) {
        this.triggerCode = triggerCode;
    }

    public String getTriggerMsg() {
        return triggerMsg;
    }

    public void setTriggerMsg(String triggerMsg) {
        this.triggerMsg = triggerMsg;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    public Integer getHandleCode() {
        return handleCode;
    }

    public void setHandleCode(Integer handleCode) {
        this.handleCode = handleCode;
    }

    public String getHandleMsg() {
        return handleMsg;
    }

    public void setHandleMsg(String handleMsg) {
        this.handleMsg = handleMsg;
    }

}
