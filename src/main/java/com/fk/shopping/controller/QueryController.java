package com.fk.shopping.controller;

import com.fk.shopping.entity.Page;
import com.fk.shopping.service.ProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName QueryController
 * @Description TODO
 * @Date 2020/5/2 19:07
 * @Created by FangKun
 */
@Controller
@Scope("prototype")
public class QueryController {

    @Resource
    private ProductService productService;

    @RequestMapping("/query")
    public String clickKind(HttpServletRequest request){
        String num = request.getParameter("pageNum");
//        System.out.println("num="+num);
        int pageNum=1;
        if(num!=null){
            pageNum=Integer.parseInt(num);
        }
        Page page=new Page(pageNum);
        String cate_id = request.getParameter("cate_id");
        String query = request.getParameter("query");
//        System.out.println("cate_id="+cate_id+"query="+query);

        //首页模糊查询
        if(cate_id==null || cate_id.length()==0){
            PageInfo productByKeyword = productService.getProductByKeyword(page, query);
            request.setAttribute("allProduct",productByKeyword);
            request.setAttribute("query",query);
        }else{
            //类别列表下的模糊查询
            if (query != null) {
                PageInfo productLike = productService.getProductLike(page, Integer.valueOf(cate_id), query);
                if(productLike!=null) {
                    request.setAttribute("allProduct", productLike);
                    request.setAttribute("query", query);
                    request.setAttribute("cate_id", cate_id);
                }
            }else {
                //类别列表查询
                PageInfo productByKindId = productService.getProductByKindId(page, Integer.valueOf(cate_id));
                if(productByKindId!=null){
                    request.setAttribute("allProduct", productByKindId);
                    request.setAttribute("cate_id", cate_id);
                }
            }
        }

        return "goodsList";
    }




}
