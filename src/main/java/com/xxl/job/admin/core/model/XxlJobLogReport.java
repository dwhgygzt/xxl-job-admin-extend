package com.xxl.job.admin.core.model;

import com.xxl.job.admin.core.conf.SnowflakeConfig;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author xuxueli 2019-05-04 16:43:12
 */
@Table(name = "xxl_job_log_report")
public class XxlJobLogReport {

    public XxlJobLogReport() {
        this.id = SnowflakeConfig.nextId();
    }

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "trigger_day")
    private Date triggerDay;

    @Column(name = "running_count")
    private Integer runningCount;

    @Column(name = "suc_count")
    private Integer sucCount;

    @Column(name = "fail_count")
    private Integer failCount;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getTriggerDay() {
        return triggerDay;
    }

    public void setTriggerDay(Date triggerDay) {
        this.triggerDay = triggerDay;
    }

    public Integer getRunningCount() {
        return runningCount;
    }

    public void setRunningCount(Integer runningCount) {
        this.runningCount = runningCount;
    }

    public Integer getSucCount() {
        return sucCount;
    }

    public void setSucCount(Integer sucCount) {
        this.sucCount = sucCount;
    }

    public Integer getFailCount() {
        return failCount;
    }

    public void setFailCount(Integer failCount) {
        this.failCount = failCount;
    }
}
