package com.fk.shopping.dao;

import com.fk.shopping.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName UserMapper
 * @Description TODO
 * @Date 2020/4/12 14:35
 * @Created by FangKun
 */
public interface UserMapper {

    //根据用户名查询对象  登录 注册需要
    User getUsername(String username);

    //注册
    //int insertUser(@Param("username") String username,@Param("password") String password,@Param("email") String email,@Param("sex") String sex,@Param("salt") String salt);
    int insertUser(User user);

}
