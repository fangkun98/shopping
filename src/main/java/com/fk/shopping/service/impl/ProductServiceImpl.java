package com.fk.shopping.service.impl;

import com.fk.shopping.dao.ProductMapper;
import com.fk.shopping.entity.Page;
import com.fk.shopping.entity.Product;
import com.fk.shopping.service.ProductService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName ProductServiceImpl
 * @Description TODO
 * @Date 2020/4/19 19:13
 * @Created by FangKun
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public PageInfo getAllProduct(Page page) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize());
        List<Product> allProduct = productMapper.getAllProduct();
        return new PageInfo(allProduct);
    }

    @Override
    public Product getProductById(Integer id) {
        return productMapper.getProductById(id);
    }

    @Override
    public PageInfo getProductByKindId(Page page, Integer cate_id) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize());
        List<Product> productByKindId = productMapper.getProductByKindId(cate_id);
        return new PageInfo(productByKindId);
    }

    @Override
    public PageInfo getProductByKeyword(Page page, String keyword) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize());
        String keywords="%"+keyword+"%";
        List<Product> productByKeyword = productMapper.getProductByKeyword(keywords);
        return new PageInfo(productByKeyword);
    }

    @Override
    public PageInfo getProductLike(Page page, Integer cate_id, String keyword) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize());
        String keywords="%"+keyword+"%";
        List<Product> productByKeyword = productMapper.getProductLike(cate_id,keywords);
        return new PageInfo(productByKeyword);
    }

}
