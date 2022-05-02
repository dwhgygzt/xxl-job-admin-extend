package com.xxl.job.admin.core.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * PO开发、测试环境的用户名、密码统一采用zzsoap/Spic2021
 *
 * @author <a href="mailto:guzhongtao@126.com">guzhongtao</a>
 */
@Component
@ConfigurationProperties(prefix = "id.snowflake")
public class SnowflakeProperties {

    /**
     * 机器标识
     */
    Long workerId = 1L;

    /**
     * 数据标识
     */
    Long datacenterId = 2L;

    public Long getWorkerId() {
        return workerId;
    }

    public void setWorkerId(Long workerId) {
        this.workerId = workerId;
    }

    public Long getDatacenterId() {
        return datacenterId;
    }

    public void setDatacenterId(Long datacenterId) {
        this.datacenterId = datacenterId;
    }
}
