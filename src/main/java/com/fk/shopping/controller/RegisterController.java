package com.fk.shopping.controller;

import com.fk.shopping.entity.User;
import com.fk.shopping.service.UserService;
import com.fk.shopping.utils.MessageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

/**
 * @ClassName RegisterController
 * @Description TODO
 * @Date 2020/4/12 15:16
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class RegisterController {

    @Autowired
    private UserService userService;

    /**
     * TODO 注册
     */

    @RequestMapping("/register")
    public String registUser(User user) throws NoSuchAlgorithmException{

        System.out.println(user);
        int insert = userService.insertUser(user);
        MessageResults results=null;
        if(insert>0){
           return "login";
        }else {
            return "error";
        }
    }

    /**
     * TODO 根据name查询用户是否存在
     */

    @RequestMapping("/getUserByName")
    @ResponseBody
    public void getUserByName(String username, HttpServletResponse response) throws IOException {
        User user = userService.getUsername(username);
        PrintWriter writer = response.getWriter();
        if(user!=null){
            writer.print("1");
        }else{
            writer.print("0");
        }
    }


}
