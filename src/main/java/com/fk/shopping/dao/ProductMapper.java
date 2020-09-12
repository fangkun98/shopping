package com.fk.shopping.dao;

import com.fk.shopping.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName ProductMapper
 * @Description TODO
 * @Date 2020/4/19 17:25
 * @Created by FangKun
 */
public interface ProductMapper {
    //类别id查询
    public List<Product> getProductByKindId(Integer cate_id);
    //模糊查询
    public List<Product> getProductByKeyword(String keyword);
    //类别模糊查询
    public List<Product> getProductLike(@Param("cate_id") Integer cate_id, @Param("keyword") String keyword);

    //根据id查询
    public Product getProductById(Integer id);

    //查询所有
    public List<Product> getAllProduct();

}
