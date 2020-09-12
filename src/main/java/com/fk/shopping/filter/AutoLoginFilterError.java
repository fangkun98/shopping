package com.fk.shopping.filter;


import com.fk.shopping.entity.User;
import com.fk.shopping.service.UserService;
import com.fk.shopping.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @ClassName AutoLoginFilter
 * @Description TODO
 * @Date 2020/4/26 9:28
 * @Created by FangKun
 */
public class AutoLoginFilterError implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user!=null){
            System.out.println("取的session数据");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }else{
            Cookie[] cookies = request.getCookies();
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
                            System.out.println("取的cookie数据");
                            request.getRequestDispatcher("/index.jsp").forward(request,response);
                        }
                    }
                }
            }
        }


        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
