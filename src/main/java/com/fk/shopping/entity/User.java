package com.fk.shopping.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName user
 * @Description TODO
 * @Date 2020/4/12 14:53
 * @Created by FangKun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    private static final long serialVersionUID = -2585051703221123286L;

    private int id;
    private String username;
    private String password;
    private String email;
    private String sex;
    private Date regist_time;
    private String salt;

    public User(String username, String password, String email, String sex, String salt) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.sex = sex;
        this.salt = salt;
    }
}
