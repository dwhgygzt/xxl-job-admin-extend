package com.xxl.job.admin.core.conf;

import cn.hutool.core.collection.CollectionUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxl.job.admin.core.alarm.JobAlarmer;
import com.xxl.job.admin.core.model.XxlJobInfo;
import com.xxl.job.admin.core.model.XxlJobLog;
import com.xxl.job.admin.core.properties.XxlJobProperties;
import com.xxl.job.admin.core.scheduler.XxlJobScheduler;
import com.xxl.job.admin.dao.*;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * xxl-job config
 *
 * @author xuxueli 2017-04-28
 */

@Component
public class XxlJobAdminConfig implements InitializingBean, DisposableBean {


    @Resource
    private XxlJobProperties xxlJobProperties;

    private String i18n;

    private String accessToken;

    private String emailFrom;

    private int triggerPoolFastMax;

    private int triggerPoolSlowMax;

    private int logretentiondays;

    private static XxlJobAdminConfig adminConfig = null;

    public static XxlJobAdminConfig getAdminConfig() {
        return adminConfig;
    }

    @PostConstruct
    public void init() {
        this.i18n = xxlJobProperties.getI18n();
        this.accessToken = xxlJobProperties.getAccessToken();
        this.emailFrom = xxlJobProperties.getEmailFrom();
        this.triggerPoolFastMax = xxlJobProperties.getTriggerPoolFastMax();
        this.triggerPoolSlowMax = xxlJobProperties.getTriggerPoolSlowMax();
        this.logretentiondays = xxlJobProperties.getLogretentiondays();
    }


    // ---------------------- XxlJobScheduler ----------------------

    private XxlJobScheduler xxlJobScheduler;

    @Override
    public void afterPropertiesSet() throws Exception {
        adminConfig = this;

        xxlJobScheduler = new XxlJobScheduler();
        xxlJobScheduler.init();
    }

    @Override
    public void destroy() throws Exception {
        xxlJobScheduler.destroy();
    }


    // ---------------------- XxlJobScheduler ----------------------

    // dao, service

    @Resource
    private XxlJobLogDao xxlJobLogDao;
    @Resource
    private XxlJobInfoDao xxlJobInfoDao;
    @Resource
    private XxlJobRegistryDao xxlJobRegistryDao;
    @Resource
    private XxlJobGroupDao xxlJobGroupDao;
    @Resource
    private XxlJobLogReportDao xxlJobLogReportDao;
    @Resource
    private DataSource dataSource;
    @Resource
    private JobAlarmer jobAlarmer;

    public List<XxlJobInfo> scheduleJobQuery(long maxNextTime, int pagesize) {
        Example example = new Example(XxlJobInfo.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("triggerStatus", 1);
        criteria.andLessThanOrEqualTo("triggerNextTime", maxNextTime);
        example.orderBy("id");
        PageInfo<XxlJobInfo> pageInfo = PageHelper.startPage(1, pagesize, false)
                .doSelectPageInfo(() -> xxlJobInfoDao.selectByExample(example));
        return pageInfo.getList();
    }

    public List<Long> findFailJobLogIds(int pagesize) {
        Example example = new Example(XxlJobLog.class);
        Example.Criteria criteria = example.createCriteria();
        example.selectProperties("id");
        example.orderBy("id");
        criteria.andEqualTo("alarmStatus", 0);
        criteria.andCondition(" (trigger_code NOT IN (0, 200) AND handle_code != 0) AND  (handle_code != 200) ");
        PageInfo<XxlJobLog> pageInfo = PageHelper.startPage(1, pagesize, false)
                .doSelectPageInfo(() -> xxlJobLogDao.selectByExample(example));
        List<XxlJobLog> logs = pageInfo.getList();
        if (CollectionUtil.isEmpty(logs)) {
            return new ArrayList<>(2);
        } else {
            return logs.stream().map(XxlJobLog::getId).collect(Collectors.toList());
        }
    }

    public List<Long> findClearLogIds(
            int jobGroup, int jobId, Date clearBeforeTime, int clearBeforeNum, int pagesize) {
        Example example = new Example(XxlJobLog.class);
        Example.Criteria criteria = example.createCriteria();
        Long limitId = null;
        example.selectProperties("id");
        if (jobGroup > 0) {
            criteria.andEqualTo("jobGroup", jobGroup);
        }
        if (jobId > 0) {
            criteria.andEqualTo("jobId", jobId);
        }
        if (clearBeforeNum > 0) {
            example.orderBy("id").desc();
            // 保留前 clearBeforeNum 条的数据
            PageInfo<XxlJobLog> pageInfo = PageHelper.startPage((clearBeforeNum / pagesize) + 1, 1, false)
                    .doSelectPageInfo(() -> xxlJobLogDao.selectByExample(example));
            List<XxlJobLog> logs = pageInfo.getList();
            if (CollectionUtil.isEmpty(logs)) {
                return new ArrayList<>(2);
            }
            limitId = logs.get(0).getId();
        }

        Example example2 = new Example(XxlJobLog.class);
        Example.Criteria criteria2 = example2.createCriteria();
        example2.selectProperties("id");
        example2.orderBy("id");
        if (clearBeforeTime != null) {
            criteria2.andLessThanOrEqualTo("triggerTime", clearBeforeTime);
        }
        if (jobGroup > 0) {
            criteria2.andEqualTo("jobGroup", jobGroup);
        }
        if (jobId > 0) {
            criteria2.andEqualTo("jobId", jobId);
        }
        if (limitId != null) {
            criteria2.andLessThanOrEqualTo("id", limitId);
        }
        PageInfo<XxlJobLog> pageInfo2 = PageHelper.startPage(1, pagesize, false)
                .doSelectPageInfo(() -> xxlJobLogDao.selectByExample(example2));
        List<XxlJobLog> logs = pageInfo2.getList();
        if (CollectionUtil.isEmpty(logs)) {
            return new ArrayList<>(2);
        } else {
            return pageInfo2.getList().stream().map(XxlJobLog::getId).collect(Collectors.toList());
        }
    }


    public String getI18n() {
        if (!Arrays.asList("zh_CN", "zh_TC", "en").contains(i18n)) {
            return "zh_CN";
        }
        return i18n;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public String getEmailFrom() {
        return emailFrom;
    }

    public int getTriggerPoolFastMax() {
        if (triggerPoolFastMax < 200) {
            return 200;
        }
        return triggerPoolFastMax;
    }

    public int getTriggerPoolSlowMax() {
        if (triggerPoolSlowMax < 100) {
            return 100;
        }
        return triggerPoolSlowMax;
    }

    public int getLogretentiondays() {
        if (logretentiondays < 7) {
            return -1;  // Limit greater than or equal to 7, otherwise close
        }
        return logretentiondays;
    }

    public XxlJobLogDao getXxlJobLogDao() {
        return xxlJobLogDao;
    }

    public XxlJobInfoDao getXxlJobInfoDao() {
        return xxlJobInfoDao;
    }

    public XxlJobRegistryDao getXxlJobRegistryDao() {
        return xxlJobRegistryDao;
    }

    public XxlJobGroupDao getXxlJobGroupDao() {
        return xxlJobGroupDao;
    }

    public XxlJobLogReportDao getXxlJobLogReportDao() {
        return xxlJobLogReportDao;
    }

    public DataSource getDataSource() {
        return dataSource;
    }

    public JobAlarmer getJobAlarmer() {
        return jobAlarmer;
    }

}
