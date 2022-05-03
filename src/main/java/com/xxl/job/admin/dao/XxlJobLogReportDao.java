package com.xxl.job.admin.dao;

import com.xxl.job.admin.core.mapper.MyBaseMapper;
import com.xxl.job.admin.core.model.XxlJobLogReport;

/**
 * job log
 *
 * @author xuxueli 2019-11-22
 */
public interface XxlJobLogReportDao extends MyBaseMapper<XxlJobLogReport> {


    int update(XxlJobLogReport xxlJobLogReport);


    XxlJobLogReport queryLogReportTotal();

}
