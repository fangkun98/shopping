package com.fk.shopping.service;

import com.fk.shopping.entity.Page;
import com.fk.shopping.entity.Product;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @ClassName ProductService
 * @Description TODO
 * @Date 2020/4/19 19:13
 * @Created by FangKun
 */
public interface ProductService {
    //查询所有
    PageInfo getAllProduct(Page page);
    //根据id查询
     Product getProductById(Integer id);


    //类别id查询
     PageInfo getProductByKindId(Page page,Integer cate_id);
    //模糊查询
     PageInfo getProductByKeyword(Page page,String keyword);
    //类别模糊查询
     PageInfo getProductLike(Page page,Integer cate_id,String keyword);

}
