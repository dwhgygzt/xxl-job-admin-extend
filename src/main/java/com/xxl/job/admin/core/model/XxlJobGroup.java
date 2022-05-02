package com.xxl.job.admin.core.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @author xuxueli 2019-05-04 16:43:12
 */
@Table(name = "xxl_job_group")
public class XxlJobGroup {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "app_name")
    private String appname;

    @Column(name = "title")
    private String title;

    // 执行器地址类型：0=自动注册、1=手动录入
    @Column(name = "address_type")
    private int addressType;

    // 执行器地址列表，多地址逗号分隔(手动录入)
    @Column(name = "address_list")
    private String addressList;

    @Column(name = "update_time")
    private Date updateTime;

    // 执行器地址列表(系统注册)
    @Transient
    private List<String> registryList;

    public List<String> getRegistryList() {
        if (addressList != null && addressList.trim().length() > 0) {
            registryList = new ArrayList<>(Arrays.asList(addressList.split(",")));
        }
        return registryList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAppname() {
        return appname;
    }

    public void setAppname(String appname) {
        this.appname = appname;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getAddressType() {
        return addressType;
    }

    public void setAddressType(int addressType) {
        this.addressType = addressType;
    }

    public String getAddressList() {
        return addressList;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setAddressList(String addressList) {
        this.addressList = addressList;
    }

}
