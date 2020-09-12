package com.fk.shopping.service;

import com.fk.shopping.entity.User;
import org.apache.ibatis.annotations.Param;

import java.security.NoSuchAlgorithmException;

/**
 * @ClassName UserService
 * @Description TODO
 * @Date 2020/4/12 15:17
 * @Created by FangKun
 */
public interface UserService {
    //根据用户名查询对象  登录 注册需要
    User getUsername(String username);

    //注册
    int insertUser(User user) throws NoSuchAlgorithmException;
}
