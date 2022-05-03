package com.xxl.job.admin.controller;

import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxl.job.admin.controller.annotation.PermissionLimit;
import com.xxl.job.admin.core.model.XxlJobGroup;
import com.xxl.job.admin.core.model.XxlJobUser;
import com.xxl.job.admin.core.util.I18nUtil;
import com.xxl.job.admin.dao.XxlJobGroupDao;
import com.xxl.job.admin.dao.XxlJobUserDao;
import com.xxl.job.admin.service.LoginService;
import com.xxl.job.core.biz.model.ReturnT;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xuxueli 2019-05-04 16:39:50
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private XxlJobUserDao xxlJobUserDao;
    @Resource
    private XxlJobGroupDao xxlJobGroupDao;

    @RequestMapping
    @PermissionLimit(adminuser = true)
    public String index(Model model) {

        // 执行器列表
        Example groupExample = new Example(XxlJobGroup.class);
        groupExample.orderBy("appname").orderBy("title").orderBy("id");
        List<XxlJobGroup> groupList = xxlJobGroupDao.selectByExample(groupExample);
        model.addAttribute("groupList", groupList);

        return "user/user.index";
    }

    @RequestMapping("/pageList")
    @ResponseBody
    @PermissionLimit(adminuser = true)
    public Map<String, Object> pageList(@RequestParam(required = false, defaultValue = "0") int start,
                                        @RequestParam(required = false, defaultValue = "10") int length,
                                        String username, int role) {

        // page list
        Example example = new Example(XxlJobUser.class);
        Example.Criteria criteria = example.createCriteria();
        if (StrUtil.isNotBlank(username)) {
            criteria.andLike("username", String.format("%%%s%%", username));
        }
        if (role > -1) {
            criteria.andEqualTo("role", role);
        }
        example.orderBy("id");
        PageInfo<XxlJobUser> pageInfo = PageHelper.startPage((start / length + 1), length, true)
                .doSelectPageInfo(() -> xxlJobUserDao.selectByExample(example));
        // page query
        List<XxlJobUser> list = pageInfo.getList();
        long listCount = pageInfo.getTotal();

        // filter
        if (list != null && list.size() > 0) {
            for (XxlJobUser item : list) {
                item.setPassword(null);
            }
        }
        // package result
        Map<String, Object> maps = new HashMap<>();
        maps.put("recordsTotal", listCount);        // 总记录数
        maps.put("recordsFiltered", listCount);    // 过滤后的总记录数
        maps.put("data", list);                    // 分页列表
        return maps;
    }

    @RequestMapping("/add")
    @ResponseBody
    @PermissionLimit(adminuser = true)
    public ReturnT<String> add(XxlJobUser xxlJobUser) {

        // valid username
        if (!StringUtils.hasText(xxlJobUser.getUsername())) {
            return new ReturnT<>(ReturnT.FAIL_CODE, I18nUtil.getString("system_please_input") + I18nUtil.getString("user_username"));
        }
        xxlJobUser.setUsername(xxlJobUser.getUsername().trim());
        if (!(xxlJobUser.getUsername().length() >= 4 && xxlJobUser.getUsername().length() <= 20)) {
            return new ReturnT<>(ReturnT.FAIL_CODE, I18nUtil.getString("system_lengh_limit") + "[4-20]");
        }
        // valid password
        if (!StringUtils.hasText(xxlJobUser.getPassword())) {
            return new ReturnT<>(ReturnT.FAIL_CODE, I18nUtil.getString("system_please_input") + I18nUtil.getString("user_password"));
        }
        xxlJobUser.setPassword(xxlJobUser.getPassword().trim());
        if (!(xxlJobUser.getPassword().length() >= 4 && xxlJobUser.getPassword().length() <= 20)) {
            return new ReturnT<>(ReturnT.FAIL_CODE, I18nUtil.getString("system_lengh_limit") + "[4-20]");
        }
        // md5 password
        xxlJobUser.setPassword(DigestUtils.md5DigestAsHex(xxlJobUser.getPassword().getBytes()));

        // check repeat
        Example userExample = new Example(XxlJobUser.class);
        userExample.createCriteria().andEqualTo("username", xxlJobUser.getUsername());
        XxlJobUser existUser = xxlJobUserDao.selectOneByExample(userExample);
        if (existUser != null) {
            return new ReturnT<>(ReturnT.FAIL_CODE, I18nUtil.getString("user_username_repeat"));
        }

        synchronized (this) {
            xxlJobUser.setId(xxlJobUserDao.maxId() + 1);
        }
        // write
        xxlJobUserDao.insertSelective(xxlJobUser);
        return ReturnT.SUCCESS;
    }

    @RequestMapping("/update")
    @ResponseBody
    @PermissionLimit(adminuser = true)
    public ReturnT<String> update(HttpServletRequest request, XxlJobUser xxlJobUser) {

        // avoid opt login seft
        XxlJobUser loginUser = (XxlJobUser) request.getAttribute(LoginService.LOGIN_IDENTITY_KEY);
        if (loginUser.getUsername().equals(xxlJobUser.getUsername())) {
            return new ReturnT<>(ReturnT.FAIL.getCode(), I18nUtil.getString("user_update_loginuser_limit"));
        }

        // valid password
        if (StringUtils.hasText(xxlJobUser.getPassword())) {
            String password = xxlJobUser.getPassword().trim();
            xxlJobUser.setPassword(password);
            if (password.length() < 4 || password.length() > 20) {
                return new ReturnT<>(ReturnT.FAIL_CODE, I18nUtil.getString("system_lengh_limit") + "[4-20]");
            }
            // md5 password
            xxlJobUser.setPassword(DigestUtils.md5DigestAsHex(xxlJobUser.getPassword().getBytes()));
        } else {
            xxlJobUser.setPassword(null);
        }

        // write
        xxlJobUserDao.updateByPrimaryKeySelective(xxlJobUser);
        return ReturnT.SUCCESS;
    }

    @RequestMapping("/remove")
    @ResponseBody
    @PermissionLimit(adminuser = true)
    public ReturnT<String> remove(HttpServletRequest request, int id) {

        // avoid opt login seft
        XxlJobUser loginUser = (XxlJobUser) request.getAttribute(LoginService.LOGIN_IDENTITY_KEY);
        if (loginUser.getId() == id) {
            return new ReturnT<>(ReturnT.FAIL.getCode(), I18nUtil.getString("user_update_loginuser_limit"));
        }

        xxlJobUserDao.deleteByPrimaryKey(id);
        return ReturnT.SUCCESS;
    }

    @RequestMapping("/updatePwd")
    @ResponseBody
    public ReturnT<String> updatePwd(HttpServletRequest request, String password) {

        // valid password
        if (password == null || password.trim().length() == 0) {
            return new ReturnT<>(ReturnT.FAIL.getCode(), "密码不可为空");
        }
        password = password.trim();
        if (!(password.length() >= 4 && password.length() <= 20)) {
            return new ReturnT<>(ReturnT.FAIL_CODE, I18nUtil.getString("system_lengh_limit") + "[4-20]");
        }

        // md5 password
        String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());

        // update pwd
        XxlJobUser loginUser = (XxlJobUser) request.getAttribute(LoginService.LOGIN_IDENTITY_KEY);

        // do write
        Example userExample = new Example(XxlJobUser.class);
        userExample.createCriteria().andEqualTo("username", loginUser.getUsername());
        XxlJobUser existUser = xxlJobUserDao.selectOneByExample(userExample);
        existUser.setPassword(md5Password);
        xxlJobUserDao.updateByPrimaryKeySelective(existUser);

        return ReturnT.SUCCESS;
    }

}
