package com.xxl.job.admin.core.model;

import org.springframework.util.StringUtils;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author xuxueli 2019-05-04 16:43:12
 */
@Table(name = "xxl_job_user")
public class XxlJobUser {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "username")
    private String username;        // 账号

    @Column(name = "password")
    private String password;        // 密码

    @Column(name = "role")
    private int role;                // 角色：0-普通用户、1-管理员

    @Column(name = "permission")
    private String permission;    // 权限：执行器ID列表，多个逗号分割

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    // plugin
    public boolean validPermission(int jobGroup) {
        if (this.role == 1) {
            return true;
        } else {
            if (StringUtils.hasText(this.permission)) {
                for (String permissionItem : this.permission.split(",")) {
                    if (String.valueOf(jobGroup).equals(permissionItem)) {
                        return true;
                    }
                }
            }
            return false;
        }

    }

}
