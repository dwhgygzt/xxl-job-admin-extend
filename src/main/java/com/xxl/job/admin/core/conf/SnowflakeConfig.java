package com.xxl.job.admin.core.conf;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import com.xxl.job.admin.core.properties.SnowflakeProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

/**
 * ID service
 *
 * @author <a href="mailto:guzhongtao@126.com">guzhongtao</a>
 * @since 2020-02-24 22:19:51
 */
@Component
public class SnowflakeConfig {
    private static final Logger logger = LoggerFactory.getLogger(SnowflakeConfig.class);

    protected static Snowflake ID_SERVICE = IdUtil.getSnowflake(1, 2);

    @Resource
    private SnowflakeProperties snowflakeProperties;

    @PostConstruct
    public void init() {
        ID_SERVICE = IdUtil.getSnowflake(
                snowflakeProperties.getWorkerId(), snowflakeProperties.getDatacenterId());
        logger.info("初始化 id生成器Snowflake 成功..., workerId={}, datacenterId={}",
                snowflakeProperties.getWorkerId(), snowflakeProperties.getDatacenterId()
        );
    }

    public static long nextId() {
        return ID_SERVICE.nextId();
    }

}
