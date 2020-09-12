package com.fk.shopping.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName LogOutController
 * @Description TODO
 * @Date 2020/4/26 9:33
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class LogOutController {
    //    exit
    @RequestMapping("/exit")
    public String logOut(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute("username");
        request.getSession().invalidate();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String name = cookie.getName();
                if (name.equals("userinfo")) {
                    String value = cookie.getValue();
                    System.out.println("cookie1 = " + cookie);
                    System.out.println("value = " + value);
                    cookie.setPath("/");
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);

                }
            }
        }
        return "redirect:index.jsp";
    }
}
