package com.xxl.job.admin.dao;

import com.xxl.job.admin.core.mapper.MyBaseMapper;
import com.xxl.job.admin.core.model.XxlJobGroup;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author xuxueli on 16/9/30.
 */
public interface XxlJobGroupDao extends MyBaseMapper<XxlJobGroup> {

    List<XxlJobGroup> findAll();

    List<XxlJobGroup> findByAddressType(@Param("addressType") int addressType);

    int save(XxlJobGroup xxlJobGroup);

    int update(XxlJobGroup xxlJobGroup);

    int remove(@Param("id") int id);

    int maxId();

    XxlJobGroup load(@Param("id") int id);

}
