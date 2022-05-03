package com.xxl.job.admin.dao;

import com.xxl.job.admin.core.mapper.MyBaseMapper;
import com.xxl.job.admin.core.model.XxlJobUser;

/**
 * @author xuxueli 2019-05-04 16:44:59
 */
public interface XxlJobUserDao extends MyBaseMapper<XxlJobUser> {

    int maxId();

}
