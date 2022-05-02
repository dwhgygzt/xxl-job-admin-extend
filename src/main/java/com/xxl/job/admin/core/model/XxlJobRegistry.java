package com.xxl.job.admin.core.model;

import com.xxl.job.admin.core.conf.SnowflakeConfig;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author xuxueli 2019-05-04 16:43:12
 */
@Table(name = "xxl_job_registry")
public class XxlJobRegistry {

    public XxlJobRegistry() {
        this.id = SnowflakeConfig.nextId();
    }

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "registry_group")
    private String registryGroup;

    @Column(name = "registry_key")
    private String registryKey;

    @Column(name = "registry_value")
    private String registryValue;

    @Column(name = "update_time")
    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRegistryGroup() {
        return registryGroup;
    }

    public void setRegistryGroup(String registryGroup) {
        this.registryGroup = registryGroup;
    }

    public String getRegistryKey() {
        return registryKey;
    }

    public void setRegistryKey(String registryKey) {
        this.registryKey = registryKey;
    }

    public String getRegistryValue() {
        return registryValue;
    }

    public void setRegistryValue(String registryValue) {
        this.registryValue = registryValue;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
