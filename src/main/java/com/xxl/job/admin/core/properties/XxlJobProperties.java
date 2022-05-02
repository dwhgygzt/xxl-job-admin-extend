package com.xxl.job.admin.core.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * XXL-JOB参数配置
 *
 * @author <a href="mailto:guzhongtao@middol.com">guzhongtao</a>
 */
@Component
@ConfigurationProperties(prefix = "xxl.job")
public class XxlJobProperties {

    private String i18n;

    private String accessToken;

    private String emailFrom;

    private int triggerPoolFastMax;

    private int triggerPoolSlowMax;

    private int logretentiondays;

    public String getI18n() {
        return i18n;
    }

    public void setI18n(String i18n) {
        this.i18n = i18n;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getEmailFrom() {
        return emailFrom;
    }

    public void setEmailFrom(String emailFrom) {
        this.emailFrom = emailFrom;
    }

    public int getTriggerPoolFastMax() {
        return triggerPoolFastMax;
    }

    public void setTriggerPoolFastMax(int triggerPoolFastMax) {
        this.triggerPoolFastMax = triggerPoolFastMax;
    }

    public int getTriggerPoolSlowMax() {
        return triggerPoolSlowMax;
    }

    public void setTriggerPoolSlowMax(int triggerPoolSlowMax) {
        this.triggerPoolSlowMax = triggerPoolSlowMax;
    }

    public int getLogretentiondays() {
        return logretentiondays;
    }

    public void setLogretentiondays(int logretentiondays) {
        this.logretentiondays = logretentiondays;
    }
}
