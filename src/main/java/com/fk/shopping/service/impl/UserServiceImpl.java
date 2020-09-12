package com.fk.shopping.service.impl;

import com.fk.shopping.dao.UserMapper;
import com.fk.shopping.entity.User;
import com.fk.shopping.service.UserService;
import com.fk.shopping.utils.MD5Utils;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * @ClassName UserServiceImpl
 * @Description TODO
 * @Date 2020/4/12 15:17
 * @Created by FangKun
 */
@Service
@Setter
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUsername(String username) {
        return userMapper.getUsername(username);
    }

    @Override
    public int insertUser(User user) throws NoSuchAlgorithmException {

        String input_password = user.getPassword();
        String salt = UUID.randomUUID().toString();
        String password = MD5Utils.hash(input_password, salt, 10000);

        user.setPassword(password);
        user.setSalt(salt);

        return userMapper.insertUser(user);
//        return userMapper.insertUser(username,password,email,sex,salt);
    }
}
