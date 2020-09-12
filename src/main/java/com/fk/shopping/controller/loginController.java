package com.fk.shopping.controller;

import com.fk.shopping.entity.LoginData;
import com.fk.shopping.entity.User;
import com.fk.shopping.service.UserService;
import com.fk.shopping.utils.MD5Utils;
import com.fk.shopping.utils.MessageResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

/**
 * @ClassName loginController
 * @Description TODO
 * @Date 2020/4/12 14:53
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class loginController {

    @Autowired
    private  UserService userService;

    @RequestMapping("/tolog")
    public String log(){
        return "login";
    }

/*
    @RequestMapping("/toindex")
    public String index(){
        return "index";
    }
*/


    /**
     * TODO 登录
     */
    @RequestMapping("/login")
    @ResponseBody
    public MessageResults loginUser(LoginData loginData, HttpSession session,HttpServletRequest request, HttpServletResponse response){
        System.out.println(loginData);
        MessageResults results=null;
        System.out.println("验证码="+session.getAttribute("captcha"));
        User user = userService.getUsername(loginData.getUsername());
        System.out.println(user);
        if(user!=null){
            String newpassword = null;
            try {
                newpassword = MD5Utils.hash(loginData.getPassword(), user.getSalt(), 10000);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
            if(user.getPassword().equals(newpassword)){
                HttpSession session1 = request.getSession();
                session1.setAttribute("user", user);

                if(loginData.getAutoLogin()!=null){

                    Cookie cookie = new Cookie("userinfo", loginData.getUsername() + "#" + newpassword);
                    cookie.setPath("/");
                    cookie.setMaxAge(60 * 60 * 24 * 7 * 2);
                    response.addCookie(cookie);

                    results=new MessageResults(200,"登录成功");
                }else {
                    results=new MessageResults(200,"登录成功");
                }
            }else {
                results=new MessageResults(300,"密码不正确，请重新输入");
            }
        }else {
            results=new MessageResults(500,"未查到该用户，请先进行注册");

        }
        return results;

    }

    /**
     * 校验验证码输入对错
     */
    @RequestMapping("/checkCode")
    @ResponseBody
    public int checkCode( String vcode, HttpSession session) throws IOException {
        if(vcode.equals(session.getAttribute("captcha"))){
            return 1;
        }else{
           return 0;
        }
    }

}
