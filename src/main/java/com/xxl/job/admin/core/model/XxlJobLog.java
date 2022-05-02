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
    }

    @Id
    @Column(name = "id")
    private long id;

    // job info
    @Column(name = "job_group")
    private int jobGroup;

    @Column(name = "job_id")
    private int jobId;

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
    private int executorFailRetryCount;

    // trigger info
    @Column(name = "trigger_time")
    private Date triggerTime;

    @Column(name = "trigger_code")
    private int triggerCode;

    @Column(name = "trigger_msg")
    private String triggerMsg;

    // handle info
    @Column(name = "handle_time")
    private Date handleTime;

    @Column(name = "handle_code")
    private int handleCode;

    @Column(name = "handle_msg")
    private String handleMsg;

    // alarm info
    @Column(name = "alarm_status")
    private int alarmStatus;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getJobGroup() {
        return jobGroup;
    }

    public void setJobGroup(int jobGroup) {
        this.jobGroup = jobGroup;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
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

    public int getExecutorFailRetryCount() {
        return executorFailRetryCount;
    }

    public void setExecutorFailRetryCount(int executorFailRetryCount) {
        this.executorFailRetryCount = executorFailRetryCount;
    }

    public Date getTriggerTime() {
        return triggerTime;
    }

    public void setTriggerTime(Date triggerTime) {
        this.triggerTime = triggerTime;
    }

    public int getTriggerCode() {
        return triggerCode;
    }

    public void setTriggerCode(int triggerCode) {
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

    public int getHandleCode() {
        return handleCode;
    }

    public void setHandleCode(int handleCode) {
        this.handleCode = handleCode;
    }

    public String getHandleMsg() {
        return handleMsg;
    }

    public void setHandleMsg(String handleMsg) {
        this.handleMsg = handleMsg;
    }

    public int getAlarmStatus() {
        return alarmStatus;
    }

    public void setAlarmStatus(int alarmStatus) {
        this.alarmStatus = alarmStatus;
    }

}
