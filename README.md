# 说明
原XXL-JOB 服务端 xxl-job-admin ，本项目在原基础上扩展支持其他主流数据库 sqlserver oracle  pgsql

该版本 同步 xxl-job-admin-2.3.0

- 修改了sql中mysql专用语法为通用sql语法
- 加入通用mapper 部分单表查询去除sql
- 修改表主键为手动插入
- 部分代码格式修改，根据ida提示修改

XXL-JOB分布式任务调度平台介绍 : https://gitee.com/xuxueli0323/xxl-job

# 使用
修改 application.yml中的 spring.profiles.active 属性值来选择你所用数据库
例如下面选择 pgsql数据库
```yaml
spring:
  profiles:
    active: pgsql

```

选择 pgsql则对应修改 application-pgsql.yml 里面的 jdbc地址即可

```yaml
spring:
  datasource:
    druid:
      name: xxljob23
      url: jdbc:postgresql://localhost:9019/postgres?useSSL=false
      username: postgres
      password: pg123456
```
