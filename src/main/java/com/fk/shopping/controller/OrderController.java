package com.fk.shopping.controller;

import com.fk.shopping.entity.Address;
import com.fk.shopping.entity.Cart;
import com.fk.shopping.entity.Orders;
import com.fk.shopping.entity.User;
import com.fk.shopping.service.AddressService;
import com.fk.shopping.service.CartService;
import com.fk.shopping.service.OrdersService;
import com.fk.shopping.service.ProductService;
import com.fk.shopping.utils.MessageResults;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

/**
 * @ClassName OrderController
 * @Description TODO
 * @Date 2020/5/5 19:55
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class OrderController {
    @Resource
    OrdersService ordersService;
    @Resource
    AddressService addressService;
    @Resource
    CartService cartService;

    @RequestMapping("/toOrder")
    public String toOrder(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        int uid = user.getId();
        List<Address> addressList = addressService.getAddress(uid);
        List<Orders> ordersList = ordersService.getAllOrders(uid);

        request.setAttribute("addressList",addressList);
        request.setAttribute("ordersList",ordersList);


        return "orderDetail";
    }
    @RequestMapping("/addOrder")
    @ResponseBody
    public MessageResults addOrder(@RequestParam("address_id") Integer address_id,HttpServletRequest request){
        MessageResults results=null;

        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        int uid = user.getId();

        List<Cart> cartList = cartService.getCart(uid);
        for (Cart cart : cartList) {
            Integer pid = cart.getPid();
            String pname = cart.getPname();
            BigDecimal price = cart.getPrice();
            Integer num = cart.getSum();
            int money=((price.intValue())*num);

            Orders orders=new Orders(uid,pid,pname,num,price.toString(),String.valueOf(money),address_id);
            int i = ordersService.addOrders(orders);
            if(i>0){
                cartService.delAllCart(uid);
                results=new MessageResults(200,"下单成功");
            }else {
                results=new MessageResults(500,"下单失败");
            }

        }


        return  results;
    }

    @RequestMapping("/updateOrderStatr")
    public void updateOrderStatr(@RequestParam("id") Integer id){
        int i = ordersService.updateOrders(1, id);
    }

}
