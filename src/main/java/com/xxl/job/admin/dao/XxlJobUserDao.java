package com.xxl.job.admin.dao;

import com.xxl.job.admin.core.mapper.MyBaseMapper;
import com.xxl.job.admin.core.model.XxlJobUser;
import org.apache.ibatis.annotations.Param;

/**
 * @author xuxueli 2019-05-04 16:44:59
 */
public interface XxlJobUserDao extends MyBaseMapper<XxlJobUser> {

    XxlJobUser loadByUserName(@Param("username") String username);

    int save(XxlJobUser xxlJobUser);

    int update(XxlJobUser xxlJobUser);

    int remove(@Param("id") int id);

    int maxId();

}
