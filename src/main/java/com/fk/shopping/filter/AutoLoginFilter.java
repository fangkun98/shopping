package com.fk.shopping.filter;


import com.fk.shopping.entity.User;
import com.fk.shopping.service.UserService;
import com.fk.shopping.service.impl.UserServiceImpl;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @ClassName AutoLoginFilter
 * @Description TODO  过滤器
 * @Date 2020/4/26 9:28
 * @Created by FangKun
 */
public class AutoLoginFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {

        HttpSession session = httpServletRequest.getSession();
        User user = (User)session.getAttribute("user");
        if(user!=null){
            httpServletResponse.sendRedirect("index.jsp");
            return;
        }else{

            Cookie[] cookies = httpServletRequest.getCookies();
            if(cookies!=null){
                for (Cookie cookie : cookies) {
                    String name = cookie.getName();
                    if(name.equals("userinfo")){
                        String value = cookie.getValue();
                        String[] split = value.split("#");
                        UserService userService=new UserServiceImpl();
                        User user1 = userService.getUsername(split[0]);
                        if(user1.getPassword().equals(split[1])){
                            session.setAttribute("user",user1);
                            httpServletRequest.getRequestDispatcher("index.jsp").forward(httpServletRequest,httpServletResponse);
                            return;
                        }else {

                            httpServletResponse.sendRedirect("login.jsp");
                            return;
                        }
                    }
                }
            }
        }


        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }


}
