package com.xxl.job.admin.core.properties;


import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 邮件发送参数配置
 *
 * @author guzt
 */
@Component
@ConfigurationProperties(prefix = "mailsend.cfg")
public class MailConfigProperties {

    /**
     * 服务类别 1: javaMail 2: webservice 默认javamail
     */
    private String serviceType = "1";

    /**
     * 采用javaMail发送参数
     */
    @Resource
    private MailSendJavaProperties javaMail;

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public MailSendJavaProperties getJavaMail() {
        return javaMail;
    }

    public void setJavaMail(MailSendJavaProperties javaMail) {
        this.javaMail = javaMail;
    }
}
