package com.fk.shopping.dao;

import com.fk.shopping.entity.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName OrdersMapper
 * @Description TODO
 * @Date 2020/5/5 19:03
 * @Created by FangKun
 */
public interface OrdersMapper {
    //查询
    List<Orders> getAllOrders(Integer uid);
    //修改状态
    int updateOrders(@Param("order_state") Integer order_state,@Param("id") Integer id);
    //添加
    int addOrders(Orders orders);
    //删除订单 后台管理者使用
    int delOrder(Integer id);
}
