package com.fk.shopping.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @ClassName LoginData
 * @Description TODO
 * @Date 2020/4/15 9:32
 * @Created by FangKun
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginData implements Serializable {
    private static final long serialVersionUID = -7153354200545952271L;
    private  String username;
    private String password;
    private String vcode;
    private String autoLogin;
}
