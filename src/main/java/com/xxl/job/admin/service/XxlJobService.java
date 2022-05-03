package com.xxl.job.admin.service;


import com.xxl.job.admin.core.model.XxlJobInfo;
import com.xxl.job.core.biz.model.ReturnT;

import java.util.Date;
import java.util.Map;

/**
 * core job action for xxl-job
 *
 * @author xuxueli 2016-5-28 15:30:33
 */
public interface XxlJobService {

    /**
     * page list
     *
     * @param start           ignore
     * @param length          ignore
     * @param jobGroup        ignore
     * @param jobDesc         ignore
     * @param executorHandler ignore
     * @param author          ignore
     * @return ignore
     */
    Map<String, Object> pageList(int start, int length, int jobGroup, int triggerStatus, String jobDesc, String executorHandler, String author);

    /**
     * add job
     *
     * @param jobInfo ignore
     * @return ignore
     */
    ReturnT<String> add(XxlJobInfo jobInfo);

    /**
     * update job
     *
     * @param jobInfo ignore
     * @return ignore
     */
    ReturnT<String> update(XxlJobInfo jobInfo);

    /**
     * remove job
     * *
     *
     * @param id ignore
     * @return ignore
     */
    ReturnT<String> remove(int id);

    /**
     * start job
     *
     * @param id ignore
     * @return ignore
     */
    ReturnT<String> start(int id);

    /**
     * stop job
     *
     * @param id ignore
     * @return ignore
     */
    ReturnT<String> stop(int id);

    /**
     * dashboard info
     *
     * @return ignore
     */
    Map<String, Object> dashboardInfo();

    /**
     * chart info
     *
     * @param startDate ignore
     * @param endDate   ignore
     * @return ignore
     */
    ReturnT<Map<String, Object>> chartInfo(Date startDate, Date endDate);

}
