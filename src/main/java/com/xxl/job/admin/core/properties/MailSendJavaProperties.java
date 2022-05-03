package com.xxl.job.admin.core.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 邮件发送参数配置
 *
 * @author guzt
 */
@Component
@ConfigurationProperties(prefix = "mailsend.cfg.javamail")
public class MailSendJavaProperties {


    public MailSendJavaProperties() {
        this.auth = false;
        this.timeout = 20000L;
    }

    /**
     * 邮件服务器地址
     */
    private String host;

    /**
     * 邮件服务器端口
     */
    private Integer port;

    /**
     * 格式 xxxx<user@bbb.com> 或者直接 user@bbb.com 和字段 user保持一致
     * 邮件发送人名称 遵循RFC-822标准
     */
    private String form;

    /**
     * user@bbb.com
     * 邮件发送者的邮件地址
     */
    private String user;

    /**
     * 邮件发送者的密码 或凭证
     */
    private String pass;

    /**
     * sslEnable 是否使用SSL安全连接
     */
    private Boolean sslEnable;

    /**
     * 是否需要用户名密码验证
     */
    private Boolean auth;

    /**
     * SMTP超时时长，单位毫秒，缺省值不超时
     */
    private Long timeout;


    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    public String getForm() {
        return form;
    }

    public void setForm(String form) {
        this.form = form;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Boolean getSslEnable() {
        return sslEnable;
    }

    public void setSslEnable(Boolean sslEnable) {
        this.sslEnable = sslEnable;
    }

    public Boolean getAuth() {
        return auth;
    }

    public void setAuth(Boolean auth) {
        this.auth = auth;
    }

    public Long getTimeout() {
        return timeout;
    }

    public void setTimeout(Long timeout) {
        this.timeout = timeout;
    }
}
