package com.fk.shopping.controller;

import com.fk.shopping.entity.Address;
import com.fk.shopping.entity.Cart;
import com.fk.shopping.entity.Product;
import com.fk.shopping.entity.User;
import com.fk.shopping.service.AddressService;
import com.fk.shopping.service.CartService;
import com.fk.shopping.service.ProductService;
import com.fk.shopping.utils.MessageResults;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @ClassName CartController
 * @Description TODO
 * @Date 2020/5/4 14:31
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class CartController {
    @Resource
    ProductService productService;
    @Resource
    CartService cartService;
    @Resource
    AddressService addressService;

    @RequestMapping("/cart")
    @ResponseBody
    public MessageResults addCart(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String pid = request.getParameter("pid");
        MessageResults results=null;
        int add=0;
        if(user!=null){
            int uid = user.getId();
            Product productById = productService.getProductById(Integer.valueOf(pid));
            String pname = productById.getTrade();
            BigDecimal price = productById.getPrice();
            Cart cart = new Cart();
            cart.setPname(pname);
            cart.setPrice(price);
            cart.setPid(Integer.valueOf(pid));
            cart.setUid(uid);
            Cart cartByPid = cartService.getCartByPid(Integer.valueOf(pid),uid);
            if(cartByPid==null){
                add= cartService.add(cart);
            }else {
                 add = cartService.update(Integer.valueOf(pid), uid);
            }
            if(add>0){
                results=new MessageResults(200,"添加购物车成功");
            }else {
                results=new MessageResults(500,"添加购物车失败");
            }

        }else {
            results=new MessageResults(250,"未登录，即将跳转到登陆界面");

        }

        return results;
    }


    @RequestMapping("/shopCar")
    public String shopCar(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        if(user!=null) {
            int uid = user.getId();
            List<Cart> allCart = cartService.getCart(uid);
            request.setAttribute("allCart", allCart);
            return "cart";
        }else {
            return "login";
        }
    }

    @RequestMapping("/delCart")
    @ResponseBody
    public MessageResults delCart(@RequestParam("id") Integer id){
        System.out.println(id);
        MessageResults results=null;
        int del = cartService.del(id);
        if(del>0){
            results=new MessageResults(200,"删除成功");
        }else {
            results=new MessageResults(500,"删除失败");
        }
        return results;
    }

    @RequestMapping("/delAll")
    @ResponseBody
    public void delAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
            int uid = user.getId();
        int i = cartService.delAllCart(uid);
        if(i>0){
            response.sendRedirect("/shopCar");
        }
    }

    @RequestMapping("/goOrders")
    public String goOrders(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        int uid = user.getId();
        List<Cart> cartList = cartService.getCart(uid);

        List<Address> addressList = addressService.getAddress(uid);

        request.setAttribute("addressList",addressList);
        request.setAttribute("cartList",cartList);
        request.setAttribute("time",new Date());

        return "order";
    }

    @RequestMapping("/updateSum")
    public void updateSum(@RequestParam("id") Integer id,@RequestParam("sum") Integer sum){
        int i = cartService.updateSum(id, sum);
    }


}
