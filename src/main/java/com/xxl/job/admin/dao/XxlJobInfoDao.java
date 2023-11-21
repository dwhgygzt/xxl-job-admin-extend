package com.xxl.job.admin.dao;

import com.xxl.job.admin.core.mapper.MyBaseMapper;
import com.xxl.job.admin.core.model.XxlJobInfo;


/**
 * job info
 *
 * @author xuxueli 2016-1-12 18:03:45
 */
public interface XxlJobInfoDao extends MyBaseMapper<XxlJobInfo> {

    Integer maxId();

}
