package com.xxl.job.admin.dao;

import com.xxl.job.admin.core.mapper.MyBaseMapper;
import com.xxl.job.admin.core.model.XxlJobGroup;

/**
 * @author xuxueli on 16/9/30.
 */
public interface XxlJobGroupDao extends MyBaseMapper<XxlJobGroup> {

    int maxId();
}
