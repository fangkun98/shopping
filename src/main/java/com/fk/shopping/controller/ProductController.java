package com.fk.shopping.controller;

import com.fk.shopping.entity.Kind;
import com.fk.shopping.entity.Page;
import com.fk.shopping.entity.Product;
import com.fk.shopping.service.KindService;
import com.fk.shopping.service.ProductService;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


/**
 * @ClassName ProductController
 * @Description TODO
 * @Date 2020/4/19 19:14
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    KindService kindService;

    @RequestMapping("/productList")
    public String productList(HttpServletRequest request){
        String num = request.getParameter("pageNum");
        int pageNum=1;
        if(num!=null){
            pageNum=Integer.parseInt(num);
        }
        Page page=new Page(pageNum);
        PageInfo allProduct = productService.getAllProduct(page);
       request.setAttribute("allProduct",allProduct);

//            System.out.println("查询到的分页数据是" + allProduct);

        return "goodsList";
    }


    @RequestMapping("/info")
    public String productInfo(HttpServletRequest request){
        String id = request.getParameter("id");
        String cate_id = request.getParameter("cid");
//        System.out.println("id="+id+"cate_id="+cate_id);
        Product productById = productService.getProductById(Integer.valueOf(id));
//        System.out.println(productById);
        Kind kind = kindService.getKindById(Integer.valueOf(cate_id));
        request.setAttribute("kind",kind);
        request.setAttribute("productById",productById);
        return "goodsInfo";

    }

}
