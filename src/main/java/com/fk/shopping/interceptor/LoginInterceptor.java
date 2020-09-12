package com.fk.shopping.interceptor;

import com.fk.shopping.entity.User;
import com.fk.shopping.service.UserService;
import com.fk.shopping.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @ClassName LoginInterceptor
 * @Description TODO   拦截器
 * @Date 2020/5/2 16:49
 * @Created by FangKun
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    UserService userService;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        // 在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
        // 返回false则不执行拦截

        //String uri = request.getRequestURI(); // 获取登录的uri，这个是不进行拦截的
        //if(session.getAttribute("user")!=null  {// 说明登录成功 或者

        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            httpServletResponse.sendRedirect("index.jsp");
            return true;
        } else {
            Cookie[] cookies = httpServletRequest.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    String name = cookie.getName();
                    if (name.equals("userinfo")) {
                        String value = cookie.getValue();
                        String[] split = value.split("#");

                        User user1 = userService.getUsername(split[0]);

                        if (user1.getPassword().equals(split[1])) {
                            session.setAttribute("user", user1);
                            httpServletRequest.getRequestDispatcher("index.jsp").forward(httpServletRequest, httpServletResponse);
                            return true;
                        } else {
                            httpServletResponse.sendRedirect("login.jsp");
                            return true;
                        }
                    }
                }
            }
        }
        httpServletResponse.sendRedirect("login.jsp");
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        // 在处理过程中，执行拦截
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        // 执行完毕，返回前拦截
    }
}
