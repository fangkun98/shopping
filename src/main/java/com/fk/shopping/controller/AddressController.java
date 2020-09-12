package com.fk.shopping.controller;

import com.fk.shopping.entity.Address;
import com.fk.shopping.entity.User;
import com.fk.shopping.service.AddressService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @ClassName AddressController
 * @Description TODO
 * @Date 2020/5/5 10:59
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class AddressController {
    @Resource
    AddressService addressService;

    @RequestMapping("/goAddress")
    public String goAddress(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");

        int uid = user.getId();
        List<Address> addList = addressService.getAddress(uid);
//        System.out.println(addList);
        request.setAttribute("addList",addList);
        return "address";
    }


    @RequestMapping("/updateAddress")
    public void updateAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String detail = request.getParameter("detail");
        String state = request.getParameter("state");

        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        int uid = user.getId();

        Address address=new Address(Integer.valueOf(id),Integer.valueOf(uid),name,phone,province,city,detail,Integer.valueOf(state));
        int i = addressService.updateAddress(address);
        if(i>0){
            response.sendRedirect("/goAddress");
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }


    }

    @RequestMapping("/addAddress")
    public void addeAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String detail = request.getParameter("detail");


        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        int uid = user.getId();

        Address address=new Address(Integer.valueOf(uid),name,phone,province,city,detail);
        int i = addressService.addAddress(address);
        if(i>0){
            response.sendRedirect("/goAddress");
            System.out.println("添加成功");
        }else {
            System.out.println("添加失败");
        }
    }

    @RequestMapping("/delAddress")
    public void delAddress(HttpServletRequest request,HttpServletResponse response,Integer id) throws IOException {
        int i = addressService.delAddress(id);
        if(i>0){
            response.sendRedirect("/goAddress");
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
    }

    @RequestMapping("/updateState")
    public void updateState(HttpServletRequest request,HttpServletResponse response,Integer id) throws IOException {
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        int uid = user.getId();
        int i = addressService.updateState(uid,id);
        if(i>0){
            response.sendRedirect("/goAddress");
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
    }

    @RequestMapping("/getAddress")
    public  void   getAddress(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        int uid = user.getId();
        List<Address> addressList = addressService.getAddress(uid);
//        System.out.println(addressList);
        request.setAttribute("addressList",addressList);
    }


}
