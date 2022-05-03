package com.xxl.job.admin.dao;

import com.xxl.job.admin.core.mapper.MyBaseMapper;
import com.xxl.job.admin.core.model.XxlJobLogGlue;
import org.apache.ibatis.annotations.Param;

/**
 * job log for glue
 *
 * @author xuxueli 2016-5-19 18:04:56
 */
public interface XxlJobLogGlueDao extends MyBaseMapper<XxlJobLogGlue> {

    int deleteByJobId(@Param("jobId") int jobId);

}
