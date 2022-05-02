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
public class XxlJobLogGlue {

    public XxlJobLogGlue() {
        this.id = SnowflakeConfig.nextId();
    }

    @Id
    @Column(name = "id")
    private long id;

    @Column(name = "job_id")
    private int jobId;                // 任务主键ID

    @Column(name = "glue_type")
    private String glueType;        // GLUE类型	#com.xxl.job.core.glue.GlueTypeEnum

    @Column(name = "glue_source")
    private String glueSource;

    @Column(name = "glue_remark")
    private String glueRemark;

    @Column(name = "add_time")
    private Date addTime;

    @Column(name = "update_time")
    private Date updateTime;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
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

}
